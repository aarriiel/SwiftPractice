//
//  SecondViewController.swift
//  SwiftLast
//
//  Created by 許宸禎 on 2019/12/7.
//  Copyright © 2019 許宸禎. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {


    @IBOutlet weak var tableViewCon: UITableView!
    
    var cityData : [Data] = CityData.getCity()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewCon.delegate = self
        tableViewCon.dataSource = self
        tableViewCon.register(TestTableViewCell.self, forCellReuseIdentifier: "Cell")
        tableViewCon.register(UINib(nibName:"TestTableViewCell", bundle:nil),
        forCellReuseIdentifier:"Cell")
        // Do any additional setup after loading the view.
        
        self.navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "back", style: .plain, target: self,action: #selector(back(sender:)))
        self.navigationItem.title = "RESULT"
    }
    
    @objc func back(sender: UIBarButtonItem) {
            CityData.clearCity()
            self.navigationController?.popViewController(animated: true)
    }
}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource{

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TestTableViewCell

        cell.type?.text = cityData[indexPath.row].type
        cell.describe?.text = cityData[indexPath.row].describe
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        DescribeViewController.count = indexPath.row
        print(CityData.getCity()[DescribeViewController.count].describe)
        if(CityData.getCity()[DescribeViewController.count].describe=="Success"){
            let board = UIStoryboard(name: "Main", bundle: nil)
            let vc = board.instantiateViewController(identifier: "DescribeViewController") as!DescribeViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
            let board = UIStoryboard(name: "Main", bundle: nil)
            let vc = board.instantiateViewController(identifier: "FailureViewController") as!FailureViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
