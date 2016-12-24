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
        
        if let s = store {
            
            txtName.text = s.sName
            txtDesc.text = s.sDesc
            
        }
        
        saveData()

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
            
        
        
        //newContact.setValue(txtName.text, forKey: "sName")
        //newContact.setValue(txtImg.text, forKey: "sLang")
        //newContact.setValue(txtLong.text, forKey: "sLat")
        //newContact.setValue(txtLang.text, forKey: "sDesc")
        
        //let img = UIImage(named: "lama.jpeg")
        //let imgData = UIImageJPEGRepresentation(img!,1)
        
        //store.sImage = imgData
        
        
        do {
            try moContext.save()
            print("saved")
        }
        catch {
            print("nein")
        }
        
    }



}

