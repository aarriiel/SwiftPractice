//
//  SecondViewController.swift
//  os_hw_protocal
//
//  Created by 許宸禎 on 2019/11/4.
//  Copyright © 2019 許宸禎. All rights reserved.
//

import UIKit
import RxSwift

class SecondViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var SwitchButton: UIButton!
    var disposeBag = DisposeBag()
    var count : Int = 0
    
    let countVariable = Variable<Int>(0)
    var selectCharacter:Observable<Int>{
        return countVariable.asObservable()
    }
    
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
        
        ThirdVC.selectCharacter.subscribe(onNext: {
            [weak self] character in self?.countVariable.value=character
        }).disposed(by: disposeBag)
        
        
        self.present(ThirdVC, animated: true, completion: nil)
    }
    
}
