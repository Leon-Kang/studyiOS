//
//  ViewController.swift
//  Game
//
//  Created by 康梁 on 15/12/19.
//  Copyright © 2015年 kl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let imageView:UIImageView = UIImageView()
        imageView.image = UIImage(named: "dragon.jpg")
        imageView.frame = CGRectMake(0, 0, (imageView.image?.size.width)!, (imageView.image?.size.height)!);
        
        self.view.addSubview(imageView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

