//
//  LastWCViewController.swift
//  World Cup
//
//  Created by Дархан Есенкул on 19.02.2023.
//

import UIKit
import ShimmerSwift

class LastWCViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var button: UIButton!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "wc18")
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        let shimmerView = ShimmeringView(frame: CGRect(x: 25, y: 161, width: 340, height: 430))
        view.addSubview(shimmerView)
        imageView.frame = shimmerView.bounds
        shimmerView.contentView = imageView
        shimmerView.isShimmering = true
        button.layer.cornerRadius = 10
        button.clipsToBounds = true

    }
    
    @IBAction private func seeResultButtonDidTap(_ sender: UIButton){
        let previousWCVC = storyboard?.instantiateViewController(withIdentifier: "PreviousWCVC") as? PreviousWCViewController
        self.navigationController?.pushViewController(previousWCVC!, animated: true)
    }
    
    
 

}


