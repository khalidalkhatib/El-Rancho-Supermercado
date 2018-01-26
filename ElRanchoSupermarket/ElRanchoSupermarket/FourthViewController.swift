//
//  FourthViewController.swift
//  ElRanchoSupermarket
//
//  Created by Khalid Alkhatib on 4/5/16.
//  Copyright © 2016 Khalid Alkhatib. All rights reserved.
//

import UIKit
import MessageUI

class FourthViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var numberField: UITextField!
    @IBOutlet var cityField: UITextField!

    @IBAction func Send(_ sender: AnyObject) {
        
        let toRecipients = ["cowboys.khalid@gmail.com"]
        
        let mc: MFMailComposeViewController = MFMailComposeViewController()
        
        mc.mailComposeDelegate = self
        
        mc.setToRecipients(toRecipients)
        mc.setSubject("Customer")
        
        mc.setMessageBody("Name: \(nameField.text!) \n\nHousehold Size: \(numberField.text!) \n\nCity: \(cityField.text!)", isHTML: false)
        
        self.present(mc, animated: false, completion: nil)
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let background = CAGradientLayer().orangeFade()
        background.frame = self.view.bounds
        self.view.layer.insertSublayer(background, at: 0)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        switch result.rawValue {
        case MFMailComposeResult.cancelled.rawValue:
            print("Cancelled")
            
        case MFMailComposeResult.failed.rawValue:
            print("Failed")
            
        case MFMailComposeResult.saved.rawValue:
            print("Saved")
            
        case MFMailComposeResult.sent.rawValue:
            print("Sent")
            
        default:
            break
        }
        
        
        self.dismiss(animated: true, completion: nil)
        
        
    }
    @IBAction func dismissKeyboard(_ sender: AnyObject) {
        
        self.resignFirstResponder()
    }
    
    
    
}
