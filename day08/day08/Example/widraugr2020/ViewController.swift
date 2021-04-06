//
//  ViewController.swift
//  widraugr2020
//
//  Created by MixFon on 12/03/2020.
//  Copyright (c) 2020 MixFon. All rights reserved.
//

import UIKit
import CoreData
import widraugr2020

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let articleManager = ArticleManager()
        let articles = articleManager.getAllArticles()
        if (articles.isEmpty) {
            print("article is empty")
        }else {
            for article in articles {
                print(article)
            }
        }
        for _ in 1...5{
            let newArticle = articleManager.newArticle()
            //articleManager.save(article: newArticle)
            //print(newArticle)
        }
        print("AllRus")
        let allRus = articleManager.getArticles(withLang: "RUS")
        for article in allRus {
            print(article)
            articleManager.removeArticle(article: article)
        }
        print("AllRus")
        for _ in 1...5{
            let newArticle = articleManager.newArticle()
            //articleManager.save(article: newArticle)
            print(newArticle)
        }


    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

