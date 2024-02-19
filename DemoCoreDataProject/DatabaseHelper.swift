//
//  DatabaseHelper.swift
//  DemoCoreDataProject
//
//  Created by Ayushi Raj on 02/12/21.
//

import Foundation
import CoreData
import UIKit

class DatabaseHelper {
    
    static var shareInstance = DatabaseHelper()
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func save (object:[String:String]){
        let student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context!)as! Student
        student.name = object["name"]
        student.address = object["address"]
        student.city = object["city"]
        student.mobile = object["mobile"]
        do {
            try context?.save()
              print("successfully saved")
          } catch {
              print("Could not save")
          }
        
        
       
    }
   
}
