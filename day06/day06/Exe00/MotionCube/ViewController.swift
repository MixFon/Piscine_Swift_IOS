//
//  ViewController.swift
//  MotionCube
//
//  Created by Михаил Фокин on 01.12.2020.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tapOut: UITapGestureRecognizer!
    
    
    @IBAction func pressTap(_ sender: UITapGestureRecognizer) {
        let size = CGSize(width: 200, height: 200)
        let startCoordinate = tapOut.location(in: nil)
        let rectangle = CGRect(origin: startCoordinate, size: size)
        let figure = Figure(frame: rectangle)
        //figure.bounds = CGRect(x: 0, y: 0, width: 10, height: 10)
        view.addSubview(figure)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let gestures = UIPanGestureRecognizer(target: self, action: #selector(panGesture(_: )))
        view.addGestureRecognizer(gestures)
        // Do any additional setup after loading the view.
    }

    @objc func  panGesture(_ gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .began:
            print("Began")
        case .changed:
            print("Changed to \(gesture.location(in: view))")
        case .ended:
            print("Ended")
        case .failed:
            print("Failed")
        case .possible:
            print("Possible")
        default:
            print("def")
        }
    }

}

