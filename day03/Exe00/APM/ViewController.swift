//
//  ViewController.swift
//  APM
//
//  Created by Михаил Фокин on 26.11.2020.
//

import UIKit

let strImageHuman = "https://www.nasa.gov/sites/default/files/thumbnails/image/attocknie_hi_res.jpg"
let strImageJet = "https://www.nasa.gov/sites/default/files/thumbnails/image/afrc2020-0082-04.jpg"
let strImagePotapo = "https://www.nasa.gov/sites/default/files/thumbnails/image/haccp_3_0.jpg"
let strImateSoup = "https://www.nasa.gov/sites/default/files/thumbnails/image/haccp_banner_0.jpg"

class ViewController: UICollectionViewController {
    @IBOutlet var onePick: UIImageView!
    //@IBOutlet var oneImage: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.       
    }
    // Тут указывается количество ячеек
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    // В этом методе создается ячейка с характеристиками
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let strings = ViewController.allStrImage()
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionViewCell
        print(indexPath.row)
        print(strings[indexPath.row])
        cell.oneImg.image = UIImage(data: try! Data(contentsOf: URL(string: strings[indexPath.row])!))
        return cell
    }
}

extension ViewController {
    static func allStrImage() -> [String] {
        return [strImageHuman, strImageJet, strImagePotapo, strImateSoup]
    }
}
