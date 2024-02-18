//
//  ViewController.swift
//  DemoCoreDataProject
//
//  Created by Ayushi Raj on 02/12/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var txtCity: UITextField!
    
    @IBOutlet weak var txtAddress: UITextField!
    
    @IBOutlet weak var txtMobile: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buttonSaveClick(_ sender: Any) {
        let dictionary =  ["name": txtName.text,
                           "city": txtCity.text,
                           "address": txtAddress.text,
                           "mobile": txtMobile.text]
        DatabaseHelper.shareInstance.save(object: dictionary as![String:String])
    }
    
}

