//
//  ProfileViewController.swift
//  hackathon-2020
//
//  Created by art-off on 01.11.2020.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    @IBOutlet weak var fioLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var myEventsButton: UIButton!
    @IBOutlet weak var myGroupsButton: UIButton!
    @IBOutlet weak var myBookButton: UIButton!
    
    @IBOutlet weak var fioLabelView: UIView!
    @IBOutlet weak var yearLabelView: UIView!
    @IBOutlet weak var genderLabelView: UIView!
    @IBOutlet weak var emailLabelView: UIView!
    
    @IBOutlet weak var myEventButtonView: UIView!
    @IBOutlet weak var myGroupsButtonView: UIView!
    @IBOutlet weak var myBookButtonView: UIView!
    
    
    override func loadView() {
        super.loadView()
        
        navigationController?.navigationBar.barTintColor = Colors.red
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [.font: UIFont(name: "Yanone Kaffeesatz", size: 28)!, .foregroundColor: UIColor.white]
        title = "Профиль"
        
        view.backgroundColor = Colors.darkPurple
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLabels()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let user = UserHelper.getCurrUser() {
            fioLabel.text = "\(user.lastName) \(user.firstName) \(user.patronymic)"
            yearLabel.text = "\(UserHelper.yearCurrUser()!) лет"
            if user.gender == "male" {
                genderLabel.text = "Мужской"
            } else {
                genderLabel.text = "Женский"
            }
            emailLabel.text = user.email
        }
    }
    
    private func setupLabels() {
        for view in [fioLabelView, yearLabelView, genderLabelView, emailLabelView] {
            view?.layer.cornerRadius = 15
            view?.backgroundColor = Colors.purple
        }
        
        for view in [myEventButtonView, myGroupsButtonView, myBookButtonView] {
            view?.backgroundColor = Colors.purple
        }
        
        myEventButtonView.roundCorner(corners: [.topLeft, .topRight], radius: 15)
        myBookButtonView.roundCorner(corners: [.bottomLeft, .bottomRigth], radius: 15)
    }

    @IBAction func myEventsButtonTapped(_ sender: Any) {
        var events = [REvent]()
        for le in UserHelper.getCurrUser()!.likedEvents {
            events.append(le.event!)
        }
        
        let evc = _EventsTableViewController()
        evc.dataSource = events
        navigationController?.pushViewController(evc, animated: true)
    }
    
    @IBAction func myGroupsButtonTapped(_ sender: Any) {
        var groups = [RGroups]()
        for le in UserHelper.getCurrUser()!.likedGroups {
            groups.append(le.group!)
        }
        
        let gvc = _GroupsTableViewController()
        gvc.dataSource = groups
        navigationController?.pushViewController(gvc, animated: true)
    }
    
    @IBAction func myBookButtonTapped(_ sender: Any) {
    }
    
}
