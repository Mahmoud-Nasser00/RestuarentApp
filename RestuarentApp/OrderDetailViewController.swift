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
    
    //MARK:- App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        }
    }
    
    @IBAction func plusBtnTapped(_ sender:UIButton){
        let qty = Int(orderQuantity.text!)!
        orderQuantity.text = String(qty + 1)
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

