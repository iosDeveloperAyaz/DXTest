//
//  ViewController.swift
//  testapp
//
//  Created by Ayaz Khaskheli on 2/3/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var background: UIImageView!
    @IBOutlet var midBtnView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var tab_bar: UIView!{
        didSet{
            tab_bar.layer.shadowOffset = CGSize(width: 0, height: 0)
            tab_bar.layer.shadowRadius = 2
            tab_bar.layer.shadowColor = UIColor.black.cgColor
            tab_bar.layer.shadowOpacity = 0.3
            tab_bar.layer.cornerRadius = 5
        }
    }
    @IBOutlet var buttons: [UIButton]!
    let cellReuseIdentifier = "cell"
    let titles = ["ORDERS","HOW IT WORKS", "ABOUT US", "CONTACT US"]
    let images = ["list", "workflow", "chat", "support"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UINib.init(nibName: "homeTableViewCell", bundle: nil), forCellReuseIdentifier: cellReuseIdentifier)
    }

    @IBAction func didTapContacts(_ sender: UIButton) {
        DispatchQueue.main.async {
            for button in self.buttons {
                if button != sender{
                    button.isSelected = false
                }
            }
        }
            
        if !sender.isSelected {
            sender.isSelected = true
            let image = UIImage(named: "btn-selected-myaccount")
            sender.setImage(image, for: .selected)
        }else {
            sender.isSelected = false
            let image = UIImage(named: "btn-myaccount")
            sender.setImage(image, for: .normal)

        }
        
    }
    @IBAction func didTapNotification(_ sender: UIButton) {
        DispatchQueue.main.async {
            for button in self.buttons {
                if button != sender{
                    button.isSelected = false
                }
            }
        }
            
        if !sender.isSelected {
            sender.isSelected = true
            let image = UIImage(named: "btn-selected-notification")
            sender.setImage(image, for: .selected)
            
            
        }else {
            sender.isSelected = false
            let image = UIImage(named: "btn-notification")
            sender.setImage(image, for: .normal)

        }
    }
    @IBAction func didTapOrder(_ sender: UIButton) {
        
        DispatchQueue.main.async {
            for button in self.buttons {
                if button != sender{
                    button.isSelected = false
                }
            }
        }
        
        if !sender.isSelected {
            sender.isSelected = true
            let image = UIImage(named: "btn-selected-orders-list")
            sender.setImage(image, for: .selected)
            
        }else {
            sender.isSelected = false
            let image = UIImage(named: "btn-orders-list")
            sender.setImage(image, for: .normal)

        }
    }
    @IBAction func didTapNewOrder(_ sender: UIButton) {

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        background.round(with: .bottom, radius: background.frame.width/8)
        midBtnView.round(with: .both, radius: midBtnView.frame.width/2)
    }

    @IBAction func didTapHome(_ sender: UIButton) {
        
        DispatchQueue.main.async {
            for button in self.buttons {
                if button != sender{
                    button.isSelected = false
                }
            }
        }
       
        
        if !sender.isSelected {
            sender.isSelected = true
            let image = UIImage(named: "btn-selected-home")
            sender.setImage(image, for: .selected)
            
            
        }else {
            sender.isSelected = false
            let image = UIImage(named: "btn-home")
            sender.setImage(image, for: .normal)

        }
    }

}


extension ViewController : UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 4
    }

    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell  = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! HomeTableViewCell
        cell.contentView.backgroundColor = .clear
        cell.backgroundColor = .clear
        cell.lblTitle.text = self.titles[indexPath.row]
        cell.icon.image = UIImage(named: self.images[indexPath.row])
        
        if indexPath.row % 2 == 0 {
            cell.mainView.backgroundColor = .systemTeal
            cell.arrowImage.tintColor = UIColor(red: 7/255, green: 54/255, blue: 94/255, alpha: 1)

        }else {
            cell.mainView.backgroundColor = cell.lblArrow.backgroundColor
            cell.lblArrow.backgroundColor = .systemTeal
            cell.arrowImage.tintColor = .systemTeal
        }
        
        
        return cell
    }

    private func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath)
    {
        print("You tapped cell number \(indexPath.row).")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
}



enum RoundType {
    case top
    case none
    case bottom
    case both
}

extension UIView {

    func round(with type: RoundType, radius: CGFloat = 3.0) {
        var corners: UIRectCorner

        switch type {
        case .top:
            corners = [.topLeft, .topRight]
        case .none:
            corners = []
        case .bottom:
            corners = [.bottomLeft, .bottomRight]
        case .both:
            corners = [.allCorners]
        }

        DispatchQueue.main.async {
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            self.layer.mask = mask
        }
    }

}
