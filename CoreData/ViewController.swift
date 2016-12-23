//
//  ViewController.swift
//  CoreData
//
//  Created by Florenz Erstling on 22.12.16.
//  Copyright © 2016 Florenz. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtDesc: UITextField!
    
    @IBOutlet weak var txtImg: UITextField!
    @IBOutlet weak var txtLong: UITextField!
    @IBOutlet weak var txtLang: UITextField!
    
    let moContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        
    func saveData(){
        
        // Get Description
        //let storeDescription = NSEntityDescription.entityForName("Store", inManagedObjectContext: moContext!)

        //let store = Store(entity: storeDescription!, insertIntoManagedObjectContext: moContext)
        let newContact = NSEntityDescription.insertNewObject(forEntityName: "Store", into: moContext)
        
        newContact.setValue(txtName.text, forKey: "sName")
        newContact.setValue(txtDesc.text, forKey: "sDesc")
        newContact.setValue(txtImg.text, forKey: "sImg")
        newContact.setValue(txtLong.text, forKey: "sLang")
        newContact.setValue(txtLang.text, forKey: "sLat")
                
        do {
            try moContext.save()
            print("saved")
        }
        catch {
            print("nein")
        }
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

