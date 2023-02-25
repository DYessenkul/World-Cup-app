//
//  NewsTableViewCell.swift
//  World Cup
//
//  Created by Дархан Есенкул on 25.02.2023.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var news: UILabel!
    @IBOutlet weak var newsText: UILabel!

    @IBOutlet weak var someView: UIView!
    
    static let identifier = "newsCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "newsCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
