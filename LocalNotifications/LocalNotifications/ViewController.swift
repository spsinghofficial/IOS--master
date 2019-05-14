//
//  ViewController.swift
//  LocalNotifications
//
//  Created by surinder pal singh sidhu on 2019-05-03.
//  Copyright © 2019 surinder pal singh sidhu. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert]) { (granted, error) in
            if granted {
                print("permission granted")
            }
            else {
                 print("permission denied")
            }
        }
    }

    @IBAction func sendNotification(_ sender: Any) {
        let content = UNMutableNotificationContent()
        content.title = "Notification title"
        content.subtitle = "from sidhu"
        content.body = "Notification Body"
        content.sound = UNNotificationSound.default
        
        let imageName = "applelogo"
        guard let imageURL = Bundle.main.url(forResource: imageName, withExtension: "png") else { return }
        print(imageURL)

        let attachment = try! UNNotificationAttachment(identifier: imageName, url: imageURL, options: .none)

        content.attachments = [attachment]
        
        // Deliver the notification in five seconds.
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "FiveSecond", content: content, trigger: trigger) // Schedule the notification.
        let center = UNUserNotificationCenter.current()
        center.add(request) { (error : Error?) in
            if let theError = error {
            print(theError.localizedDescription)
            }
            
        }
        
    }
    
}

