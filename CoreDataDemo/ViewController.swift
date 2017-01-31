//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Ahmed T Khalil on 1/23/17.
//  Copyright © 2017 kalikans. All rights reserved.
//

import UIKit
import CoreData

/*
 Core Data theme:
 1) First you need to create a context to view permanent storage
 2) If you want to add data, you need to create an 'empty row' for the entity of interest
 3) If you want to restore, update, and/or remove data, you must fetch the results using the context, manipulate them as desired, and then commit the changes to the context
 4) Optional: Use predicates to tailor the fetched results
 */

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //read documentation description of 'UIApplication' if you forget what this does
        //this essentially gives you an object to refer to methods in 'AppDelegate.swift' file
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        //best to think of context as a manager that lets us work with Core Data
        //can use to access Core Data (i.e. save or restore data for the entities in the data model)
        let context = appDelegate.persistentContainer.viewContext
        //once we do this we can use the context to work with Core Data as follows:
        
        /*
         SAVING NEW DATA:
        //what we are basically doing here is creating an instance of the class for the entity described so that we can then add new objects into our database
         //this newUser object can best be thought of as an empty 'row' in our 'table' (entity)
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        
        //notice the similarity to 'UserDefaults' syntax
        newUser.setValue("Bobo", forKey: "username")
        newUser.setValue("Password123", forKey: "password")
        newUser.setValue(3, forKey: "age")
        
        //finally, we try to save it
        do{
            
            try context.save()
            print("Saved!")
            
        }catch{
            
            print("There was an error")
            
        }
        */
        
        /*
         RESTORING DATA
        //to restore the data, we need to request it (this tries to fetch everything within the entity 'Users')
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        //you can add a predicate to your request to say what you want your request to return
        //use this to tailor results returned by the request (comment out if you want all results)
        //request.predicate = NSPredicate(format: "username = %@", "Bobo")
        
        //it returns the managed objects as faults by default
        request.returnsObjectsAsFaults = false
        
        do{
            let results = try context.fetch(request)
            
            //if we do have results, we want to print out the usernames
            if results.count > 0 {
                //if you don't cast it to an NSManagedObject array, you won't have methods you need
                for result in results as! [NSManagedObject] {
                    //Rob casts username to a String in the following if let, but this seems optional unless you need to manipulate a String type
                    if let username = result.value(forKey: "username"){
                        print(username)

                    }
                }
            }
        }catch{
            
            print("Couldn't fetch request")
            
        }
        */
        
        /*
         UPDATING DATA
        //to restore the data, we need to request it (this tries to fetch everything within the entity 'Users')
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        //you can add a predicate to your request to say what you want your request to return
        //use this to tailor results returned by the request (comment out if you want all results)
        //request.predicate = NSPredicate(format: "username = %@", "Bobo")
        
        //it returns the managed objects as faults by default
        request.returnsObjectsAsFaults = false
        
        
        //to update an entry
        do{
            let results = try context.fetch(request)
            
            //if we do have results, we want to print out the usernames
            if results.count > 0 {
                //if you don't cast it to an NSManagedObject array, you won't have methods you need
                for result in results as! [NSManagedObject] {
                    //Rob casts username to a String in the following if let, but this seems optional unless you need to manipulate a String type
                    if let username = result.value(forKey: "username"){
                        //to update a value for an entry, we first tailor the results using a predicate (above) and then we update the returned value:
                        result.setValue("Bo-bo", forKey: "username")
                        
                        do{
                          try context.save()
                        }catch{
                            print("Oops something went wrong")
                        }
                    }
                }
            }
        }catch{
            
            print("Couldn't fetch request")
            
        }
        */
        
        /*
         DELETING OBJECTS
        //now to delete entries, again you would need a request to access what you need to delete it
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        request.returnsObjectsAsFaults = false
        //tailor the results
        request.predicate = NSPredicate(format: "username = %@", "Bo-bo")
        
        do{
            let results = try context.fetch(request)
            if results.count > 0 {
                for result in results as! [NSManagedObject]{
                    //delete the returned results
                    //realize that 'newUser' from before is essentially an empty row, whereas we need to delete a row that was already committed to the context, which is why we do it directly via a dot operation from the context
                    context.delete(result)
                }
                //then save the changes
                do{
                   try context.save()
                }catch{
                    print("Something went wrong")
                }
            }
        }catch{
            print("Something went wrong")
        }
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

