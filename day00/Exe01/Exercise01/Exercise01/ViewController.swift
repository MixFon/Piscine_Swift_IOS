//
//  ViewController.swift
//  Exercise01
//
//  Created by Михаил Фокин on 23.11.2020.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var lableHello: UILabel!
    @IBAction func pressClick(_ sender: UIButton) {
        lableHello.textColor = UIColor.green
        lableHello.text = "Press click"
    }
}

