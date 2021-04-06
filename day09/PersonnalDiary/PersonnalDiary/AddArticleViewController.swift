//
//  AddArticleViewController.swift
//  PersonnalDiary
//
//  Created by Михаил Фокин on 05.12.2020.
//

import UIKit
import widraugr2020
import CoreData

class AddArticleViewController: UIViewController {

    @IBOutlet var titleAdd: UITextField!
    @IBOutlet var contentAdd: UITextView!
    
    //var imageAdd: UIImageView?
    @IBAction func buttonSave(_ sender: UIBarButtonItem) {
        let artucleManager = ArticleManager()
        let article = Article(context: artucleManager.managedObjectContext)
        article.content = contentAdd.text
        article.title = title
        article.language = NSLocale.preferredLanguages.first
        article.image = Data()
        article.creation_date = Date()
        artucleManager.save()
        article.image = imageAdd.image?.jpegData(compressionQuality: 1)
        navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet var imageAdd: UIImageView!
    
    // Обращается или к фото камере или к фото
    let imagePicker = UIImagePickerController()
    
    @IBAction func buttonTakePicture(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func buttonCoosePicture(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension AddArticleViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        imageAdd.image = info[.originalImage] as? UIImage
        print(info)
        
        picker.dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}
