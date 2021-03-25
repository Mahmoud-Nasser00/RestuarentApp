//
//  ViewController.swift
//  RestuarentApp
//
//  Created by Mahmoud Nasser on 23/03/2021.
//

import UIKit
import PinterestSegment

class HomeViewController: UIViewController {

    //MARK:- IBOutlets
    @IBOutlet weak var searchTF:UITextField!{
        didSet {
            searchTF.delegate = self
        }
    }
    @IBOutlet weak var pintrestSegment : PinterestSegment!
    @IBOutlet weak var homeTV:UITableView!{
        didSet{
            homeTV.delegate = self
            homeTV.dataSource = self
        }
    }
    
    //TabBar
    @IBOutlet weak var tabBarView:UIView!{
        didSet{
            tabBarView.addingShadowAndCornerRadius()
        }
    }
    @IBOutlet weak var homeBtn:UIButton!{
        didSet {
            homeBtn.setImage(UIImage(systemName: "house.fill"), for: .selected)
            homeBtn.setImage(UIImage(systemName: "house"), for: .normal)
        }
    }
    @IBOutlet weak var favBtn:UIButton!{
        didSet {
            favBtn.setImage(UIImage(systemName: "heart.fill"), for: .selected)
            favBtn.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
    @IBOutlet weak var profileBtn:UIButton!{
        didSet {
            profileBtn.setImage(UIImage(systemName: "person.fill"), for: .selected)
            profileBtn.setImage(UIImage(systemName: "person"), for: .normal)
        }
    }
    
    //MARK:- Variables
    var  style = PinterestSegmentStyle()
    
    //MARK:- App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(mainViewTapped))
//        self.view.addGestureRecognizer(tapGesture)
        
        homeTV.separatorColor = .clear
        
        searchTF.leftViewMode = .always
        let usernameImageView = UIImageView()
        usernameImageView.frame = CGRect(x: 10, y: 0, width: 10, height: 10)
        
        usernameImageView.image = UIImage(named: "search")
        usernameImageView.tintColor = .gray
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateTabBarBtnSelectionState(homeBtn)
        updateTabBarBtnTintColor(homeBtn)
    }
    
    //MARK:- UIFunctions
    private func updateTabBarBtnSelectionState(_ tappedButton: UIButton){
        switch tappedButton {
        case homeBtn :
            homeBtn.isSelected = true
            favBtn.isSelected = false
            profileBtn.isSelected = false
        case favBtn :
            favBtn.isSelected = true
            homeBtn.isSelected = false
            profileBtn.isSelected = false
        case profileBtn :
            profileBtn.isSelected = true
            favBtn.isSelected = false
            homeBtn.isSelected = false
        default : break
        }
    }
    
    private func updateTabBarBtnTintColor(_ selectedButton: UIButton){
        switch selectedButton {
        case homeBtn :
            homeBtn.tintColor = .orange
            favBtn.tintColor = .gray
            profileBtn.tintColor = .gray
        case favBtn :
            homeBtn.tintColor = .gray
            favBtn.tintColor = .orange
            profileBtn.tintColor = .gray
        case profileBtn :
            homeBtn.tintColor = .gray
            favBtn.tintColor = .gray
            profileBtn.tintColor = .orange
        default : break
        }
    }
    
    //Not used
    private func updateTabBarBtnUserInteractionEnabled(_ selectedButton: UIButton){
        switch selectedButton {
        case homeBtn :
            homeBtn.isUserInteractionEnabled = false
            favBtn.isUserInteractionEnabled = true
            profileBtn.isUserInteractionEnabled = true
        case favBtn :
            homeBtn.isUserInteractionEnabled = true
            favBtn.isUserInteractionEnabled = false
            profileBtn.isUserInteractionEnabled = true
        case profileBtn :
            homeBtn.isUserInteractionEnabled = true
            favBtn.isUserInteractionEnabled = true
            profileBtn.isUserInteractionEnabled = false
        default : break
        }
    }
    
    //MARK:- Navigation Functions
    private func navigationForTappedButton(_ tappedButton:UIButton) {
        if !tappedButton.isSelected {
            switch tappedButton {
            case homeBtn:
                navigationController?.popToRootViewController(animated: true)
            case favBtn:
                if let favVC = storyboard?.instantiateViewController(withIdentifier: Constants.StoryboardId.favouriteVC) as? FavouriteViewController {
                    navigationController?.pushViewController(favVC, animated: true)
                }
                
            case profileBtn:break
            default:break
            }
        }
    }
    
    //MARK:- IBActions
    
    @IBAction func cartBtnTapped(_ sender: UIButton) {
        if let cartVC = storyboard?.instantiateViewController(withIdentifier: Constants.StoryboardId.CartVC) as? CartViewController {
            navigationController?.pushViewController(cartVC, animated: true)
        }
    }
    
    @IBAction func homeBtnTapped(_ sender: UIButton) {
        navigationForTappedButton(sender)
        updateTabBarBtnSelectionState(homeBtn)
        if sender.isSelected {
            updateTabBarBtnTintColor(sender)
        }
    }
    
    @IBAction func favBtnTapped(_ sender: UIButton) {
        navigationForTappedButton(sender)
        updateTabBarBtnSelectionState(favBtn)
        if sender.isSelected {
            updateTabBarBtnTintColor(sender)
        }
    }
    
    @IBAction func profileBtnTapped(_ sender: UIButton) {
        navigationForTappedButton(sender)
        updateTabBarBtnSelectionState(profileBtn)
        if sender.isSelected {
            updateTabBarBtnTintColor(sender)
        }
    }
    
    @objc func mainViewTapped(){
        searchTF.resignFirstResponder()
    }
    
}

    //MARK:- TV Extensions

extension HomeViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 260
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: Constants.StoryboardName.main, bundle: nil)
        if let detailVC = sb.instantiateViewController(identifier: Constants.StoryboardId.detailVC) as? OrderDetailViewController {
            navigationController?.pushViewController(detailVC, animated: true)
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

extension HomeViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
}