//
//  MatchModel.swift
//  World Cup
//
//  Created by Дархан Есенкул on 22.01.2023.
//

import Foundation


struct MatchModelResponse: Decodable{
    let matches: [Matchdays]
}

struct Matchdays: Decodable{
    let round: String?
    let group: String?
    let date: String?
    let team1: String?
    let team2: String?
}

struct GroupsModelResponse: Decodable{
    let groups: [GroupTeams]
}


struct GroupTeams: Decodable{
    let name: String?
    let teams: [String]
}


struct PreviousWCResponse: Decodable{
    let rounds: [PreviousWCResults]
}

struct PreviousWCResults: Decodable{
    let name: String?
    let matches: [MatchesResults]?
}


struct MatchesResults: Decodable{
    let date: String?
    let time: String?
    let team1: Teams?
    let team2: Teams?
    let score1: Int?
    let score2: Int?
    let score1et: Int?
    let score2et: Int?
    let score1p: Int?
    let score2p: Int?
    let knockout: Bool?
    let goals1: [Goals]?
    let goals2: [Goals]?
    let city: String?
    let timezone: String?
    let stadium: Stadium?
    
}

struct PreviousWCGroupsModelResponse: Decodable{
    let groups: [GroupsStandings]
}

struct GroupsStandings: Decodable{
    let name: String?
    let standings: [Standings]
}

struct Standings: Decodable{
    let team: Teams?
    let pos: Int?
    let played: Int?
    let goals_for: Int?
    let goals_against: Int?
    let pts: Int?
}

struct Teams: Decodable{
    let name: String?
}

struct Goals: Decodable{
    let name: String?
    let minute: Int?
}

struct Stadium: Decodable{
    let name: String?
}


struct NewsModel{
    let image: String
    let title: String
    let text: String
}
