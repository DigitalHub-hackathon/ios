//
//  GroupsTableViewController.swift
//  hackathon-2020
//
//  Created by art-off on 31.10.2020.
//

import UIKit

class GroupsTableViewController: UITableViewController {
    
    let alertView = AlertView()
    
    var recomendationDataSource = [RGroups]()
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
        
        var ids = [Int]()
        for ie in UserHelper.getCurrUser()!.likedGroups {
            ids.append(ie.groupId)
        }
        ApiManager.loadRecomendationGroups(idGroups: ids) { events in
            guard let e = events else { return }
            DispatchQueue.main.async {
                self.recomendationDataSource = e
                self.tableView.reloadData()
            }
        }
        ApiManager.loadGroups(numberPage: 0) { events in
            guard let e = events else { return }
            DispatchQueue.main.async {
                self.dataSource = e
                self.tableView.reloadData()
            }
        }
    }
    
    @IBAction func refreshButtonTapped(_ sender: Any) {
        var ids = [Int]()
        for ie in UserHelper.getCurrUser()!.likedGroups {
            ids.append(ie.groupId)
        }
        ApiManager.loadRecomendationGroups(idGroups: ids) { events in
            guard let e = events else { return }
            DispatchQueue.main.async {
                self.recomendationDataSource = e
                self.tableView.reloadData()
            }
        }
        ApiManager.loadGroups(numberPage: 0) { events in
            guard let e = events else { return }
            DispatchQueue.main.async {
                self.dataSource = e
                self.tableView.reloadData()
            }
        }
    }
    

}

// MARK: - Table View Data Source
extension GroupsTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count + recomendationDataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < recomendationDataSource.count {
            let event = recomendationDataSource[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: ForYouItemTableViewCell.reuseIdentifier, for: indexPath) as! ForYouItemTableViewCell
            cell.nameLabel.text = event.name
            cell.dateLabel.text = event.organization?.street
            cell.addressLabel.text = "\(event.duration.components(separatedBy: ",0000")[0]) \(event.duration.components(separatedBy: ",0000")[1])"
            cell.forYouView.isHidden = false
            cell.delegate = self
            cell.id = event.id
            return cell
        } else {
            let event = dataSource[indexPath.row - recomendationDataSource.count]
            let cell = tableView.dequeueReusableCell(withIdentifier: ForYouItemTableViewCell.reuseIdentifier, for: indexPath) as! ForYouItemTableViewCell
            cell.nameLabel.text = event.name
            cell.dateLabel.text = event.organization?.street
            cell.addressLabel.text = "\(event.duration.components(separatedBy: ",0000")[0]) \(event.duration.components(separatedBy: ",0000")[1])"
            cell.forYouView.isHidden = true
            cell.delegate = self
            cell.id = event.id
            return cell
        }
    }
    
}

//// MARK: - Table View Delegate
//extension GroupsTableViewController {
//    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        navigationController?.pushViewController(BookViewController(), animated: true)
//    }
//    
//}

extension GroupsTableViewController: ShowingAlertDelegate {
    
    func showAlert(withText alertText: String, id: Int) {
        if !view.subviews.contains(alertView) {
            view.addSubview(alertView)

            alertView.translatesAutoresizingMaskIntoConstraints = false
            alertView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
            alertView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        }

        alertView.alertLabel.text = alertText
        alertView.hideWithAnimation()
        
        let group = dataSource.filter { $0.id == id }.first
        if let g = group {
            UserHelper.addLikedGroupToCurrUser(group: g)
        }
        print(UserHelper.getCurrUser())
    }
    
}
