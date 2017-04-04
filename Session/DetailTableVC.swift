//
//  DetailTableVC.swift
//  Session
//
//  Created by techmaster on 4/4/17.
//  Copyright © 2017 Vinh The. All rights reserved.
//

import UIKit

class DetailTableVC: UITableViewController {
    var informations = [Location]()
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.informations.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomeCell
        let location: Location = self.informations[indexPath.row]
        cell.txt_Name.text = location.name
        cell.txt_District.text = location.district
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "detailVC") as! DetailVC
        detailVC.informations = informations
        navigationController?.pushViewController(detailVC, animated: true)
    }



}
