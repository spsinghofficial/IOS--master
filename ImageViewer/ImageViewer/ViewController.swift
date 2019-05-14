//
//  ViewController.swift
//  ImageViewer
//
//  Created by surinder pal singh sidhu on 2019-05-13.
//  Copyright © 2019 surinder pal singh sidhu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items =  try! fm.contentsOfDirectory(atPath: path)
        for item in items{
             if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
    }


}

