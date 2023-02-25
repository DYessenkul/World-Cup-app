//
//  GroupsViewController.swift
//  World Cup
//
//  Created by Дархан Есенкул on 15.02.2023.
//

import UIKit

class GroupsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, GroupsNetworkManagerDelegate {
  
    @IBOutlet weak var tableView: UITableView!

    
    var groups = [GroupTeams]()
    var networkManger = NetworkManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        tableView.delegate = self
        tableView.dataSource = self
        networkManger.groupsDelegate = self
        networkManger.getGroups()
        self.title = "Groups"
        
    }
    
    
    func didUpdateGroups(with groups: [GroupTeams]) {
        self.groups = groups
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GroupTableViewCell.identifier) as! GroupTableViewCell
        cell.configure(with: groups[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }



}
