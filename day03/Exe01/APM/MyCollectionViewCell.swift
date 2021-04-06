//
//  MyCollectionViewCell.swift
//  APM
//
//  Created by Михаил Фокин on 26.11.2020.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    @IBOutlet var oneImg: UIImageView!
    @IBOutlet var snipper: UIActivityIndicatorView!
    
    var imageURL: URL? {
        didSet {
            oneImg?.image = nil
            updateUI()
        }
    }
    private func updateUI() {
        if let url = imageURL {
            //if # available
            //[[UIApplication .shared] setNe]
            if #available(iOS 13, *) {
                UIApplication.shared.isNetworkActivityIndicatorVisible = true
            } else { }
            snipper?.startAnimating()
            DispatchQueue.global(qos: .userInitiated).async {
                let contentOfURL = try? Data(contentsOf: url)
                DispatchQueue.main.async {
                    if url == self.imageURL {
                        if let imageData = contentOfURL {
                            self.oneImg?.image = UIImage(data: imageData)
                        }
                        self.snipper?.stopAnimating()
                    }
                    if #available(iOS 13, *) {
                        UIApplication.shared.isNetworkActivityIndicatorVisible = false
                    } else { }
                }
            }
        }
    }
}
