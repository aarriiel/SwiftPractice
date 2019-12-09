//
//  ViewController.swift
//  swift_hw2
//
//  Created by 許宸禎 on 2019/11/15.
//  Copyright © 2019 許宸禎. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    struct User: Codable {
        struct User: Codable {
            var user: String
            var pwd: String
        }
        var resultCount: Int
        var results: [User]
    }

    @IBOutlet weak var hintLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    
    
        // Do any additional setup after loading the view.
    }

    @IBAction func signInOnClick(_ sender: Any) {
        if(nameField.text != "" && passwordField.text != ""){
        Alamofire.request("http://127.0.0.1:8000/api/user/").validate().responseJSON{
           (response) in
           if response.result.isSuccess{
               if let results = response.result.value as? [[String: String]]{
                   print(results)
                   for user in results{
                    if (user["user"]==self.nameField.text){
                           print("find it")
                        if(user["pwd"]==self.passwordField.text){
                               print("Correct")
                                let board = UIStoryboard(name: "Main", bundle: nil)
                                let SecondVC = board.instantiateViewController(identifier: "SecondViewController") as!SecondViewController
                                self.present(SecondVC, animated: true, completion: nil)
                           }
                       }
                   }
                   self.hintLabel.text = "Wrong User Or Password!"
               }
           }
        }
    }
    else {
        self.hintLabel.text = "You Should Input Data!"
    }
}

}


