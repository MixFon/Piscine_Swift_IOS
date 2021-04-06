//
//  ViewController.swift
//  Death_Note
//
//  Created by Михаил Фокин on 25.11.2020.
//

import UIKit

var deathNote = LinstPeople()

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    let reuseIdetnifier = "my cell"
    //var deathNote = LinstPeople()
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdetnifier)
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        print("vieWillApper")
        super.viewWillAppear(animated)
        //Для обновления таблицы вызываем следующий метод.
        tableView.reloadData()
        //Метод ниже пересоздает таблицу
        //loadView()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    @IBAction func pressAdd(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "seguaToAdd", sender: nil)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdetnifier, for: indexPath) as! TableViewCell
        let human = deathNote.listHuman[indexPath.section]
        cell.namePerson.text = human.name
        cell.datePerson.text = human.dateDeath.description
        cell.descriptionPersnon.text = human.description
        // Задаем неограниченное количество строк
        cell.textLabel?.numberOfLines = 0
        // Задаем неограниченное количество строк
        cell.detailTextLabel?.numberOfLines = 0
        return cell
    }
    // Название категории Section. nil для того чтобы не отображался заголовок.
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return nil
    }
}

/*
let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
cell.textLabel?.text = deathNote.listHuman[indexPath.section].name
// Задаем неограниченное количество строк
cell.textLabel?.numberOfLines = 0
// Описание деталей.
cell.detailTextLabel?.text = deathNote.listHuman[indexPath.section].description
// Задаем неограниченное количество строк
cell.detailTextLabel?.numberOfLines = 0
return cell
*/
