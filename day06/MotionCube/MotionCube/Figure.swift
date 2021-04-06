//
//  Figure.swift
//  MotionCube
//
//  Created by Михаил Фокин on 01.12.2020.
//

import UIKit

@IBDesignable
class Figure: UIView {
    //var rectangle: CGRect?
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let circlePath : UIBezierPath
        if Int.random(in: 1...1000) % 2 == 0 {
            circlePath = UIBezierPath(rect: rect)
        } else {
            circlePath = UIBezierPath(ovalIn: rect)
            self.backgroundColor = .white
            self.layer.cornerRadius = rect.width / 2.0
            self.layer.masksToBounds = true
        }
        let color = UIColor.random
        color.setFill()
        circlePath.fill()
    }
    override var description: String {return "!!!Hello!!!"}
}


extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}

/*
 let shapeLayer = CAShapeLayer()
 shapeLayer.path = circlePath.cgPath
 shapeLayer.strokeColor = color.cgColor
 shapeLayer.lineWidth = 3.0
 self.backgroundColor = UIColor.red
 */
