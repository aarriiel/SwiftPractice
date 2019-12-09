//
//  ViewController.swift
//  SwiftLast
//
//  Created by 許宸禎 on 2019/12/6.
//  Copyright © 2019 許宸禎. All rights reserved.
//

import UIKit
import Alamofire
//https://opendata.cwb.gov.tw/api/v1/rest/datastore/F-C0032-001?Authorization=CWB-CE8D0CFC-BBC6-4A3E-A6CA-EFF135224A9F&format=JSON&locationName=

class ViewController: UIViewController {
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var city1: UITextField!
    @IBOutlet weak var city2: UITextField!
    @IBOutlet weak var city3: UITextField!
    @IBOutlet weak var hintLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func searchButtonOnClick(_ sender: Any) {
        
        if(city1.text != "" || city2.text != "" || city3.text != ""){
            if(city1.text != ""){
                NetUtil.get(city: city1.text!){
                    result in
                    if(self.city2.text != ""){
                        NetUtil.get(city: self.city2.text!){
                            result in
                            if(self.city3.text != ""){
                                NetUtil.get(city: self.city3.text!){
                                    result in
                                        self.switchPage()

                                }
                            }else{
                                self.switchPage()
                            }
                        }
                    }else{
                        self.switchPage()
                    }
                }
            }
        }
        else{
            hintLabel.text = "請輸入資料!"
        }
    }
    func switchPage(){
        let board = UIStoryboard(name: "Main", bundle: nil)
        let SecondVC = board.instantiateViewController(identifier: "SecondViewController") as!SecondViewController
        self.navigationController?.pushViewController(SecondVC, animated: true)
        //self.present(SecondVC, animated: true, completion: nil)
    }
}

