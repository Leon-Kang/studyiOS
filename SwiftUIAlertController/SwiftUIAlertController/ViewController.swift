//
//  ViewController.swift
//  SwiftUIAlertController
//
//  Created by 康梁 on 16/1/5.
//  Copyright © 2016年 kl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func alertAction(sender: AnyObject) {
        
        if segment.selectedSegmentIndex == 0 {
            let alertView: UIAlertController = UIAlertController.init(title: "AlertView", message: "I want to tell you something", preferredStyle: UIAlertControllerStyle.Alert)
            
            let alertViewAction: UIAlertAction = UIAlertAction.init(title: "确定", style: UIAlertActionStyle.Default, handler: { (UIAlertAction) -> Void in
                
            })
            
            let alertViewCancelAction: UIAlertAction = UIAlertAction.init(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil)
            
            alertView.addAction(alertViewAction)
            alertView.addAction(alertViewCancelAction)
            
            let alertViewDestructive: UIAlertAction = UIAlertAction.init(title: "销毁", style: UIAlertActionStyle.Destructive, handler: { (UIAlertAction) -> Void in
                
            })
            alertView.addAction(alertViewDestructive)
            
            
            alertView.addTextFieldWithConfigurationHandler({ (UITextField) -> Void in
                
                UITextField.placeholder = "name"
                UITextField.clearButtonMode = UITextFieldViewMode.WhileEditing
                
                // 设置监听
                _ = NSNotificationCenter.defaultCenter().addObserver(self, selector: "textChange:" , name: UITextFieldTextDidChangeNotification, object: UITextField)
                
            })
            
            self.presentViewController(alertView, animated:true , completion: nil)
            
        } else {
            
            let alertSheet = UIAlertController.init(title: nil, message: nil, preferredStyle: .ActionSheet)
            
            let alertSheetAction = UIAlertAction.init(title: "确定", style: .Default, handler: nil)
            alertSheet.addAction(alertSheetAction)
            
            let alertSheetCancel = UIAlertAction.init(title: "取消", style: .Cancel, handler: nil)
            alertSheet.addAction(alertSheetCancel)
            
            let alertSheetDestructive = UIAlertAction.init(title: "销毁", style: .Destructive, handler: nil)
            alertSheet.addAction(alertSheetDestructive)
            
            self.presentViewController(alertSheet, animated: true, completion: nil)
            
            
        }
        
    }
    
    
    
    func textChange(notification: NSNotification) {
        let textFied = notification.object as! UITextField
        
        textLabel.text = textFied.text
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

