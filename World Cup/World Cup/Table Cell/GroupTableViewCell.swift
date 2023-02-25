//
//  GroupTableViewCell.swift
//  World Cup
//
//  Created by Дархан Есенкул on 15.02.2023.
//

import UIKit
import Kingfisher

class GroupTableViewCell: UITableViewCell {

    @IBOutlet weak var groupLabel: UILabel!
    @IBOutlet weak var team1Flag: UIImageView!
    @IBOutlet weak var team1Label: UILabel!
    
    @IBOutlet weak var team2Flag: UIImageView!
    @IBOutlet weak var team2Label: UILabel!
    
    @IBOutlet weak var team3Flag: UIImageView!
    @IBOutlet weak var team3Label: UILabel!
    
    @IBOutlet weak var team4Flag: UIImageView!
    @IBOutlet weak var team4Label: UILabel!
    
    
    
    static let identifier = "groupCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "groupCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(with groups: GroupTeams){
        groupLabel.text = groups.name
        team1Label.text = groups.teams[0]
        team2Label.text = groups.teams[1]
        team3Label.text = groups.teams[2]
        team4Label.text = groups.teams[3]
        let imageUrl1 = URL(string: configureFlags(with: groups.teams[0]))
        let imageUrl2 = URL(string: configureFlags(with: groups.teams[1]))
        let imageUrl3 = URL(string: configureFlags(with: groups.teams[2]))
        let imageUrl4 = URL(string: configureFlags(with: groups.teams[3]))
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
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}
