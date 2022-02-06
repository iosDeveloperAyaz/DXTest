//
//  homeTableViewCell.swift
//  testapp
//
//  Created by Ayaz Khaskheli on 2/4/22.
//

import Foundation
import UIKit



class HomeTableViewCell: UITableViewCell
{
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var lblArrow: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var arrowImage: UIImageView!
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
       super.awakeFromNib()
       //custom logic goes here
        setupViews()
    }
    
    func setupViews(){
        
        mainView.layer.shadowOffset = CGSize(width: 0, height: 0)
        mainView.layer.shadowRadius = 2
        mainView.layer.shadowColor = UIColor.black.cgColor
        mainView.layer.shadowOpacity = 0.3
        mainView.round(with: .both, radius: 10)
        lblArrow.round(with: .both, radius: lblArrow.frame.width/2)
        
    }
}


