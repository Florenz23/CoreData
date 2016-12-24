//
//  StoreListTVCTableViewController.swift
//  CoreDataExample
//
//  Created by Norbert Erstling on 23.12.16.
//  Copyright © 2016 Florenz. All rights reserved.
//

import UIKit
import CoreData


class StoreListTVCTableViewController: UITableViewController {
    
    let moContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    var stores = [Store]()

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //saveData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //var error1 : NSError
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Store")
        //stores = moContext.execute(<#T##request: NSPersistentStoreRequest##NSPersistentStoreRequest#>)
        request.returnsObjectsAsFaults = false

        
        
        do
        {
            let results = try moContext.fetch(request)
            stores = results as! [Store]
            print("ok")
            print(stores.count)
            self.tableView.reloadData()

            
                    }
        catch {
            print ("error")
        }

        
    }
    
    func saveData(){
        
        // Get Description
        let storeDescription = NSEntityDescription.entity(forEntityName: "Store", in: moContext)
        
        //let store = Store(entity: storeDescription!, insertIntoManagedObjectContext: moContext)
        //let newContact = NSEntityDescription.insertNewObject(forEntityName: "Store", into: moContext)
        
        let store = Store(entity: storeDescription!, insertInto: moContext)
        
        store.sName = "moin1"
        store.sDesc = "moin11"
        
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

    func getData() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "UserData")
        let firstName = true
        request.predicate = NSPredicate(format: "owner == %@", firstName as CVarArg)
        
        request.returnsObjectsAsFaults = false
        
        do
        {
            let results = try context.fetch(request)
            
            if results.count > 0
            {
                for result in results as! [NSManagedObject]
                {
                    if let name = result.value(forKey: "name") as? String {
                        //textFieldName.text = name
                        print (name)
                    }
                    if let name = result.value(forKey: "phone") as? String {
                        //textFieldPhone.text = name
                        print (name)
                    }
                    if let name = result.value(forKey: "owner") as? Bool {
                        print (name)
                    }
                }
            }
        }
        catch {
            print ("error")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return stores.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        
        let store = stores[indexPath.row]
        cell.textLabel?.text = store.sName
        cell.detailTextLabel?.text = store.sDesc

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "editStore" {
            let v = segue.destination as! ViewController
            
            let indexpath = self.tableView.indexPathForSelectedRow
            let row = indexpath?.row
            
            v.store = stores[row!]
        }
        
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
