import { DocumentData, DocumentReference, FieldValue, Firestore, WriteResult } from "@google-cloud/firestore";
import { FirebaseAdmin } from "./firebase_admin";
import { unNull } from "../utils/null_safety_utils";

export class DatabaseService {
  readonly uid : string;
  readonly db : Firestore;
  private static readonly instances = new Map<string, DatabaseService>();

  private constructor(uid: string) {
    this.uid = uid;
    this.db = FirebaseAdmin.getInstance().getFirestore();
  }

  static async getInstanceFor(uid: string) : Promise<DatabaseService> {
    if (!DatabaseService.instances.get(uid)) {
      DatabaseService.instances.set(uid, new DatabaseService(uid));
    }
    
    const service = DatabaseService.instances.get(uid);
    const checkedService = unNull(service, `A DatabaseService instance was not found for uid: ${uid}`) as DatabaseService;

    return checkedService;
  }

  async save(entry: DatabaseEntry) : Promise<WriteResult> {
    return this.db.doc(entry.path).set(entry.data, {merge: true});
  }

  async saveFailure(error: Error, entry: DatabaseEntry) : Promise<DocumentReference<DocumentData>> {
    return this.db.collection(`processing_failures`).add({
      error: JSON.stringify(error, Object.getOwnPropertyNames(error)),
      type: 'AuthToken',
      createdOn: FieldValue.serverTimestamp(),
      data: {
        uid: this.uid,
        entry: entry,
      },
    });
  }
}
