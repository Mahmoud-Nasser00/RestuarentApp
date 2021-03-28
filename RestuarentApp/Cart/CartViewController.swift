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
    
    //MARK:- App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        itemsTV.separatorColor = .clear
        
        // Do any additional setup after loading the view.
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
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellId.cartCell) as? CartTableViewCell {
            cell.cartActionDelegate = self
            return cell
        }
        return UITableViewCell()
    }
}

    //MARK:- cartActions Delegate
extension CartViewController : CartActionsDelegate {
    func updateViews(quantity: Int, index: Int) {
        
    }
    
    
}
