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
    @IBAction func buttonShowClick(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let detailsViewController = storyBoard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        self.present(detailsViewController, animated:true, completion:nil)
        
        
    }
}

