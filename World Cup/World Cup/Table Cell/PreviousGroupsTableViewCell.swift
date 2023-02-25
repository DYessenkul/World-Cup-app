//
//  PreviousGroupsTableViewCell.swift
//  World Cup
//
//  Created by Дархан Есенкул on 20.02.2023.
//

import UIKit
import Kingfisher

class PreviousGroupsTableViewCell: UITableViewCell {
    
    static let identifier = "previousGroupsWCCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "previousGroupsWCCell", bundle: nil)
    }
    
    @IBOutlet weak var groupLabel: UILabel!
    @IBOutlet weak var team1Flag: UIImageView!
    @IBOutlet weak var team1: UILabel!
    @IBOutlet weak var team1Games: UILabel!
    @IBOutlet weak var team1GR: UILabel!
    @IBOutlet weak var team1Pts: UILabel!
    
    @IBOutlet weak var team2Flag: UIImageView!
    @IBOutlet weak var team2: UILabel!
    @IBOutlet weak var team2Games: UILabel!
    @IBOutlet weak var team2GR: UILabel!
    @IBOutlet weak var team2Pts: UILabel!
    
    @IBOutlet weak var team3Flag: UIImageView!
    @IBOutlet weak var team3: UILabel!
    @IBOutlet weak var team3Games: UILabel!
    @IBOutlet weak var team3GR: UILabel!
    @IBOutlet weak var team3Pts: UILabel!
    
    @IBOutlet weak var team4Flag: UIImageView!
    @IBOutlet weak var team4: UILabel!
    @IBOutlet weak var team4Games: UILabel!
    @IBOutlet weak var team4GR: UILabel!
    @IBOutlet weak var team4Pts: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    
    func configure(with groups: GroupsStandings){
        groupLabel.text = groups.name
        team1.text = String((groups.standings[0].team?.name)!)
        team2.text = String((groups.standings[1].team?.name)!)
        team3.text = String((groups.standings[2].team?.name)!)
        team4.text = String((groups.standings[3].team?.name)!)
        team1Games.text = String(groups.standings[0].played!)
        team2Games.text = String(groups.standings[1].played!)
        team3Games.text = String(groups.standings[2].played!)
        team4Games.text = String(groups.standings[3].played!)
        team1GR.text = String(String(groups.standings[0].goals_for!) + ":" + String(groups.standings[0].goals_against!))
        team2GR.text = String(String(groups.standings[1].goals_for!) + ":" + String(groups.standings[1].goals_against!))
        team3GR.text = String(String(groups.standings[2].goals_for!) + ":" +  String(groups.standings[2].goals_against!))
        team4GR.text = String(String(groups.standings[3].goals_for!) + ":" + String(groups.standings[3].goals_against!))
        team1Pts.text = String(groups.standings[0].pts!)
        team2Pts.text = String(groups.standings[1].pts!)
        team3Pts.text = String(groups.standings[2].pts!)
        team4Pts.text = String(groups.standings[3].pts!)
        let imageUrl1 = URL(string: configureFlags(with: String((groups.standings[0].team?.name)!)))
        let imageUrl2 = URL(string: configureFlags(with: String((groups.standings[1].team?.name)!)))
        let imageUrl3 = URL(string: configureFlags(with: String((groups.standings[2].team?.name)!)))
        let imageUrl4 = URL(string: configureFlags(with: String((groups.standings[3].team?.name)!)))
        team1Flag.kf.setImage(with: imageUrl1)
        team2Flag.kf.setImage(with: imageUrl2)
        team3Flag.kf.setImage(with: imageUrl3)
        team4Flag.kf.setImage(with: imageUrl4)
    }
    
    
    func configureFlags(with country: String) -> String{
        var url = ""
        if country == "Russia"{
            url = "https://countryflagsapi.com/png/rus"
        }
        else if country == "South Korea"{
            url = "https://countryflagsapi.com/png/kor"
        }
        else if country == "Bosnia-Herzegovina"{
            url = "https://countryflagsapi.com/png/bih"
        }
        else if country == "United States"{
            url = "https://countryflagsapi.com/png/us"
        }
        else if country == "Saudi Arabia"{
            url = "https://countryflagsapi.com/png/sau"
        }
        else if country == "Costa Rica"{
            url = "https://countryflagsapi.com/png/cri"
        }
        else{
            url = "https://countryflagsapi.com/png/\(country.trimmingCharacters(in: .whitespaces))"
        }
        return url
    }

}
