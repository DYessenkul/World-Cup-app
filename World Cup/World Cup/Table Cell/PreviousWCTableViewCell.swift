//
//  PreviousVCTableViewCell.swift
//  World Cup
//
//  Created by Дархан Есенкул on 20.02.2023.
//

import UIKit

class PreviousWCTableViewCell: UITableViewCell {
    
    static let identifier = "previousWCCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "previousWCCell", bundle: nil)
    }
    
    
    
    @IBOutlet weak var team1Flag: UIImageView!
    @IBOutlet weak var team1Label: UILabel!
    
    @IBOutlet weak var team2Flag: UIImageView!
    @IBOutlet weak var team2Label: UILabel!
    
    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var stadium: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(with matches: MatchesResults){
        team1Label.text = matches.team1?.name
        team2Label.text = matches.team2?.name
        let imageUrl1 = URL(string: configureFlags(with: matches.team1?.name ?? ""))
        let imageUrl2 = URL(string: configureFlags(with: matches.team2?.name ?? ""))
        team1Flag.kf.setImage(with: imageUrl1)
        team2Flag.kf.setImage(with: imageUrl2)
        date.text = matches.date ?? ""
        time.text = matches.time ?? ""
        stadium.text = matches.stadium?.name ?? ""
        let knock = matches.knockout ?? false
        if knock == true{
            if matches.score1et == nil{
                score.text = String(matches.score1 ?? 0) + " : " + String(matches.score2 ?? 0)
            }
            else{
                score.text = String(matches.score1et ?? 0) + " : " + String(matches.score2et ?? 0)
            }
            
        }
        else{
            score.text = String(matches.score1 ?? 0) + " : " + String(matches.score2 ?? 0)
        }
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
