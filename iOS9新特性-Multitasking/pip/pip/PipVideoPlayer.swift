//
//  PipVideoPlayer.swift
//  pip
//
//  Created by 康梁 on 15/12/19.
//  Copyright © 2015年 kl. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class PipVideoPlayer: UIView {

    override class func layerClass() -> AnyClass {
        return AVPlayerLayer.self
    }
    
    var pipPlayer : AVPlayerLayer {
        return layer as! AVPlayerLayer
    }
    
    var pipPlayerPlay : AVPlayer? {
        get {
            return pipPlayer.player
        }
        set {
            return pipPlayer.player = newValue
        }
    }
    

}
