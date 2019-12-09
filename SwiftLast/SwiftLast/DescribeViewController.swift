//
//  DescribeViewController.swift
//  SwiftLast
//
//  Created by 許宸禎 on 2019/12/7.
//  Copyright © 2019 許宸禎. All rights reserved.
//

import UIKit

class DescribeViewController: UIViewController {
    
    static var count: Int = 0;

    @IBOutlet weak var tableViewCon: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewCon.delegate = self
        tableViewCon.dataSource = self
        tableViewCon.register(DetailsTableViewCell.self, forCellReuseIdentifier: "DCell")
        tableViewCon.register(UINib(nibName:"DetailsTableViewCell", bundle:nil),
        forCellReuseIdentifier:"DCell")
        // Do any additional setup after loading the view.
    }
    

}

extension DescribeViewController: UITableViewDelegate, UITableViewDataSource{

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (CityData.getCity()[DescribeViewController.count].currentWeather?.records.location[0].weatherElement.count)!
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DCell", for: indexPath) as! DetailsTableViewCell

        cell.weatherElement.text = CityData.getCity()[DescribeViewController.count].currentWeather?.records.location[0].weatherElement[indexPath.row].elementName
        return cell
    }
}

