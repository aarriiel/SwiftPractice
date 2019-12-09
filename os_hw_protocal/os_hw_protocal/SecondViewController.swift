//
//  SecondViewController.swift
//  os_hw_protocal
//
//  Created by 許宸禎 on 2019/11/4.
//  Copyright © 2019 許宸禎. All rights reserved.
//

import UIKit

protocol SecondDelegate : class {
    func translateData(Number : String?)
}

class SecondViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var SwitchButton: UIButton!
    var count : Int = 0
    var pass : Int?
    var delegate : SecondDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        label1.text = String(count)
    }

    @IBAction func SwitchButtonClick(_ sender: UIButton) {
        let board = UIStoryboard(name: "Main", bundle: nil)
        let ThirdVC = board.instantiateViewController(identifier: "ThirdViewController") as!ThirdViewController
        
        if let text = label1.text{
            ThirdVC.count = Int(text)!+1
        }
        ThirdVC.delegate = self
    
        self.present(ThirdVC, animated: true, completion: nil)
    }
    
    
}

extension SecondViewController : ThirdDelegate{
func translateData(Number: String?) {
    delegate?.translateData(Number: Number)
    }
}
