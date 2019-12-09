//
//  ThirdViewController.swift
//  os_hw_protocal
//
//  Created by 許宸禎 on 2019/11/4.
//  Copyright © 2019 許宸禎. All rights reserved.
//

import UIKit

protocol ThirdDelegate : class {
    func translateData(Number : String?)
}

class ThirdViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var SwitchButton: UIButton!
    var count : Int = 0
    var delegate : ThirdDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        label1.text = String(count)
    }

    @IBAction func SwitchButtonClick(_ sender: UIButton) {
        delegate?.translateData(Number: String((Int(label1.text!)!)+1))
    self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
}
