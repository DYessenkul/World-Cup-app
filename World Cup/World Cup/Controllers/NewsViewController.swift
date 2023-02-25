//
//  NewsViewController.swift
//  World Cup
//
//  Created by Дархан Есенкул on 25.02.2023.
//

import UIKit

class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var news = [NewsModel](arrayLiteral: NewsModel(image: "canFrance", title: "Can France defend their World Cup title in Qatar?", text: "The title’s current holders head into the World Cup as one of the favourites, but recent poor results have raised some concerns."),
                  NewsModel(image: "lastWC", title: "The 10 stars for whom Qatar will likely be their last World Cup", text: "From Messi to Suarez to Benzema, these are the prominent players likely to make final bow in top competition."),
                  NewsModel(image: "germany", title: "Germany looking to make amends at World Cup 2022", text: "Four-time World Cup winners failed to reach the knockout rounds at Russia 2018 despite being defending champions."),
                  NewsModel(image: "missing", title: "Ten players missing out on World Cup 2022 due to injury", text: "Here are some players who helped their teams qualify, are good enough to be in squad but then miss the flight due to an unfortunate injury."),
                  NewsModel(image: "fans", title: "World Cup fans ready to party despite beer ban in Qatar stadiums", text: "Sudden ruling by the government to halt all beer sales at stadiums welcomed by some fans as others criticise the last-minute timing of the announcement."))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier, for: indexPath) as! NewsTableViewCell
        cell.newsImage.image = UIImage(named: news[indexPath.row].image)
        cell.news.text = news[indexPath.row].title
        cell.newsText.text = news[indexPath.row].text
        cell.someView.layer.cornerRadius = 10
        cell.someView.clipsToBounds = true
        cell.newsImage.layer.cornerRadius = 10
        cell.newsImage.clipsToBounds = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    


}
