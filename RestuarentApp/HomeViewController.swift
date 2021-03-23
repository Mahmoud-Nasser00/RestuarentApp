//
//  ViewController.swift
//  RestuarentApp
//
//  Created by Mahmoud Nasser on 23/03/2021.
//

import UIKit
import PinterestSegment

class HomeViewController: UIViewController {

    @IBOutlet weak var searchTF:UITextField!
    @IBOutlet weak var pintrestSegment : PinterestSegment!
    @IBOutlet weak var homeTV:UITableView!{
        didSet{
            homeTV.delegate = self
            homeTV.dataSource = self
        }
    }
    
    @IBOutlet weak var tabBarView:UIView!{
        didSet{
            tabBarView.addingShadowAndCornerRadius()
        }
    }
    @IBOutlet weak var homeBtn:UIButton!
    @IBOutlet weak var favBtn:UIButton!
    @IBOutlet weak var profileBtn:UIButton!
    
    var  style = PinterestSegmentStyle()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeTV.separatorColor = .clear
        
        searchTF.leftViewMode = .always
        let usernameImageView = UIImageView()
        usernameImageView.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        
        usernameImageView.image = UIImage(systemName: "")
        searchTF.leftView = usernameImageView
        
        // Do any additional setup after loading the view.
        pintrestSegment.titles = ["burger","pizza", "pasta", "salad"]
        style.indicatorColor = #colorLiteral(red: 1, green: 0.5937251379, blue: 0.107067319, alpha: 0.1801954863)
        style.titleMargin = 0
        style.titlePendingHorizontal = 20
        style.titlePendingVertical = 20
        style.titleFont = UIFont.boldSystemFont(ofSize: 14)
        style.normalTitleColor = UIColor.black
        style.selectedTitleColor = UIColor.black
        
        pintrestSegment.style = style
    }

}

extension HomeViewController : UICollectionViewDelegate {
    
}

extension HomeViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
}

extension HomeViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 260
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: Constants.StoryboardName.main, bundle: nil)
        if let detailVC = sb.instantiateViewController(identifier: Constants.StoryboardId.detailVC) as? DetailViewController {
            
        }
    }
    
}

extension HomeViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell",for: indexPath) as? HomeTableViewCell{
            return cell
        }
        return UITableViewCell()
    }
    
    
}
