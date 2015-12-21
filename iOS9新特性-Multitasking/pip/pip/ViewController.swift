//
//  ViewController.swift
//  pip
//
//  Created by 康梁 on 15/12/19.
//  Copyright © 2015年 kl. All rights reserved.
//

/// 1 界面  2 创建引擎 3 pip

import UIKit
import AVKit
import AVFoundation

var currentItemStatus = "currentItemStatus"
var mcontext = 0


class ViewController: UIViewController {
    
    var url: AVAsset!
    var pipController: AVPictureInPictureController!
    
    lazy var player: AVPlayer = {
        let p = AVPlayer()
        p.addObserver(self, forKeyPath: currentItemStatus, options: .New, context: &mcontext)
        return p
    }()
    
    @IBOutlet var pipView: PipVideoPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as NSString
        path = path.stringByAppendingPathComponent("video.mp4")
        
        // let fileManager = NSFileManager.defaultManager()
        // if (!fileManager.fileExistsAtPath(path as String)) {
            // let sourcePath = NSBundle.mainBundle().pathForResource("video", ofType: "mp4")
            // fileManager.copyItemAtPath(sourcePath!, toPath: path as String)
        // }
        let u = NSURL.fileURLWithPath(path as String)
        
       
        // url = AVAsset(URL: u)
        let asset = AVAsset(URL: u)
        let item = AVPlayerItem(asset: asset)
        
        player.replaceCurrentItemWithPlayerItem(item)
        
        pipView.pipPlayerPlay = player
        
        // player = pipView.pipPlayerPlay!
        
        player.play()
        pipView.pipPlayerPlay?.play()
    }
    
    
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>)
    {
        
        if (keyPath == currentItemStatus) {
            let statusInt = change? [NSKeyValueChangeNewKey] as? NSNumber
            let status = AVPlayerItemStatus(rawValue: statusInt!.integerValue)
            
            if (status != .ReadyToPlay) {
                return
            }
            
            pipController = AVPictureInPictureController(playerLayer: pipView.pipPlayer)!
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

