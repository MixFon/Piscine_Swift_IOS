//
//  ListViewController.swift
//  Kanto
//
//  Created by Михаил Фокин on 30.11.2020.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var listLocation = Location.allNameLocation
    
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

extension ListViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listLocation.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.detailTextLabel?.text = listLocation[indexPath.row].nameLocation
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Location.selectCell = indexPath.row
        print("Cellekted \(Location.selectCell)")
        tabBarController?.selectedIndex = 1
    }
}
