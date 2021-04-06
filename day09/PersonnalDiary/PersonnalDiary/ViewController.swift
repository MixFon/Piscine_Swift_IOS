//
//  ViewController.swift
//  PersonnalDiary
//
//  Created by Михаил Фокин on 04.12.2020.
//

import UIKit
import widraugr2020

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    let reuseIdetnifier = "my cell"
    var allEngArticle: [Article] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let articleManager = ArticleManager()
        allEngArticle = articleManager.getArticles(withLang: NSLocale.preferredLanguages.first ?? "en")
//        for article in allEngArticle {
//            print(article)
//        }
//        for _ in 1...20 {
//            _ = articleManager.newArticle()
//           // articleManager.removeArticle(article: artticle)
//        }
//        articleManager.save()
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdetnifier)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //Для обновления таблицы вызываем следующий метод.
        tableView.reloadData()
    }
    @IBAction func pressAddButtom(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "sequeu", sender: nil)
    }
    
}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    // Возвращем количество секций (количество людей в списке.
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    // Возвращет количество строк Rows секции колличество категорий.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allEngArticle.count
    }
    // Создаем ячейку и заполняем ее.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdetnifier, for: indexPath) as! TableViewCell
        let articleManager = ArticleManager()
        allEngArticle = articleManager.getArticles(withLang: NSLocale.preferredLanguages.first ?? "en")
        let article = allEngArticle[indexPath.row]
        if let lang = article.language {
            print(lang)
        }
        if let title = article.title {
            cell.titleCell.text = title
        }
        if let content = article.content {
            cell.descriptinCell.text = content
        }
        //cell.imageCell = UIImageView()
        if let date = article.creation_date {
            cell.dateCreation.text = date.description
        }
        if let date = article.modification_date {
            cell.dateModification.text = date.description
        }
        // Задаем неограниченное количество строк
        cell.textLabel?.numberOfLines = 0
        // Задаем неограниченное количество строк
        cell.detailTextLabel?.numberOfLines = 0
        return cell
    }
    // Название категории Section. nil для того чтобы не отображался заголовок.
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Articles"
    }
    
}
