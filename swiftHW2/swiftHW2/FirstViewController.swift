//
//  FirstViewController.swift
//  swiftHW2
//
//  Created by 許宸禎 on 2019/11/19.
//  Copyright © 2019 許宸禎. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {


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
            
            User.login(username: nameField.text!, password: passwordField.text!){
                result in
                switch result {
                case 0:
                    let board = UIStoryboard(name: "Main", bundle: nil)
                    let SecondVC = board.instantiateViewController(identifier: "SecondViewController") as!SecondViewController
                        self.present(SecondVC, animated: true, completion: nil)
                default:
                    self.hintLabel.text = "Wrong User or Password"
                }
            }
        }else{
            self.hintLabel.text = "You Should Input Data!"
        }
    }
}
