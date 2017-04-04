//
//  DetailVC.swift
//  Session
//
//  Created by techmaster on 4/4/17.
//  Copyright © 2017 Vinh The. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    var informations = [Location]()
    @IBOutlet weak var txt_Id: UILabel!
    @IBOutlet weak var txt_Name: UILabel!
    @IBOutlet weak var txt_Address: UILabel!
    @IBOutlet weak var txt_Octime: UILabel!
    @IBOutlet weak var txt_Rate: UILabel!
    @IBOutlet weak var txt_Lat: UILabel!
    @IBOutlet weak var txt_Long: UILabel!
    @IBOutlet weak var txt_Type: UILabel!
    @IBOutlet weak var txt_District: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txt_Id.text = String(informations[0].id)
        txt_Name.text = informations[0].name
        txt_Address.text = informations[0].address
        txt_Octime.text = informations[0].octime
        txt_Rate.text = String(informations[0].rate)
        txt_Lat.text = String(informations[0].lat)
        txt_Long.text = String(informations[0].long)
        txt_Type.text = informations[0].type
        txt_District.text = informations[0].district
    }


}
