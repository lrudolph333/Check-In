//
//  LogInViewController.swift
//  Check-In
//
//  Created by Lee Rudolph on 11/21/20.
//  Copyright © 2020 Check-In. All rights reserved.
//

import UIKit
import FirebaseFirestore

class LogInViewController: UIViewController {

    @IBOutlet weak var LoginButtonOutlet: UIButton!
    @IBOutlet weak var EnterUsernameOutlet: UITextField!
    var username : String?
    let db = Firestore.firestore()
    var ref: DocumentReference? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        LoginButtonOutlet.isEnabled = false;

        //Trey has been here :)li
        // Do any additional setup after loading the view.
    }    
    
    @IBAction func UsernameEdit(_ sender: Any) {
        if let newUsername = EnterUsernameOutlet.text {
            username = newUsername;
            LoginButtonOutlet.isEnabled = (newUsername != "");
        }
    }
    
    @IBAction func LoginButtonClicked(_ sender: Any) {
        ref = db.collection("users").addDocument(data: [
            "username": EnterUsernameOutlet.text ?? "nousername",
            "favorites": []
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(self.ref!.documentID)")
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
