//
//  ViewController.swift
//  APM_2
//
//  Created by Михаил Фокин on 27.11.2020.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func pressImage(_ sender: UIButton) {
        performSegue(withIdentifier: "sequeuToScroll", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

