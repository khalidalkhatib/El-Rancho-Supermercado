//
//  AreaTable.swift
//  ElRanchoSupermarket
//
//  Created by Khalid Alkhatib on 8/6/16.
//  Copyright © 2016 Khalid Alkhatib. All rights reserved.
//

import Foundation
import UIKit

class AreaTable: UITableViewController {
    
    var stores = [String]()
    var identities = [String]()
    
    override func viewDidLoad() {
        
        stores = ["DFW Area", "Austin Area", "Odessa Area"]
        
        identities = ["DFW", "Austin", "Odessa"]
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return stores.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {  let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel!.text = stores[indexPath.row]
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vcName = identities[indexPath.row]
        let viewController = storyboard?.instantiateViewController(withIdentifier: vcName)
        self.navigationController?.pushViewController(viewController!, animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
