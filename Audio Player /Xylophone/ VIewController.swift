//
//  ViewController.swift
//  Xylophone
//
//  Created by Surinder Pal Singh Sidhu April 11, 2019
//  Copyright © 2019 Singh In IT All rights reserved.
//
//Apple Developer Forum
//https://forums.developer.apple.com/
//
//Apple API Reference
//https://developer.apple.com/reference/
//
//Apple Guides and Sample Code
//https://developer.apple.com/library/content/navigation/
//// https://osstatus.com

import UIKit
import AVFoundation
class ViewController: UIViewController{
    
    
    
    var player: AVAudioPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()
    }



    @IBAction func notePressed(_ sender: UIButton) {
       // print("button pressed");
        //print(sender.tag)
        playsound(tag: sender.tag)
 

        
        
    }
    
    func playsound(tag:Int){
    guard let url = Bundle.main.url(forResource: "note\(tag)", withExtension: "wav") else { return }
// functions that can throws error should be in try catch block
// an swift gives an error if we dont put try catch block on those method
// but we can use exclamation mark to avoid this behaviour
//    try! AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
    do {
        try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
        try AVAudioSession.sharedInstance().setActive(true)
        
        /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
        player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
        
        /* iOS 10 and earlier require the following line:
         player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
        
        guard let player = player else { return }
        
        player.play()
        
    } catch let error {
        print(error.localizedDescription)
    }
    
    }

}

