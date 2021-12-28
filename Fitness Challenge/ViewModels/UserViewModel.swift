//
//  UserViewModel.swift
//  Fitness Challenge
//
//  Created by Dave Pope on 28/12/2021.
//

import Foundation
import Firebase

class UserViewModel: ObservableObject {
    
    @Published var list = [User]()
    
    func getData() {
        
        // Get a reference to the database
        let db = Firestore.firestore()
        
        // Read the document at a specific path
        db.collection("User").getDocuments { snapshot, error in
            
            // Check for errors
            if error == nil {
                
                //no errors
                if let snapshot = snapshot {
                    
                    // Update the list property in the main thread
                    DispatchQueue.main.async {
                        
                        // Get all the documents and create Users
                        self.list = snapshot.documents.map { d in
                            
                            // Create a User item for each document returned
                            return User(id: d.documentID,
                                        avatar: d["avatar"] as? String ?? "",
                                        medal: d["medal"] as? String ?? "",
                                        name: d["name"] as? String ?? "",
                                        position: d["position"] as? Int ?? 0,
                                        time: d["time"] as? String ?? ""
                            )
                        }
                    }
                }
            }
            else {
                
            }
        }
    }
    
}
