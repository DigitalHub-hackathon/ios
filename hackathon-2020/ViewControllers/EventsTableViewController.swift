//
//  EventsTableViewController.swift
//  hackathon-2020
//
//  Created by art-off on 31.10.2020.
//

import UIKit

class EventsTableViewController: UITableViewController {
    
    let alertView = AlertView()
    
    var recomendationDataSource = [REvent]()
    var dataSource = [REvent]()
    
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
        title = "Мероприятия"
        
        tabBarController?.tabBar.tintColor = Colors.red
        tabBarController?.tabBar.barTintColor = Colors.purple
        
        var ids = [Int]()
        for ie in UserHelper.getCurrUser()!.likedEvents {
            ids.append(ie.eventId)
        }
        ApiManager.loadRecomendationEvents(idEvents: ids) { events in
            guard let e = events else { return }
            DispatchQueue.main.async {
                self.recomendationDataSource = e
                self.tableView.reloadData()
            }
        }
        ApiManager.loadEvents(numberPage: 0) { events in
            guard let e = events else { return }
            DispatchQueue.main.async {
                self.dataSource = e
                self.tableView.reloadData()
            }
        }
    }
    
    
    @IBAction func refreshEvents(_ sender: Any) {
        var ids = [Int]()
        for ie in UserHelper.getCurrUser()!.likedEvents {
            ids.append(ie.eventId)
        }
        ApiManager.loadRecomendationEvents(idEvents: ids) { events in
            guard let e = events else { return }
            DispatchQueue.main.async {
                self.recomendationDataSource = e
                self.tableView.reloadData()
            }
        }
        ApiManager.loadEvents(numberPage: 0) { events in
            guard let e = events else { return }
            DispatchQueue.main.async {
                self.dataSource = e
                self.tableView.reloadData()
            }
        }
    }
    
}

// MARK: - Table View Data Source
extension EventsTableViewController {
    
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
            cell.dateLabel.text = event.start_date
            cell.addressLabel.text = event.place
            cell.forYouView.isHidden = false
            cell.delegate = self
            cell.id = event.id
            return cell
        } else {
            let event = dataSource[indexPath.row - recomendationDataSource.count]
            let cell = tableView.dequeueReusableCell(withIdentifier: ForYouItemTableViewCell.reuseIdentifier, for: indexPath) as! ForYouItemTableViewCell
            cell.nameLabel.text = event.name
            cell.dateLabel.text = event.start_date
            cell.addressLabel.text = event.place
            cell.forYouView.isHidden = true
            cell.delegate = self
            cell.id = event.id
            return cell
        }
    }
    
}

// MARK: - Table View Delegate
extension EventsTableViewController {
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let event: REvent
//        if indexPath.row < recomendationDataSource.count {
//            event = recomendationDataSource[indexPath.row]
//        } else {
//            event = dataSource[indexPath.row - recomendationDataSource.count]
//        }
//        let evc = EventViewController()
//        //evc.nameLabel.text = event.name
//        evc.typeLabel.text = event.type
//        evc.areaLabel.text = event.area
//        evc.priceLabel.text = event.price
//        evc.statusLabel.text = event.status
//        evc.onlineLabel.text = event.online ? "Онлайн" : "Офлайн"
//        evc.directionLabel.text = event.direction
//        evc.stopTimeLabel.text = event.stop_time
//        evc.stopDateLabel.text = event.stop_date
//        evc.startDateLabel.text = event.start_date
//        evc.startTileLabel.text = event.start_time
//        evc.healthLinitationsLabel.text = event.health_limitations ? "Органниченное здоровье" : "Не органиченное здоровье"
//        navigationController?.pushViewController(evc, animated: true)
//    }
    
}

extension EventsTableViewController: ShowingAlertDelegate {
    
    func showAlert(withText alertText: String, id: Int) {
        if !view.subviews.contains(alertView) {
            view.addSubview(alertView)

            alertView.translatesAutoresizingMaskIntoConstraints = false
            alertView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
            alertView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        }

        alertView.alertLabel.text = alertText
        alertView.hideWithAnimation()
        
        let event = dataSource.filter { $0.id == id }.first
        if let e = event {
            UserHelper.addLikedEventToCurrUser(event: e)
        }
        print(UserHelper.getCurrUser())
    }
    
}
