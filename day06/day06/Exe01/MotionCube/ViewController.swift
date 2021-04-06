//
//  ViewController.swift
//  MotionCube
//
//  Created by Михаил Фокин on 01.12.2020.
//

import UIKit

class ViewController: UIViewController, UICollisionBehaviorDelegate {
    @IBOutlet var tapOut: UITapGestureRecognizer!
    
    var animator: UIDynamicAnimator!
    let gravity = UIGravityBehavior()
    let collision = UICollisionBehavior()
    let elasticity = UIDynamicItemBehavior()
    //var figurs: [Figure] = []
    @IBOutlet var myView: UIView!
    
    @IBAction func pressTap(_ sender: UITapGestureRecognizer) {
        let size = CGSize(width: 100, height: 100)
        let startCoordinate = CGPoint(x: tapOut.location(in: nil).x - size.width / 2,
                                      y: tapOut.location(in: nil).y - size.height / 2)
        //startCoordinate.y = tapOut.location(in: nil).y + tapOut.location(in: nil).y / 2
        let rectangle = CGRect(origin: startCoordinate, size: size)
        let figure = Figure(frame: rectangle)

        view.addSubview(figure)
        gravity.magnitude = 10
        gravity.addItem(figure)
        animator.addBehavior(gravity)
        
        collision.collisionDelegate = self
        collision.addItem(figure)
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        
        elasticity.addItem(figure)
        elasticity.elasticity = 0.7
        animator.addBehavior(elasticity)
        //gravity.removeItem(figure)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gestures = UIPanGestureRecognizer(target: self, action: #selector(panGesture(_: )))
        view.addGestureRecognizer(gestures)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animator = UIDynamicAnimator(referenceView: myView)
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

