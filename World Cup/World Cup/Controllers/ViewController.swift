//
//  ViewController.swift
//  World Cup
//
//  Created by Дархан Есенкул on 17.01.2023.
//

import UIKit
import ShimmerSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MatchesNetworkManagerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    
    var networkManager = NetworkManager()
    var allMatches = [[Matchdays]]()
    var matches = [Matchdays]()
    var matchday1 = [Matchdays]()
    var matchday2 = [Matchdays]()
    var matchday3 = [Matchdays]()
    var matchday4 = [Matchdays]()
    var matchday5 = [Matchdays]()
    var matchday6 = [Matchdays]()
    var matchday7 = [Matchdays]()
    var matchday8 = [Matchdays]()
    var matchday9 = [Matchdays]()
    var matchday10 = [Matchdays]()
    var matchday11 = [Matchdays]()
    var matchday12 = [Matchdays]()
    var matchday13 = [Matchdays]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "wc22")
        imageView.contentMode = UIView.ContentMode.scaleToFill
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        tableView.clipsToBounds = true
        tableView.layer.cornerRadius = 10
        self.navigationController?.isNavigationBarHidden = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CollectionTableViewCell.nib(), forCellReuseIdentifier: CollectionTableViewCell.identifier)
        let shimmerView = ShimmeringView(frame: CGRect(x: 20, y: 55, width: 350, height: 160))
        view.addSubview(shimmerView)
//        shimmerView.center = view.center
        imageView.frame = shimmerView.bounds
        shimmerView.contentView = imageView
        shimmerView.isShimmering = true
        networkManager.matchesDelegate = self
        networkManager.getMatches()
        
        
    }
    
    func didUpdateMatches(with matches: [Matchdays]) {
        self.matches = matches
        DispatchQueue.main.async {
            self.sortingMatches()
            self.tableView.reloadData()
        }
    }
    
    func sortingMatches(){
        for match in matches{
            switch match.round{
            case "Matchday 1": matchday1.append(match)
            case "Matchday 2": matchday2.append(match)
            case "Matchday 3": matchday3.append(match)
            case "Matchday 4": matchday4.append(match)
            case "Matchday 5": matchday5.append(match)
            case "Matchday 6": matchday6.append(match)
            case "Matchday 7": matchday7.append(match)
            case "Matchday 8": matchday8.append(match)
            case "Matchday 9": matchday9.append(match)
            case "Matchday 10": matchday10.append(match)
            case "Matchday 11": matchday11.append(match)
            case "Matchday 12": matchday12.append(match)
            case "Matchday 13": matchday13.append(match)
            default: print("not found")
            }
            
        }
        allMatches = [matchday1, matchday2, matchday3, matchday4, matchday5, matchday6, matchday7,
                      matchday8, matchday9, matchday10, matchday11, matchday12, matchday13]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as? CollectionTableViewCell else {return UITableViewCell()}
        cell.configure(with: allMatches[indexPath.section])
        return cell
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return allMatches.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Matchday \(section+1)"
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
}


