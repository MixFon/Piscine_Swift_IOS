//
//  PasscodeViewController.swift
//  PersonnalDiary
//
//  Created by Михаил Фокин on 05.12.2020.
//

import UIKit

import LocalAuthentication
class PasscodeViewController: UIViewController {

    @IBAction func useBiometrics(sender: UIButton) {
        let context = LAContext()
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: nil) {
            context.evaluatePolicy(LAPolicy.deviceOwnerAuthentication, localizedReason: "Please authenticate to proceed.") { [weak self] (success, error) in
                if success {
                    DispatchQueue.main.async {
                        // Что-то сделать
                        print("HELLO")
                        self?.dismiss(animated: true, completion: nil)
                    }
                } else {
                    guard let error = error else { return }
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
