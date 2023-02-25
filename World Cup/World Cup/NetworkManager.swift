//
//  NetworkManager.swift
//  World Cup
//
//  Created by Дархан Есенкул on 22.01.2023.
//

import Foundation
import Alamofire

protocol MatchesNetworkManagerDelegate{
    func didUpdateMatches(with matches: [Matchdays])
}

protocol GroupsNetworkManagerDelegate{
    func didUpdateGroups(with groups: [GroupTeams])
}

protocol PreviousWCManagerDelegate{
    func didUpdatePrevious(with matchdays: [PreviousWCResults])
}

protocol PreviousWCGroupsManagerDelegate{
    func didUpdatePreviousGroups(with groups: [GroupsStandings])
}


struct NetworkManager{
    var matchesDelegate: MatchesNetworkManagerDelegate?
    var groupsDelegate: GroupsNetworkManagerDelegate?
    var previousDelegate: PreviousWCManagerDelegate?
    var previousGroupsDelegate: PreviousWCGroupsManagerDelegate?
    
    func getMatches(){
        let urlString = "https://raw.githubusercontent.com/openfootball/worldcup.json/master/2022/worldcup.json"
        AF.request(urlString).responseDecodable(of: MatchModelResponse.self) { response in
            switch response.result{
            case.success(let results):
                matchesDelegate?.didUpdateMatches(with: results.matches)
                print(results.matches[0].team1!)
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    func getGroups(){
        let urlString = "https://raw.githubusercontent.com/openfootball/worldcup.json/master/2022/worldcup.groups.json"
        AF.request(urlString).responseDecodable(of: GroupsModelResponse.self){ response in
            switch response.result{
            case.success(let results):
                groupsDelegate?.didUpdateGroups(with: results.groups)
            case.failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
    
    func getPreviousMathches(){
        let urlString = "https://raw.githubusercontent.com/openfootball/worldcup.json/master/2018/worldcup.json"
        AF.request(urlString).responseDecodable(of: PreviousWCResponse.self){ response in
            switch response.result{
            case.success(let results):
                previousDelegate?.didUpdatePrevious(with: results.rounds)
            case.failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
    
    
    func getPreviousGroups(){
        let urlString = "https://raw.githubusercontent.com/openfootball/worldcup.json/master/2018/worldcup.standings.json"
        AF.request(urlString).responseDecodable(of: PreviousWCGroupsModelResponse.self){ response in
            switch response.result{
            case.success(let results):
                previousGroupsDelegate?.didUpdatePreviousGroups(with: results.groups)
            case.failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
    
    
    
    
    
}
