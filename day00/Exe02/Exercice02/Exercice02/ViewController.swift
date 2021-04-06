//
//  ViewController.swift
//  Exercice02
//
//  Created by Михаил Фокин on 23.11.2020.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    var res: Int64? = nil
    var sign : Character = "+"
    
    @IBOutlet var value: UILabel!
    
    func setColorBackgoundLabelGreen() -> Void {
        value.backgroundColor = UIColor.green
    }
    func overflow() -> Void {
        print("Overflow!!!")
        value.backgroundColor = UIColor.red
        sign = "+"
        res = nil
        value.text! = ""
    }
    func getValuePrevSign() -> Int64? {
        let num = Int64(value.text!)!
        print("num = \(num)")
        switch sign {
        case "+":
            let (sum, didOverflow):(Int64?, Bool) = num.addingReportingOverflow(res!)
            if didOverflow {
                return nil
            }
            else {
                return sum
            }
        case "-":
            let (sub, didOverflow):(Int64?, Bool) = res!.subtractingReportingOverflow(num)
            if didOverflow {
                return nil
            }
            else {
                return sub
            }
        case "*":
            let (multi, didOverflow):(Int64?, Bool) = num.multipliedReportingOverflow(by: res!)
            if didOverflow {
                return nil
            }
            else {
                return multi
            }
        default:
            if Int(value.text!) == 0 {
                print("Divide by zero!!!")
                return nil
            }
            else {
                let (dive, didOverflow):(Int64?, Bool) = res!.dividedReportingOverflow(by: num)
                if didOverflow {
                    return nil
                }
                else {
                    return dive
                }
            }
        }
    }
    @IBAction func BOne(_ sender: UIButton) {
        setColorBackgoundLabelGreen()
        value.text! += "1"
    }
    @IBAction func BTwo(_ sender: UIButton) {
        setColorBackgoundLabelGreen()
        value.text! += "2"
    }
    @IBAction func BThree(_ sender: UIButton) {
        setColorBackgoundLabelGreen()
        value.text! += "3"
    }
    @IBAction func BFour(_ sender: UIButton) {
        setColorBackgoundLabelGreen()
        value.text! += "4"
    }
    @IBAction func BFive(_ sender: UIButton) {
        setColorBackgoundLabelGreen()
        value.text! += "5"
    }
    @IBAction func BSix(_ sender: UIButton) {
        setColorBackgoundLabelGreen()
        value.text! += "6"
    }
    @IBAction func BSeven(_ sender: UIButton) {
        setColorBackgoundLabelGreen()
        value.text! += "7"
    }
    @IBAction func BEigth(_ sender: UIButton) {
        setColorBackgoundLabelGreen()
        value.text! += "8"
    }
    @IBAction func BNine(_ sender: UIButton) {
        setColorBackgoundLabelGreen()
        value.text! += "9"
    }
    @IBAction func BZero(_ sender: UIButton) {
        setColorBackgoundLabelGreen()
        value.text! += "0"
    }
    @IBAction func BAC(_ sender: UIButton) {
        setColorBackgoundLabelGreen()
        value.text! = ""
        res = nil
    }
    @IBAction func BNeg(_ sender: UIButton) {
        setColorBackgoundLabelGreen()
        if value.text!.isEmpty {
            return
        }
        let str = value.text!
        if !str.contains("-") {
            value.text! = "-" + value.text!
        }
        else {
            value.text!.removeFirst()
        }
    }
    @IBAction func BPlus(_ sender: UIButton) {
        setColorBackgoundLabelGreen()
        print("press + ")
        
        if value.text!.isEmpty {
            return
        }
        if Int64(value.text!) == nil {
            overflow()
            return
        }
        if res != nil {
            res = getValuePrevSign()
            if res == nil {
                overflow()
            }
        }
        else {
            res = Int64(value.text!)
            print("res = \(res!)")
        }
        sign = "+"
        value.text! = ""
    }
    @IBAction func BMinus(_ sender: UIButton) {
        setColorBackgoundLabelGreen()
        print("press - ")
        if value.text!.isEmpty {
            return
        }
        if Int64(value.text!) == nil {
            overflow()
            return
        }
        if res != nil {
            res = getValuePrevSign()
            if res == nil {
                overflow()
            }
        }
        else {
            res = Int64(value.text!)
        }
        sign = "-"
        value.text! = ""
    }
    @IBAction func BMultiply(_ sender: UIButton) {
        setColorBackgoundLabelGreen()
        print("press * ")
        if value.text!.isEmpty {
            return
        }
        if Int64(value.text!) == nil {
            overflow()
            return
        }
        if res != nil {
            res = getValuePrevSign()
            if res == nil {
                overflow()
            }
        }
        else {
            res = Int64(value.text!)
        }
        sign = "*"
        value.text! = ""
    }
    @IBAction func BDivide(_ sender: UIButton) {
        setColorBackgoundLabelGreen()
        print("press / ")
        if value.text!.isEmpty {
            return
        }
        if Int64(value.text!) == nil {
            overflow()
            return
        }
        if res != nil {
            res = getValuePrevSign()
            if res == nil {
                overflow()
            }
        }
        else {
            res = Int64(value.text!)
        }
        sign = "/"
        value.text! = ""
    }
    
    @IBAction func BEqual(_ sender: UIButton) {
        setColorBackgoundLabelGreen()
        print("press = ")
        if value.text!.isEmpty || res == nil {
            return
        }
        if Int64(value.text!) == nil {
            overflow()
            return
        }
        res = getValuePrevSign()
        if res == nil {
            overflow()
        }
        else {
            value.text! = String(res!)
        }
        res = nil
    }
}

