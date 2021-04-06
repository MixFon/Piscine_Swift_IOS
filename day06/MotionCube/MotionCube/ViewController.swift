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
    
    var selectFigur: Figure?
    var allFigur: [Figure] = []
    var snap: UISnapBehavior!

    @IBOutlet var myView: UIView!
    
    // Вызывается при нажатии на экран
    @IBAction func pressTap(_ sender: UITapGestureRecognizer) {
        let figure = newFigure(size: 100,startCoordinate:CGPoint(
                                x: tapOut.location(in: nil).x,
                                y: tapOut.location(in: nil).y))
        addNewFigureToView(figure: figure)
    }
    
    func addNewFigureToView(figure: Figure){
        allFigur.append(figure)
        view.addSubview(figure)
        addSettingsToFigug(figure: figure)
        
    }
    // Установка настроек связанных с поведением
    func addSettingsToFigug(figure: Figure){
        gravity.magnitude = 1
        gravity.addItem(figure)
        animator.addBehavior(gravity)
        
        collision.collisionDelegate = self
        collision.addItem(figure)
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        
        elasticity.addItem(figure)
        elasticity.elasticity = 0.9
        animator.addBehavior(elasticity)
    }
    
    // Удаление настроек связаных с поведением
    func removeFigureFromView(figure: Figure){
        //allFigur.removeAll() {$0 == figure}
        gravity.removeItem(figure)
        collision.removeItem(figure)
        elasticity.removeItem(figure)
        //view.willRemoveSubview(figure)
    }
    
    func newFigure(size: Int, startCoordinate: CGPoint) -> Figure {
        let size = CGSize(width: size, height: size)
        let startCoordinate = CGPoint(x: startCoordinate.x - size.width / 2,
                                      y: startCoordinate.y - size.height / 2)
        let rectangle = CGRect(origin: startCoordinate, size: size)
        let figure = Figure(frame: rectangle)
        return figure
    }
    
    func myFunc(touch: UITouch) {
        if let temp = selectFigur{
            print("toush")
            snap = UISnapBehavior(item: temp, snapTo: touch.location(in: view))
            animator.addBehavior(snap)
        }
        print(touch.description)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gestures = UIPanGestureRecognizer(target: self, action: #selector(panGesture(_: )))
        view.addGestureRecognizer(gestures)
        
        let pinshGestures = UIPinchGestureRecognizer(target: self, action: #selector(pinshGesture(_: )))
        view.addGestureRecognizer(pinshGestures)
        
        let rotationGestures = UIRotationGestureRecognizer(target: self, action: #selector(rotationGesture(_: )))
        view.addGestureRecognizer(rotationGestures)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animator = UIDynamicAnimator(referenceView: myView)
    }
    
    @objc func  rotationGesture(_ rotationGesture: UIRotationGestureRecognizer) {
        switch rotationGesture.state {
        case .began:
            print("Began")
            // Проходим по всем фигурам и определяем попала ли точка в область frame
            for figur in allFigur {
                if figur.frame.contains(rotationGesture.location(in: view)) {
                    print("Yes")
                    selectFigur = figur
                    return
                }
            }
        case .changed:
            //print("Changed to \(rotationGesture.scale)")
            if let figure = selectFigur {
                print("Figer select rotation!!")
                if rotationGesture.view != nil {
                    removeFigureFromView(figure: selectFigur!)
                    //collision.removeItem(selectFigur!)
                    //selectFigur!.transform = CGAffineTransform(scaleX: pinchGesture.scale, y: pinchGesture.scale)
                    //selectFigur!.bounds.size = CGSize(width: 100 * (pinchGesture.scale/distance), height: 100 * (pinchGesture.scale/distance))
                    //selectFigur!.layer.cornerRadius = selectFigur!.bounds.width / 2.0
                    selectFigur!.transform = selectFigur!.transform.rotated(by: rotationGesture.rotation)
                    addSettingsToFigug(figure: figure)
                    animator.updateItem(usingCurrentState: selectFigur!)
                    //animator.updateItem(usingCurrentState: selectFigur!)
                    //collision.addItem(selectFigur!)
                }
            }
            print("Changed to \(rotationGesture.location(in: view))")
        case .ended:
            print("Ended")
            endedTouch()
        case .failed:
            print("Failed")
        case .possible:
            print("Possible")
        default:
            print("default")
        }
    }
    
    
    @objc func  pinshGesture(_ pinchGesture: UIPinchGestureRecognizer) {
        var distance: CGFloat = 1
        switch pinchGesture.state {
        case .began:
            print("Began")
            // Проходим по всем фигурам и определяем попала ли точка в область frame
            for figur in allFigur {
                if figur.frame.contains(pinchGesture.location(in: view)) {
                    print("Yes")
                    selectFigur = figur
                    distance = pinchGesture.scale
                    return
                }
            }
        case .changed:
            print("Changed to \(pinchGesture.scale)")
            if let figure = selectFigur {
                print("Figer select!!")
                if pinchGesture.view != nil {
                    removeFigureFromView(figure: selectFigur!)
                    selectFigur!.bounds.size = CGSize(width: 100 * (pinchGesture.scale/distance), height: 100 * (pinchGesture.scale/distance))
                    selectFigur!.layer.cornerRadius = selectFigur!.bounds.width / 2.0
                    //selectFigur!.transform = selectFigur?.transform.rotated(by: pinchGesture.)
                    addSettingsToFigug(figure: figure)
                    animator.updateItem(usingCurrentState: selectFigur!)
                    //animator.updateItem(usingCurrentState: selectFigur!)
                    //collision.addItem(selectFigur!)
                }
            }
            print("Changed to \(pinchGesture.location(in: view))")
        case .ended:
            print("Ended")
            endedTouch()
        case .failed:
            print("Failed")
        case .possible:
            print("Possible")
        default:
            print("default")
        }
    }
    
    @objc func  panGesture(_ gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .began:
            print("Began")
            // Проходим по всем фигурам и определяем попала ли точка в область frame
            for figur in allFigur {
                if figur.frame.contains(gesture.location(in: view)) {
                    print("Yes")
                    selectFigur = figur
                    return
                }
            }
        case .changed:
            if (snap != nil) {
                animator.removeBehavior(snap)
            }
            if let figur = selectFigur {
                snap = UISnapBehavior(item: figur, snapTo: gesture.location(in: view))
                animator.addBehavior(snap)
            }
        case .ended:
            endedTouch()
        case .failed:
            print("Failed")
        case .possible:
            print("Possible")
        default:
            print("default")
        }
    }
    func endedTouch() {
        if (snap != nil) {
            animator.removeBehavior(snap)
        }
        selectFigur = nil
    }
}
// То что ниже можно для самостоятельно переопределения
/*
override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    if (snap != nil) {
        animator.removeBehavior(snap)
    }
    print("touchBegin")
    for touch: UITouch in touches {
        if let temp = tempFigur {
            print("temp")
            snap = UISnapBehavior(item: temp as Figure, snapTo: touch.location(in: view))
            animator.addBehavior(snap)
        }
        print(touch.description)
    }
}
// Вызывается когда нажал кнопку мыши и начиаешь перемещать
override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    if (snap != nil) {
        animator.removeBehavior(snap)
    }
    print("touchMoved")
    for touch: UITouch in touches {
        //myFunc(touch: touch)
    }
}

override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    if (snap != nil) {
        animator.removeBehavior(snap)
    }
    print("touchCancelled")
    for touch: UITouch in touches {
        myFunc(touch: touch)
    }
}
// Выполняется во воремя отрывания пальца от экрана
override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
 
}
*/
