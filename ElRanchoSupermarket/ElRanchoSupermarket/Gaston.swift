//
//  Gaston.swift
//  ElRanchoSupermarket
//
//  Created by Khalid Alkhatib on 6/16/16.
//  Copyright © 2016 Khalid Alkhatib. All rights reserved.
//

import UIKit

class Gaston: UIViewController {
    
    @IBOutlet var WebView: UIWebView!
    @IBOutlet var pageOne: UIButton!
    @IBOutlet var pageTwo: UIButton!
    @IBOutlet var pageThree: UIButton!
    @IBOutlet var pageFour: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "http://www.elranchoinc.com/el/weeklyad/el%2025/p1.jpg")
        let request = URLRequest(url: url!)
        WebView.loadRequest(request)
        
        
        let background = CAGradientLayer().orangeFade()
        background.frame = self.view.bounds
        self.view.layer.insertSublayer(background, at: 0)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pageOne(_ sender: AnyObject) {
        let url = URL(string: "http://www.elranchoinc.com/el/weeklyad/el%2025/p1.jpg")
        let request = URLRequest(url: url!)
        WebView.loadRequest(request)
    }
    
    @IBAction func pageTwo(_ sender: AnyObject) {
        let url = URL(string: "http://www.elranchoinc.com/el/weeklyad/el%2025/p2.jpg")
        let request = URLRequest(url: url!)
        WebView.loadRequest(request)
    }
    
    @IBAction func pageThree(_ sender: AnyObject) {
        let url = URL(string: "http://www.elranchoinc.com/el/weeklyad/el%2025/p3.jpg")
        let request = URLRequest(url: url!)
        WebView.loadRequest(request)
    }
    @IBAction func pageFour(_ sender: AnyObject) {
        let url = URL(string: "http://www.elranchoinc.com/el/weeklyad/el%2025/p4.jpg")
        let request = URLRequest(url: url!)
        WebView.loadRequest(request)
    }
    
}
