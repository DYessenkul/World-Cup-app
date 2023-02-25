//
//  MatchResultViewController.swift
//  World Cup
//
//  Created by Дархан Есенкул on 20.02.2023.
//

import UIKit

class MatchResultViewController: UIViewController {
    
    
    @IBOutlet weak var matchName: UILabel!
    @IBOutlet weak var matchTime: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var team1Flag: UIImageView!
    @IBOutlet weak var team2Flag: UIImageView!
    @IBOutlet weak var team1: UILabel!
    @IBOutlet weak var team2: UILabel!
    @IBOutlet weak var scores1: UILabel!
    @IBOutlet weak var scores2: UILabel!
    @IBOutlet weak var stadium: UILabel!
    @IBOutlet weak var justView: UIView!
    @IBOutlet weak var penalty: UILabel!
    var matchDay = ""
    
    var match: MatchesResults = MatchesResults(date: "", time: "", team1: nil, team2: nil, score1: 0, score2: 0, score1et: 0, score2et: 0, score1p: 0, score2p: 0, knockout: false, goals1: nil, goals2: nil, city: "", timezone: "", stadium: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        justView.layer.cornerRadius = 10
        justView.clipsToBounds = true
        matchName.text = matchDay
        matchTime.text = String(match.date ?? "") + " " + String(match.time ?? "")
        let imageUrl1 = URL(string: configureFlags(with: match.team1?.name ?? ""))
        let imageUrl2 = URL(string: configureFlags(with: match.team2?.name ?? ""))
        team1.text = match.team1?.name
        team2.text = match.team2?.name
        team1Flag.kf.setImage(with: imageUrl1)
        team2Flag.kf.setImage(with: imageUrl2)
        stadium.text = match.stadium?.name ?? ""
        let knock = match.knockout
        if knock == true{
            if match.score1et == nil{
                score.text = String(match.score1 ?? 0) + " : " + String(match.score2 ?? 0)
            }
            else if match.score1et == match.score2et{
                score.text = String(match.score1et ?? 0) + " : " + String(match.score2et ?? 0)
                penalty.text = "(" + String(match.score1p ?? 0) + " : " + String(match.score2p ?? 0) + ")"
            }
            else{
                score.text = String(match.score1et ?? 0) + " : " + String(match.score2et ?? 0)
            }
            
        }
        else{
            score.text = String(match.score1 ?? 0) + " : " + String(match.score2 ?? 0)
        }
        
        var scoring1 = ""
        if match.goals1?.count ?? 0>0{
            for i in 0..<match.goals1!.count{
                scoring1.append(String(match.goals1![i].name ?? "") + " " + String(match.goals1![i].minute ?? 0) + "'\n")
            }
        }
        else if match.goals1?.count ?? 0 == 0{
            scoring1 = ""
        }
            
        scores1.text = scoring1
        var scoring2 = ""
            if match.goals2?.count ?? 0>0{
                for i in 0..<match.goals2!.count{
                    scoring2.append(String(match.goals2![i].name ?? "") + " " + String(match.goals2![i].minute ?? 0) + "'\n")
                }
            }
        else if match.goals2?.count ?? 0 == 0{
            scoring2 = ""
        }
        scores2.text = scoring2
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
