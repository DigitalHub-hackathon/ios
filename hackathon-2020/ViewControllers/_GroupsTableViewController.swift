//
//  _GroupsTableViewController.swift
//  hackathon-2020
//
//  Created by art-off on 01.11.2020.
//

import UIKit

class _GroupsTableViewController: UITableViewController {
    
    var dataSource = [RGroups]()
    
    override func loadView() {
        super.loadView()
        
        tableView.register(
            UINib(nibName: ForYouItemTableViewCell.nibName, bundle: nil),
            forCellReuseIdentifier: ForYouItemTableViewCell.reuseIdentifier)
        
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
        title = "Кружки"
        
        tabBarController?.tabBar.tintColor = Colors.red
        tabBarController?.tabBar.barTintColor = Colors.purple
    }

}

// MARK: - Table View Data Source
extension _GroupsTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let event = dataSource[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: ForYouItemTableViewCell.reuseIdentifier, for: indexPath) as! ForYouItemTableViewCell
        cell.nameLabel.text = event.name
        cell.dateLabel.text = event.organization?.street
        cell.addressLabel.text = "\(event.duration.components(separatedBy: ",0000")[0]) \(event.duration.components(separatedBy: ",0000")[1])"
        cell.forYouView.isHidden = true
        cell.goButton.isHidden = true
        cell.id = event.id
        return cell
    }
    
}
