//
//  MyCollectionViewCell.swift
//  World Cup
//
//  Created by Дархан Есенкул on 25.01.2023.
//

import UIKit
import Kingfisher

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var team1Flag: UIImageView!
    @IBOutlet weak var team2Flag: UIImageView!
    @IBOutlet weak var team1: UILabel!
    @IBOutlet weak var team2: UILabel!
    @IBOutlet weak var group: UILabel!
    @IBOutlet weak var date: UILabel!
    
    static let identifier = "MyCollectionViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with match: Matchdays){
        self.configureForTeam1(with: match.team1!)
        self.configureForTeam2(with: match.team2!)
        group.text = match.group
        date.text = match.date
    }
    
    public func configureForTeam1(with country: String){
        if country == "Russia"{
            guard let imageUrl = URL(string: "https://countryflagsapi.com/png/rus") else{return}
        team1Flag.kf.setImage(with: imageUrl)
            team1.text = country
        }
        else if country == "South Korea"{
            guard let imageUrl = URL(string: "https://countryflagsapi.com/png/kor") else{return}
        team1Flag.kf.setImage(with: imageUrl)
            team1.text = country
        }
        else if country == "Bosnia-Herzegovina"{
            guard let imageUrl = URL(string: "https://countryflagsapi.com/png/bih") else{return}
        team1Flag.kf.setImage(with: imageUrl)
            team1.text = country
        }
        else if country == "United States"{
            guard let imageUrl = URL(string: "https://countryflagsapi.com/png/us") else{return}
        team1Flag.kf.setImage(with: imageUrl)
            team1.text = country
        }
        else if country == "Saudi Arabia"{
            guard let imageUrl = URL(string: "https://countryflagsapi.com/png/sau") else{return}
        team1Flag.kf.setImage(with: imageUrl)
            team1.text = country
        }
        else if country == "Costa Rica"{
            guard let imageUrl = URL(string:"https://countryflagsapi.com/png/cri") else{return}
            team1Flag.kf.setImage(with: imageUrl)
            team1.text = country
        }
        else {
            guard let imageUrl = URL(string: "https://countryflagsapi.com/png/\(country.trimmingCharacters(in: .whitespaces))") else{return}
            team1Flag.kf.setImage(with: imageUrl)
            team1.text = country
        }
        
    }
    public func configureForTeam2(with country: String){
        if country == "Russia"{
            guard let imageUrl = URL(string: "https://countryflagsapi.com/png/rus") else{return}
        team2Flag.kf.setImage(with: imageUrl)
            team2.text = country
        }
        else if country == "South Korea"{
            guard let imageUrl = URL(string: "https://countryflagsapi.com/png/kor") else{return}
        team2Flag.kf.setImage(with: imageUrl)
            team2.text = country
        }
        else if country == "Bosnia-Herzegovina"{
            guard let imageUrl = URL(string: "https://countryflagsapi.com/png/bih") else{return}
        team2Flag.kf.setImage(with: imageUrl)
            team2.text = country
        }
        else if country == "United States"{
            guard let imageUrl = URL(string: "https://countryflagsapi.com/png/us") else{return}
        team2Flag.kf.setImage(with: imageUrl)
            team2.text = country
        }
        else if country == "Saudi Arabia"{
            guard let imageUrl = URL(string: "https://countryflagsapi.com/png/sau") else{return}
        team2Flag.kf.setImage(with: imageUrl)
            team2.text = country
        }
        else if country == "Costa Rica"{
            guard let imageUrl = URL(string:"https://countryflagsapi.com/png/cri") else{return}
            team2Flag.kf.setImage(with: imageUrl)
            team2.text = country
        }
        else {
            guard let imageUrl = URL(string: "https://countryflagsapi.com/png/\(country.trimmingCharacters(in: .whitespaces))") else{return}
            team2Flag.kf.setImage(with: imageUrl)
            team2.text = country
        }
        
    }
    
}
