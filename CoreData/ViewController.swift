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
    
    var store: Store?
    
    @IBAction func saveBtn(_ sender: UIButton) {
        saveData()
    }
    

    let moContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkIfDataExistAndWriteItnoTextfield()
        
        saveData()

    }
    
    func checkIfDataExistAndWriteItnoTextfield() {
        
        if let s = store {

            txtName.text = s.sName
            txtDesc.text = s.sDesc
        }

    }
    
    func saveData(){
        
        if store == nil {
        
            // Get Description
            let storeDescription = NSEntityDescription.entity(forEntityName: "Store", in: moContext)
        
            //let store = Store(entity: storeDescription!, insertIntoManagedObjectContext: moContext)
            //let newContact = NSEntityDescription.insertNewObject(forEntityName: "Store", into: moContext)
        
            store = Store(entity: storeDescription!, insertInto: moContext)
            
        }
        
        store?.sName = txtName.text
        store?.sDesc = txtDesc.text
        store?.sLat = txtLang.text
        store?.sLang = txtLang.text
        
        
        do {
            try moContext.save()
            print("saved")
        }
        catch {
            print("nein")
        }
        
    }



}

