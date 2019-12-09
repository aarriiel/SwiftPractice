//
//  DetailsTableViewCell.swift
//  SwiftLast
//
//  Created by 許宸禎 on 2019/12/9.
//  Copyright © 2019 許宸禎. All rights reserved.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var weatherElement: UILabel!
    @IBOutlet weak var weatherTable: UITableView!
    override func awakeFromNib() {
        super.awakeFromNib()
        weatherTable.delegate = self
        weatherTable.dataSource = self
        weatherTable.register(DetailsTableViewCell.self, forCellReuseIdentifier: "TCell")
        weatherTable.register(UINib(nibName:"TimeTableViewCell", bundle:nil),
        forCellReuseIdentifier:"TCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension DetailsTableViewCell: UITableViewDelegate, UITableViewDataSource{

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (CityData.getCity()[DescribeViewController.count].currentWeather?.records.location[0].weatherElement[DescribeViewController.count].time.count)!
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TCell", for: indexPath) as! TimeTableViewCell

        cell.startTime.text = "Start: " + (CityData.getCity()[DescribeViewController.count].currentWeather?.records.location[0].weatherElement[DescribeViewController.count].time[indexPath.row].startTime)!
        cell.endTime.text = "End: " + (CityData.getCity()[DescribeViewController.count].currentWeather?.records.location[0].weatherElement[DescribeViewController.count].time[indexPath.row].endTime)!
        
        var parameter = ""
        
        for (_,value) in (CityData.getCity()[DescribeViewController.count].currentWeather?.records.location[0].weatherElement[DescribeViewController.count].time[indexPath.row].parameter)!{
            parameter = parameter + value
        }
        
        cell.parameter.text = parameter
        return cell
    }
}


