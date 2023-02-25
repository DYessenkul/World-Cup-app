//
//  PreviousGroupsViewController.swift
//  World Cup
//
//  Created by Дархан Есенкул on 20.02.2023.
//

import UIKit

class PreviousGroupsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, PreviousWCGroupsManagerDelegate {

    

    
    @IBOutlet weak var tableView: UITableView!
    
    var networkManger = NetworkManager()
    
    var groupStandings = [GroupsStandings]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        networkManger.previousGroupsDelegate = self
        networkManger.getPreviousGroups()
    }
    
    func didUpdatePreviousGroups(with groups: [GroupsStandings]) {
        self.groupStandings = groups
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }


    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupStandings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "previousGroupsWCCell", for: indexPath) as!
        PreviousGroupsTableViewCell
        cell.configure(with: groupStandings[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }



}
