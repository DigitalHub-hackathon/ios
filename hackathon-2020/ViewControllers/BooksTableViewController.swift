//
//  BooksTableViewController.swift
//  hackathon-2020
//
//  Created by art-off on 30.10.2020.
//

import UIKit

class BooksTableViewController: UITableViewController {
    
    override func loadView() {
        super.loadView()
        
        tableView.register(
            UINib(nibName: ForYouItemTableViewCell.nibName, bundle: nil),
            forCellReuseIdentifier: ForYouItemTableViewCell.reuseIdentifier)
//        tableView.register(
//            UINib(nibName: ItemTableViewCell.nibName, bundle: nil),
//            forCellReuseIdentifier: ItemTableViewCell.reuseIdentifier)
        
        view.backgroundColor = Colors.darkPurple
        
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.separatorStyle = .none
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = Colors.red
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [.font: UIFont(name: "Yanone Kaffeesatz", size: 28)!, .foregroundColor: UIColor.white]
        title = "Книги"
        
        tabBarController?.tabBar.tintColor = Colors.red
        tabBarController?.tabBar.barTintColor = Colors.purple
    }

}

// MARK: - Table View Data Source
extension BooksTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ForYouItemTableViewCell.reuseIdentifier, for: indexPath) as! ForYouItemTableViewCell
        cell.nameLabel.text = "slkdjfl;askdjf laskjdfl ;aksjdfl; kasjdfl; kajsdl; fkjas;ldk fjasl;dkjf al;sdkjf l;askjdf l;ajksdfl; kjfas;lkdj fl;kasj d;lkfaj s"
        return cell
    }
    
}

// MARK: -  Table View Delegate
extension BooksTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(EventViewController(), animated: true)
    }
    
}
