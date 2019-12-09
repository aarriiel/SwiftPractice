//
//  SecondViewController.swift
//  swift_hw2
//
//  Created by 許宸禎 on 2019/11/16.
//  Copyright © 2019 許宸禎. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController{
    
    @IBOutlet weak var tabelViewCon: UITableView!
    @IBOutlet weak var logOutButton: UIButton!
    var personData : [PersonData] = [
        PersonData(type: "Name:",describe: "Ariel"),
        PersonData(type: "Gender:",describe: "female"),
        PersonData(type: "Phone Number:",describe: "0929059279"),
        PersonData(type: "Relationship status:",describe: "In a relationship"),
        PersonData(type: "Description:",describe: "After the night I burned all memory, my dream becomes transparent, as I trashed all yesterdays, my step becomes lighter."),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabelViewCon.delegate = self
        tabelViewCon.dataSource = self

        tabelViewCon.register(TestTableViewCell.self, forCellReuseIdentifier: "Cell")
        tabelViewCon.register(UINib(nibName:"TestTableViewCell", bundle:nil),
        forCellReuseIdentifier:"Cell")
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func logOutOnClick(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource{

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TestTableViewCell

        cell.type?.text = personData[indexPath.row].type
        cell.describe?.text = personData[indexPath.row].describe
        return cell
    }
}
