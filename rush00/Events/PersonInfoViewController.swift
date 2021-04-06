//
//  PersonInfoViewController.swift
//  Events
//
//  Created by Михаил Фокин on 29.11.2020.
//

import UIKit

class PersonInfoViewController: UIViewController {

    @IBOutlet var login: UILabel!
    @IBOutlet var name: UILabel!
    @IBOutlet var lastName: UILabel!
    @IBOutlet var level: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        login.text = "widraugr"
        name.text = "Галина"
        lastName.text = "Добробаба"
        level.text = "42.21"
        // Do any additional setup after loading the view.
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
