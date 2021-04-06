//
//  ViewController.swift
//  Exercise00
//
//  Created by Михаил Фокин on 23.11.2020.
//

import UIKit

class ViewController: UIViewController {

    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func ClickMe(_ sender: UIButton) {
        count += 1
        print("Hello world!!! \(count)")
        
    }
}

