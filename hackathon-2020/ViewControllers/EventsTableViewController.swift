//
//  EventsTableViewController.swift
//  hackathon-2020
//
//  Created by art-off on 31.10.2020.
//

import UIKit

class EventsTableViewController: UITableViewController {
    
    override func loadView() {
        super.loadView()
        
        tableView.register(
            UINib(nibName: ForYouItemTableViewCell.nibName, bundle: nil),
            forCellReuseIdentifier: ForYouItemTableViewCell.reuseIdentifier)
        tableView.register(
            UINib(nibName: ItemTableViewCell.nibName, bundle: nil),
            forCellReuseIdentifier: ItemTableViewCell.reuseIdentifier)
        
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.separatorStyle = .none
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = Colors.red
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [.font: UIFont(name: "Yanone Kaffeesatz", size: 28)!, .foregroundColor: UIColor.white]
        title = "Мероприятия"
    }

}

// MARK: - Table View Data Source
extension EventsTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if Int.random(in: 0...6) % 2 == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ForYouItemTableViewCell.reuseIdentifier, for: indexPath) as! ForYouItemTableViewCell
            cell.nameLabel.text = "slkdjfl;askdjf laskjdfl ;aksjdfl; kasjdfl; kajsdl; fkjas;ldk fjasl;dkjf al;sdkjf l;askjdf l;ajksdfl; kjfas;lkdj fl;kasj d;lkfaj s"
            cell.forYouView.backgroundColor = Colors.red
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.reuseIdentifier, for: indexPath) as! ItemTableViewCell
            cell.nameLabel.text = "slkdjfl;askdjf laskjdfl ;aksjdfl; kasjdfl; kajsdl; fkjas;ldk fjasl;dkjf al;sdkjf l;askjdf l;ajksdfl; kjfas;lkdj fl;kasj d;lkfaj s"
            return cell
        }
    }
    
}

// MARK: - Table View Delegate
extension EventsTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(BookViewController(), animated: true)
    }
    
}
