//
//  ScrollImageViewController.swift
//  APM
//
//  Created by Михаил Фокин on 27.11.2020.
//

import UIKit

class ScrollImageViewController: UIViewController, UIScrollViewDelegate{

    @IBOutlet var scroll: UIScrollView!
    @IBOutlet var scrollImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: strImageToScrol) {
            if let data = try? Data(contentsOf: url) {
                let image = UIImage(data: data)
                //scrollImage.image = UIImage(data: data)
                let imageView = UIImageView(image: image)
                imageView.contentMode = .scaleToFill //Не изменные пропорции
                scroll.addSubview(imageView)
                scrollImage = imageView
                scroll.maximumZoomScale = 100
                scroll.minimumZoomScale = 0.3
                scroll.frame.origin.x = 0
                scroll.frame.origin.y = 0
                scroll.frame.size = scrollImage.frame.size
            }
        }
        // Do any additional setup after loading the view.
    }

    override func didMove(toParent parent: UIViewController?) {
        print("Hello")
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scroll.frame.origin.x = 0
        scroll.frame.origin.y = 0
        scroll.frame.size = scrollImage.frame.size
        //scrollImage.frame.size = scroll.frame.size
        //scroll.frame.size = scrollImage.frame.size
        //scrollImage.frame.origin.x = CGFloat(temp)//scroll.frame.width
        //scrollImage.frame.origin.y = CGFloat(temp)
        //temp += 100
        let contentWidth = scrollImage.frame.width * CGFloat(100)
        let contentHeigth = scrollImage.frame.height * CGFloat(100)
        scroll.contentSize = CGSize(width: contentWidth, height: contentHeigth)
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        scroll.frame.origin.x = 0
        scroll.frame.origin.y = 0
        scroll.frame.size = scrollImage.frame.size
        let contentWidth = scrollImage.frame.width * CGFloat(100)
        let contentHeigth = scrollImage.frame.height * CGFloat(100)
        scroll.contentSize = CGSize(width: contentWidth, height: contentHeigth)
        return scrollImage
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
