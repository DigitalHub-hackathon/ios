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
            UINib(nibName: ItemTableViewCell.nibName, bundle: nil),
            forCellReuseIdentifier: ItemTableViewCell.reuseIdentifier)
        
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.separatorStyle = .none
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.reuseIdentifier, for: indexPath) as! ItemTableViewCell
        if Int.random(in: 0...5) % 2 == 0 {
            cell.nameLabel.text = "dddddslkdjflskdjf lskdjfl ksdjfl kjsdlfkj ";
        } else {
            cell.nameLabel.text = "slkdjfl;askdjf laskjdfl ;aksjdfl; kasjdfl; kajsdl; fkjas;ldk fjasl;dkjf al;sdkjf l;askjdf l;ajksdfl; kjfas;lkdj fl;kasj d;lkfaj s";
        }
        return cell
    }
    
}

// MARK: -
extension BooksTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(BookViewController(), animated: true)
    }
    
}
