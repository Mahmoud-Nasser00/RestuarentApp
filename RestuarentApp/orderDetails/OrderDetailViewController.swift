//
//  OrderDetailViewController.swift
//  RestuarentApp
//
//  Created by Mahmoud Nasser on 23/03/2021.
//

import UIKit
import PinterestSegment

class OrderDetailViewController: UIViewController {
    
    //MARK:- IBoutlets
    @IBOutlet weak var segmentControl:PinterestSegment!
    @IBOutlet weak var sizesCV:UICollectionView!
    @IBOutlet weak var orderView:UIView!
    @IBOutlet weak var orderDetailSV:UIStackView!
    @IBOutlet weak var itemName:UILabel!
    @IBOutlet weak var categoryName:UILabel!
    @IBOutlet weak var orderQuantity:UILabel!
    @IBOutlet weak var orderQuantityDetailSV:UIStackView!{
        didSet {
            orderQuantityDetailSV.isHidden = true
        }
    }
    @IBOutlet weak var quantityLabel:UILabel!{
        didSet {
            quantityLabel.isHidden = true
        }
    }
    @IBOutlet weak var minusBtn:UIButton!{
        didSet {
            minusBtn.layer.borderWidth = 1
            minusBtn.layer.borderColor = UIColor.black.cgColor
            minusBtn.layer.cornerRadius = minusBtn.frame.width / 2
            minusBtn.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var plusBtn:UIButton!{
        didSet {
            plusBtn.layer.borderWidth = 1
            plusBtn.layer.borderColor = UIColor.black.cgColor
            plusBtn.layer.cornerRadius = minusBtn.frame.width / 2
            plusBtn.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var orderNowBtn : UIButton!
    
    //MARK:- Variables
    private var  style = PinterestSegmentStyle()
    var orderedItem :Item!
    var count:Int!
    
    private lazy var viewModel = OrderDetailViewModel(item: orderedItem)
    
    //MARK:- App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sizesCV.register(OrderDetailCVCell.nib(), forCellWithReuseIdentifier: Constants.CellId.cell)
        
        sizesCV.delegate = self
        sizesCV.dataSource = self
        sizesCV.backgroundColor = .clear
        
        
        setSegmentControl()
        
        populateData(item: orderedItem)
    }

    //MARK:- UIFunctions
    private func setSegmentControl(){
        segmentControl.titles = ["Active Orders", "fast Orders"]
        style.indicatorColor = #colorLiteral(red: 1, green: 0.5937251379, blue: 0.107067319, alpha: 0.1801954863)
        style.titleMargin = 20
        style.titlePendingHorizontal = 20
        style.titlePendingVertical = 20
        style.titleFont = UIFont.boldSystemFont(ofSize: 14)
        style.normalTitleColor = UIColor.black
        style.selectedTitleColor = UIColor.black
        
        segmentControl.style = style
    }
    
    //MARK:- Functions
    
    private func populateData(item:Item){
        itemName.text = viewModel.orderedItem.itemName
        categoryName.text = viewModel.orderedItem.itemCategory
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
    
    @IBAction func minusBtnTapped(_ sender:UIButton){
        let qty = Int(orderQuantity.text!)!
        if qty > 0 {
            orderQuantity.text = String(qty - 1)
            count = Int(orderQuantity.text!)!
        }
        viewModel.changeItemCount(count: count)
    }
    
    @IBAction func plusBtnTapped(_ sender:UIButton){
        let qty = Int(orderQuantity.text!)!
        orderQuantity.text = String(qty + 1)
        count = Int(orderQuantity.text!)!
        viewModel.changeItemCount(count: count)
    }
    
    @IBAction func addOrderBtnTapped(_ sender:UIButton){
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            UIView.transition(with: orderView, duration: 1, options: .transitionFlipFromTop) {
                sender.setTitle("Add to cart", for: .selected)
                self.quantityLabel.isHidden = false
                self.orderQuantityDetailSV.isHidden = false
            }
        } else {
            if let cartVC = storyboard?.instantiateViewController(withIdentifier: Constants.StoryboardId.CartVC) as? CartViewController {
                orderedItem.count = count
                cartVC.cartItems = [viewModel.orderedItem]
                navigationController?.pushViewController(cartVC, animated: true)
            }
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

 // MARK:- Extensions
extension OrderDetailViewController : UICollectionViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let midX:CGFloat = scrollView.bounds.midX
        let midY:CGFloat = scrollView.bounds.midY
        let point:CGPoint = CGPoint(x:midX, y:midY)
        
        guard let indexPath:IndexPath = sizesCV.indexPathForItem(at: point)
        else {
            return
        }
        
        let currentPage:Int = indexPath.item
        switch currentPage {
        case 0:
            viewModel.changeItemSize(size: .large)
        case 1:
            viewModel.changeItemSize(size: .large)
        case 2:
            viewModel.changeItemSize(size: .large)
        default:break
        }
    }
    
}

extension OrderDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CellId.cell, for: indexPath) as? OrderDetailCVCell {
            cell.configureCell(with: viewModel.orderedItem)
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}

extension OrderDetailViewController :UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.size
        return CGSize(width: size.width, height: size.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
