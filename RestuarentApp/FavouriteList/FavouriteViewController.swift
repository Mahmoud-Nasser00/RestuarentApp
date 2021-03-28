//
//  FavouriteViewController.swift
//  RestuarentApp
//
//  Created by Mahmoud Nasser on 25/03/2021.
//

import UIKit

protocol favouriteVCDelegate {
    func heartBtnTapped(items:[Item])
}

class FavouriteViewController: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var favItemsTV:UITableView!
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
    
    var favouriteItems = [Item]()
    
    private let dataAccess = DataAccess()
    private lazy var viewModel = HomeViewModel(dataAccess: dataAccess)
    
    var favVCDelegate : favouriteVCDelegate?
    
    //MARK:- App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        favItemsTV.separatorColor = .clear
        favItemsTV.delegate = self
        favItemsTV.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateTabBarBtnSelectionState(favBtn)
        updateTabBarBtnTintColor(favBtn)
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

    //MARK:- Navigation Functions
    private func navigationForTappedButton(_ tappedButton:UIButton) {
        if !tappedButton.isSelected {
            switch tappedButton {
            case homeBtn:
                navigationController?.popToRootViewController(animated: true)
            case favBtn:
                break
            case profileBtn:break
            default:break
            }
        }
    }
    //MARK:- IBActions
    @IBAction func backBtnTapped(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

    //MARK:- TV Delegate Ext
extension FavouriteViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive,
                                              title: "Delete") { [weak self](action, view, completionHandler) in
            print("swiped")
            guard let self = self else {return}
            var item = self.favouriteItems[indexPath.row]
            self.viewModel.favouriteItems = self.favouriteItems
            self.viewModel.addDeleteFavouriteItem(item: &item)
            self.favouriteItems = self.viewModel.favouriteItems
            self.favVCDelegate?.heartBtnTapped(items: self.favouriteItems)
            self.favItemsTV.reloadData()
            
            completionHandler(true)
        }
        deleteAction.backgroundColor = .red
        deleteAction.image = UIImage(systemName: "trash.fill")
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
}
//MARK:- TV DataSource Ext
extension FavouriteViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favouriteItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellId.favouriteCell, for: indexPath) as? FavouriteTableViewCell {
            let itemForRow = favouriteItems[indexPath.row]
            cell.favCellDelegate = self
            cell.heartBtn.tag = indexPath.row
            cell.configureCell(item: itemForRow)
            return cell
        }
        
        return UITableViewCell()
    }
    
}

extension FavouriteViewController : FavouriteCellDelegate {
    func heartBtnTapped(index: Int) {
        var item = favouriteItems[index]
        viewModel.favouriteItems = favouriteItems
        viewModel.addDeleteFavouriteItem(item: &item)
        favouriteItems = viewModel.favouriteItems
        favVCDelegate?.heartBtnTapped(items: favouriteItems)
        favItemsTV.reloadData()
    }
}
