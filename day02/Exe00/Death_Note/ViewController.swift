//
//  ViewController.swift
//  Death_Note
//
//  Created by Михаил Фокин on 25.11.2020.
//

import UIKit

class ViewController: UIViewController {
    var deathNote = LinstPeople()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    // Возвращем количество секций (количество людей в списке.
    func numberOfSections(in tableView: UITableView) -> Int {
        return deathNote.listHuman.count
    }
    // Возвращет количество строк Rows секции колличество категорий.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    // Создаем ячейку и заполняем ее.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = deathNote.listHuman[indexPath.section].name
        // Задаем неограниченное количество строк
        cell.textLabel?.numberOfLines = 0
        // Описание деталей.
        cell.detailTextLabel?.text = deathNote.listHuman[indexPath.section].description
        // Задаем неограниченное количество строк
        cell.detailTextLabel?.numberOfLines = 0
        return cell
    }
    // Название категории Section. nil для того чтобы не отображался заголовок.
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return nil
    }
}
