//
//  FifthViewController.swift
//  ElRanchoSupermarket
//
//  Created by Khalid Alkhatib on 8/2/16.
//  Copyright © 2016 Khalid Alkhatib. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController {
    
    @IBOutlet var WebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.facebook.com/ElRanchoInc/")
        let request = URLRequest(url: url!)
        WebView.loadRequest(request)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
