//
//  FirstViewController.swift
//  os_hw_protocal
//
//  Created by 許宸禎 on 2019/11/4.
//  Copyright © 2019 許宸禎. All rights reserved.
//

import UIKit
import RxSwift

class FirstViewController: UIViewController {

    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var SwitchButton: UIButton!
    
    var disposeBag = DisposeBag()
    
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
        
        SecondVC.selectCharacter.subscribe(onNext: {
            [weak self] character in self?.label1.text = "\(character)"
            self?.view.backgroundColor = UIColor.red
        }).disposed(by: disposeBag)
        
            self.present(SecondVC, animated: true, completion: nil)
            
    }
}
    

/*extension FirstViewController : ThirdDelegate{
    func translateData(Number: String?) {
        label1.text = Number
        self.view.backgroundColor = UIColor.red
    }
}*/

