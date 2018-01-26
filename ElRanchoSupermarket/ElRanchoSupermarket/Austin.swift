//
//  Austin.swift
//  ElRanchoSupermarket
//
//  Created by Khalid Alkhatib on 8/6/16.
//  Copyright © 2016 Khalid Alkhatib. All rights reserved.
//

import Foundation
import UIKit

class Austin: UITableViewController {
    
    var identities = [String]()
    
    struct Objects {
        var sectionName: String!
        var sectionObjects: [String]!
        
    }
    
    
    var objectsArray = [Objects]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        objectsArray = [Objects(sectionName: "Austin", sectionObjects: ["Research Blvd., Austin", "Berkman Dr., Austin"])]
        
        
        identities = ["Research", "Berkman"]
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as UITableViewCell!
        
        cell?.textLabel?.text = objectsArray[indexPath.section].sectionObjects[indexPath.row]
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectsArray[section].sectionObjects.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return objectsArray.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return objectsArray[section].sectionName
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vcName = identities[indexPath.row]
        let viewController = storyboard?.instantiateViewController(withIdentifier: vcName)
        self.navigationController?.pushViewController(viewController!, animated: true)
        
    }
    
    
    
}
