//
//  ViewController.swift
//  MultithreadingSample
//
//  Created by Слава on 20.08.2018.
//  Copyright © 2018 Слава. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    var imageURL: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.activity.isHidden = true
        
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        self.activity.isHidden = false
        self.activity.startAnimating()
        switch sender.tag {
        case 1:
            imageURL = URL(string: "https://www.wallpaperup.com/uploads/wallpapers/2015/05/26/699138/3a0890e957437c18c0f43e66fb1db56d-1000.jpg")
        case 2:
            imageURL = URL(string: "https://www.wallpaperup.com/uploads/wallpapers/2016/02/03/887315/6893cb59723aceff801504e236a78d5b-700.jpg")
        case 3:
            imageURL = URL(string: "https://www.wallpaperup.com/uploads/wallpapers/2016/02/03/887509/ae7c4b92ffae1a8be8bb2c558d959342-700.jpg")
        default:
            break
        }
        
        
        let queue = DispatchQueue(label: "DownloalImages", qos: .utility, attributes: .concurrent)
        queue.async {
            
            if let imageData = NSData(contentsOf: self.imageURL! as URL) {
                
                DispatchQueue.main.async {
                    self.activity.stopAnimating()
                    self.activity.isHidden = true
                    self.myImage.image = UIImage(data: imageData as Data)
                }
            }
        }
    }
}

//        var queueConcurrent = DispatchQueue(label: "My Queue", qos: .background, attributes: .concurrent)
//
//        queueConcurrent.sync {
//
//            print("1")
//            print("2")
//            print("3")
//        }
//        queueConcurrent.async {
//
//
//            print("4")
//            print("5")
//            print("6")
//        }
//
//        var queueConcurrentBack = DispatchQueue(label: "My Queue", qos: .userInitiated, attributes: .concurrent)
//
//        queueConcurrentBack.sync {
//
//            print("7")
//            print("8")
//            print("9")
//        }
//        queueConcurrentBack.async {
//
//
//            print("10")
//            print("11")
//            print("12")
//        }
//
//
//        DispatchQueue.main.async() {
//            print("4")
//            print("5")
//            print("6")
//
//        }
//
//        print("1")
//        print("2")
//        print("3")
//
//
//
//        DispatchQueue.global().async {
//            print("7")
//            print("8")
//            print("9")
//        }
//    }



