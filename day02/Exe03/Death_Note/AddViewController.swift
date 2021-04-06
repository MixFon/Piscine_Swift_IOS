//
//  AddViewController.swift
//  Death_Note
//
//  Created by Михаил Фокин on 25.11.2020.
//

import UIKit

class AddViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func textField(_ sender: UITextField) {
        
    }
    @IBOutlet var getNamePerson: UITextField!
    @IBOutlet var getDatePerson: UIDatePicker!
    @IBOutlet var getDeskriptionPerson: UITextView!
    @IBAction func pressDone(_ sender: UIBarButtonItem) {
        let name : String
        let descripions : String
        if ((getNamePerson.text!.isEmpty)) {
            return
        }
        name = getNamePerson.text! + "\n" + getDatePerson.date.description
        if (getDeskriptionPerson.text != nil) {
            descripions = getDeskriptionPerson.text!
        }
        else {
            descripions = ""
        }
        let newPerson = Human(name: name, description: descripions)
        deathNote.listHuman.append(newPerson)
        print(deathNote.listHuman)
        print(getNamePerson.text!)
        print(getDatePerson.date)
        print(getDeskriptionPerson.text!)
        //print(Date(timeIntervalSinceNow: 3))
        // dismiss работает только когда был вызван метод present в нашем случае не сработает
        //dismiss(animated: true, completion: nil)
        
        // Как только нажали на Done и в первой строке есть имя, выталкиваем вкладку назад.
        navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
