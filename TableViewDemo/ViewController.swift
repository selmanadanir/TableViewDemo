//
//  ViewController.swift
//  TableViewDemo
//
//  Created by Selman ADANİR on 24.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    enum Sections: Int, CaseIterable {
        case users = 0
        case planet
        case button
        
        var title: String {
            switch self {
            case .users:
                return "Users"
            case .planet:
                return "Planet"
            case .button:
                return "Button"
            }
        }
    }
    
    var imageNumber = 0
    
    struct User {
        let name: String
        let number: String
    }
    
    let userData: [User] = [User(name: "User1", number: "1"),
                            User(name: "User2", number: "2"),
                            User(name: "User3", number: "3"),
                            User(name: "User4", number: "4"),
                            User(name: "User5", number: "5"),
                            User(name: "User6", number: "6")
    ]
    
    let images: [String] = ["earth","moon","saturn","mercury","mars"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
    private func setupUI() {
        tableView.register(UINib(nibName: "UserTableViewCell", bundle: .main), forCellReuseIdentifier: "UserTableViewCell")
        tableView.register(UINib(nibName: "ImageTableViewCell", bundle: .main), forCellReuseIdentifier: "ImageTableViewCell")
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Sections.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sections = Sections(rawValue: section) else {
            return 1
        }
        switch sections {
        case .users:
            return userData.count
        case .planet:
            return 1
        case .button:
            return 1
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let sections = Sections(rawValue: indexPath.section) else {
            return UITableViewCell()
        }
        
        switch sections {
        case .users:
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as? UserTableViewCell
            cell?.configureCell(user: userData[indexPath.row].name, number: userData[indexPath.row].number)
            return cell ?? UITableViewCell()
        case .planet:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell", for: indexPath) as? ImageTableViewCell
            cell?.configureCell(imageString: images[0])
            return cell ?? UITableViewCell()
        case .button:
            return UITableViewCell()
        }
    }
}
