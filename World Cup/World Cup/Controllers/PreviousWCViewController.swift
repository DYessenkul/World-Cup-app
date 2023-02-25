//
//  PreviousWCViewController.swift
//  World Cup
//
//  Created by Дархан Есенкул on 20.02.2023.
//

import UIKit
import ShimmerSwift


class PreviousWCViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, PreviousWCManagerDelegate  {


    @IBOutlet weak var championsImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    
    var previousWC = [PreviousWCResults]()
    var networkManager = NetworkManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        championsImage.image = UIImage(named: "ch18")
        championsImage.contentMode = UIView.ContentMode.scaleAspectFill
        championsImage.layer.cornerRadius = 50
        championsImage.clipsToBounds = true
        let shimmerView = ShimmeringView(frame: CGRect(x: 10, y: 91, width: 370, height: 180))
        view.addSubview(shimmerView)
//        shimmerView.center = view.center
        championsImage.frame = shimmerView.bounds
        shimmerView.contentView = championsImage
        shimmerView.isShimmering = true
        networkManager.previousDelegate = self
        networkManager.getPreviousMathches()
        
    }
    @IBAction private func groupsButtonDidTap(_ sender: UIButton){
        let previousWCGroupsVC = storyboard?.instantiateViewController(withIdentifier: "PreviousGroupsVC") as? PreviousGroupsViewController
        self.navigationController?.pushViewController(previousWCGroupsVC!, animated: true)
    }
    
    
    func didUpdatePrevious(with matchdays: [PreviousWCResults]) {
        self.previousWC = matchdays.reversed()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return previousWC.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return previousWC[section].name
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return previousWC[section].matches?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PreviousWCTableViewCell.identifier, for: indexPath) as! PreviousWCTableViewCell
        cell.configure(with: previousWC[indexPath.section].matches![indexPath.row])
        cell.contentView.layer.cornerRadius = 20
        cell.contentView.layer.masksToBounds = true
        cell.contentView.clipsToBounds = true
        cell.contentView.backgroundColor = UIColor.secondarySystemBackground
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "MatchResultVC") as?
        MatchResultViewController
        vc?.match = previousWC[indexPath.section].matches![indexPath.row]
        vc?.matchDay = previousWC[indexPath.section].name ?? ""
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }

    

}
