//
//  CartViewController.swift
//  RestuarentApp
//
//  Created by Mahmoud Nasser on 25/03/2021.
//

import UIKit

class CartViewController: UIViewController {

    //MARK:- IBOulets
    @IBOutlet weak var orderAmountLabel: UILabel!
    @IBOutlet weak var shippingFeesLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    
    @IBOutlet weak var itemsTV:UITableView!{
        didSet {
            itemsTV.delegate = self
            itemsTV.dataSource = self
        }
    }
    @IBOutlet weak var checkOutBtn: UIButton!{
        didSet {
            checkOutBtn.layer.cornerRadius = 30
            checkOutBtn.layer.masksToBounds = true
        }
    }
    
    
    //MARK:- variables
    var cartItems = [OrderDetailItem]()
    
    private var totalPriceForAllItems :Float = 0.0 {
        didSet {
            orderAmountLabel.text = String(totalPriceForAllItems)
        }
    }
    private var shippingAmount:Float = 10.0
    private var totalPriceWithShipping:Float = 0.0 {
        didSet{
            totalAmountLabel.text = String(totalPriceWithShipping)
        }
    }

    
    //MARK:- App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        itemsTV.separatorColor = .clear
        getTotalPriceForAllItems(items: cartItems)
        
        orderAmountLabel.text = String(totalPriceForAllItems)
        totalAmountLabel.text = String(totalPriceForAllItems + shippingAmount)
    }
    
    //MARK:- Helper Functions
    
    private func getTotalPriceForAllItems(items:[OrderDetailItem]){
        var totalPrice:Float = 0.0
        for item in items {
            totalPrice += item.totalPrice
        }
        totalPriceForAllItems = totalPrice
    }
    
    private func resetCart(){
        orderAmountLabel.text = "0.00"
        shippingFeesLabel.text = "0.00"
        totalAmountLabel.text = "0.00"
    }
    
    //MARK:- IBActions
    @IBAction func backBtnTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
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
extension CartViewController : UITableViewDelegate {
    
}

    //MARK:- TV DataSource Ext
extension CartViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellId.cartCell) as? CartTableViewCell {
            let itemForRow = cartItems[indexPath.row]
            cell.cartActionDelegate = self
            cell.configureCell(item: itemForRow)
            return cell
        }
        return UITableViewCell()
    }
}

    //MARK:- cartActions Delegate
extension CartViewController : CartActionsDelegate {
    func deleteItem(item: OrderDetailItem) {
        cartItems.remove(object: item)
        resetCart()
        itemsTV.reloadData()
    }
    
    func updateItemsPrice(qty: Int, price: Float) {
        totalPriceForAllItems = Float(qty) * price
        totalPriceWithShipping = totalPriceForAllItems + shippingAmount
    }
    
    
}
