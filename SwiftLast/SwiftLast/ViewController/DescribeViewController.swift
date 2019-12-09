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
    @IBOutlet weak var city: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewCon.delegate = self
        tableViewCon.dataSource = self
        tableViewCon.register(TimeTableViewCell.self, forCellReuseIdentifier: "TCell")
        tableViewCon.register(UINib(nibName:"TimeTableViewCell", bundle:nil),
        forCellReuseIdentifier:"TCell")
        city.text = (CityData.getCity()[DescribeViewController.count].currentWeather?.records.location[0].locationName)
        self.navigationItem.title = "DETAILS"
        self.navigationItem.hidesBackButton = true
            navigationItem.leftBarButtonItem = UIBarButtonItem(title: "back", style: .plain, target: self,action: #selector(back(sender:)))
        }
        
        @objc func back(sender: UIBarButtonItem) {
                self.navigationController?.popViewController(animated: true)
        }
}


extension DescribeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch (section) {
            case 0:
                return (CityData.getCity()[DescribeViewController.count].currentWeather?.records.location[0].weatherElement[0].elementName)
            case 1:
                return (CityData.getCity()[DescribeViewController.count].currentWeather?.records.location[0].weatherElement[1].elementName)
            case 2:
                return (CityData.getCity()[DescribeViewController.count].currentWeather?.records.location[0].weatherElement[2].elementName)
            case 3:
                return (CityData.getCity()[DescribeViewController.count].currentWeather?.records.location[0].weatherElement[3].elementName)
            case 4:
                return (CityData.getCity()[DescribeViewController.count].currentWeather?.records.location[0].weatherElement[4].elementName)
            default:
                return nil
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: //Banner
            return ((CityData.getCity()[DescribeViewController.count].currentWeather?.records.location[0].weatherElement[0].time.count)!)
        case 1: //推薦餐廳
            return ((CityData.getCity()[DescribeViewController.count].currentWeather?.records.location[0].weatherElement[1].time.count)!)
        case 2: //熱門餐停
            return ((CityData.getCity()[DescribeViewController.count].currentWeather?.records.location[0].weatherElement[2].time.count)!)
        case 3: //其他普通餐廳
            return ((CityData.getCity()[DescribeViewController.count].currentWeather?.records.location[0].weatherElement[3].time.count)!)
        case 4:
            return ((CityData.getCity()[DescribeViewController.count].currentWeather?.records.location[0].weatherElement[4].time.count)!)
        default:
            return 5
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TCell", for: indexPath) as! TimeTableViewCell

        if(indexPath.section==0){
            cell.startTime.text = "Start: " + (CityData.getCity()[DescribeViewController.count].currentWeather?.records.location[0].weatherElement[0].time[indexPath.row].startTime)!
            cell.endTime.text = "End: " + (CityData.getCity()[DescribeViewController.count].currentWeather?.records.location[0].weatherElement[0].time[indexPath.row].endTime)!
            
            var parameter = ""
            
            for (_,value) in (CityData.getCity()[DescribeViewController.count].currentWeather?.records.location[0].weatherElement[0].time[indexPath.row].parameter)!{
                parameter = parameter + value
            }
            
            cell.parameter.text = parameter
        }else if(indexPath.section==1){
            cell.startTime.text = "Start: " + (CityData.getCity()[DescribeViewController.count].currentWeather?.records.location[0].weatherElement[1].time[indexPath.row].startTime)!
            cell.endTime.text = "End: " + (CityData.getCity()[DescribeViewController.count].currentWeather?.records.location[0].weatherElement[1].time[indexPath.row].endTime)!
            
            var parameter = ""
            
            for (_,value) in (CityData.getCity()[DescribeViewController.count].currentWeather?.records.location[0].weatherElement[1].time[indexPath.row].parameter)!{
                parameter = parameter + value
            }
            
            cell.parameter.text = parameter
        }else if(indexPath.section==2){
            cell.startTime.text = "Start: " + (CityData.getCity()[DescribeViewController.count].currentWeather?.records.location[0].weatherElement[2].time[indexPath.row].startTime)!
            cell.endTime.text = "End: " + (CityData.getCity()[DescribeViewController.count].currentWeather?.records.location[0].weatherElement[2].time[indexPath.row].endTime)!
            
            var parameter = ""
            
            for (_,value) in (CityData.getCity()[DescribeViewController.count].currentWeather?.records.location[0].weatherElement[2].time[indexPath.row].parameter)!{
                parameter = parameter + value
            }
            
            cell.parameter.text = parameter
        }else if(indexPath.section==3){
            cell.startTime.text = "Start: " + (CityData.getCity()[DescribeViewController.count].currentWeather?.records.location[0].weatherElement[3].time[indexPath.row].startTime)!
            cell.endTime.text = "End: " + (CityData.getCity()[DescribeViewController.count].currentWeather?.records.location[0].weatherElement[3].time[indexPath.row].endTime)!
            
            var parameter = ""
            
            for (_,value) in (CityData.getCity()[DescribeViewController.count].currentWeather?.records.location[0].weatherElement[3].time[indexPath.row].parameter)!{
                parameter = parameter + value
            }
            
            cell.parameter.text = parameter
        }else if(indexPath.section==4){
            cell.startTime.text = "Start: " + (CityData.getCity()[DescribeViewController.count].currentWeather?.records.location[0].weatherElement[4].time[indexPath.row].startTime)!
            cell.endTime.text = "End: " + (CityData.getCity()[DescribeViewController.count].currentWeather?.records.location[0].weatherElement[4].time[indexPath.row].endTime)!
            
            var parameter = ""
            
            for (_,value) in (CityData.getCity()[DescribeViewController.count].currentWeather?.records.location[0].weatherElement[4].time[indexPath.row].parameter)!{
                parameter = parameter + value
            }
            
            cell.parameter.text = parameter
        }
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
}
