//
//  DetailsViewController.swift
//  DemoCoreDataProject
//
//  Created by Test on 18/02/24.
//

import Foundation
import UIKit
import CoreData

class DetailsViewController: UIViewController, NSFetchedResultsControllerDelegate {
    @IBOutlet weak var tableView: UITableView!
    var currentSelectedIndex : Int?
    var item : [Student] = []
    var isExpanded = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib.init(nibName:"DetailVCTableViewCell" , bundle: nil), forCellReuseIdentifier: "DetailVCTableViewCell")
        let fetchRequest: NSFetchRequest<Student> = Student.fetchRequest()

            do {
                // Peform Fetch Request
                let students = try DatabaseHelper.shareInstance.context!.fetch(fetchRequest)

                print(students)
                item = students
            } catch {
                print("Unable to Fetch Workouts, (\(error))")
    }
        
    }
}

extension DetailsViewController: UITableViewDelegate,UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }
    
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailVCTableViewCell", for: indexPath) as!  DetailVCTableViewCell
    cell.nameLabel?.text = item[indexPath.row].name
    cell.addressLabel?.text = item[indexPath.row].address
    cell.cityLabel?.text = item[indexPath.row].city
    cell.mobileLabel?.text = item[indexPath.row].mobile
    
        cell.selectionStyle = .none
       return cell
}
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Student List"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            UITableView.automaticDimension
        }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            DatabaseHelper.shareInstance.context!.delete(item[indexPath.row] as NSManagedObject)

            // remove the item from the data model
            item.remove(at: indexPath.row)

            // delete the table view row
            tableView.deleteRows(at: [indexPath], with: .fade)
}
}
