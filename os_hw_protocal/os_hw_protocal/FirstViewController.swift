//
//  FirstViewController.swift
//  os_hw_protocal
//
//  Created by 許宸禎 on 2019/11/4.
//  Copyright © 2019 許宸禎. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var SwitchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    }

    @IBAction func SwitchButtonClick(_ sender: UIButton) {
        let board = UIStoryboard(name: "Main", bundle: nil)
        let SecondVC = board.instantiateViewController(identifier: "SecondViewController") as!SecondViewController
        
        if let text = label1.text{
            SecondVC.count = Int(text)!+1
        }
        
        SecondVC.delegate = self
        
        self.present(SecondVC, animated: true, completion: nil)
        
        
    }
    
}

extension FirstViewController : SecondDelegate{
    func translateData(Number: String?) {
        label1.text = Number
        self.view.backgroundColor = UIColor.red
        print(Number)
    }
}
