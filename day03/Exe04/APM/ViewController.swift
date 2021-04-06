//
//  ViewController.swift
//  APM
//
//  Created by Михаил Фокин on 26.11.2020.
//

import UIKit
//let strImageHuman = "www.nasa.gov/sites/default/files/thumbnails/image/attocknie_hi_res.jpg"
let strImageHuman = "https://www.nasa.gov/sites/default/files/thumbnails/image/attocknie_hi_res.jpg"
let strImageJet = "https://www.nasa.gov/sites/default/files/thumbnails/image/afrc2020-0082-04.jpg"
let strImagePotapo = "https://www.nasa.gov/sites/default/files/thumbnails/image/haccp_3_0.jpg"
let strImateSoup = "https://www.nasa.gov/sites/default/files/thumbnails/image/haccp_banner_0.jpg"

var strImageToScrol = strImateSoup

class ViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    // Тут указывается количество ячеек
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ViewController.allStrImage().count
    }
    
    override func viewDidAppear(_ animated: Bool) {
       
    }
    //Провеока фотоы
    func verifyUrl (urlString: String?) -> Bool {
        //Check for nil
        if let urlString = urlString {
            // create NSURL instance
            if let url = URL(string: urlString) {
                // check if your application can open the NSURL instance
                return UIApplication.shared.canOpenURL(url as URL)
            }
        }
        return false
    }
    // Закрывается вид
    override func viewDidDisappear(_ animated: Bool) {
       
    }
    public func showAlert(strErr : String) {
        let alertController = UIAlertController(title: "Error", message: strErr, preferredStyle: .alert)
        let alertOkAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(alertOkAction)
        present(alertController, animated: true, completion: nil)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        strImageToScrol = ViewController.allStrImage()[indexPath.item]
        print(strImageToScrol)
        performSegue(withIdentifier: "sequeShowScrollView", sender: nil)
    }
    // В этом методе создается ячейка с характеристиками
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let strings = ViewController.allStrImage()
        //let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionViewCell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)

        /*
        var data : Data
        do {
            try data = Data(contentsOf: URL(string: strings[indexPath.row])!)
            cell.oneImg.image = UIImage(data: data)
        } catch{
            showAlert(strErr: strings[indexPath.row])
        }
        */
        if (!verifyUrl(urlString: strings[indexPath.row]) == true){
            print(strings[indexPath.row])
            showAlert(strErr: strings[indexPath.row])
        }
        if let tweetCell = cell as? MyCollectionViewCell {
            tweetCell.imageURL = URL(string: strings[indexPath.row])
        }
        return cell
    }
}

extension ViewController {
    static func allStrImage() -> [String] {
        return [strImageHuman, strImageJet, strImagePotapo, strImateSoup]
    }
}
