//
//  FailureViewController.swift
//  SwiftLast
//
//  Created by 許宸禎 on 2019/12/9.
//  Copyright © 2019 許宸禎. All rights reserved.
//

import UIKit

class FailureViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "LOSER:D"
        self.navigationItem.hidesBackButton = true
            navigationItem.leftBarButtonItem = UIBarButtonItem(title: "back", style: .plain, target: self,action: #selector(back(sender:)))
        }
        
        @objc func back(sender: UIBarButtonItem) {
                self.navigationController?.popViewController(animated: true)
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
