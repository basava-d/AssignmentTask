//
//  ProductsViewController.swift
//  RedMartAssignmentTaskApp
//
//  Created by Basavaraj D on 03/08/2018.
//  Copyright © 2018 Basavaraj D. All rights reserved.
//

import UIKit

class ProductsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var productID : String = ""
    var model : ProductDetailsModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.tableView.register(UINib(nibName: "ProductNameTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductNameTableViewCell")
        self.tableView.register(UINib(nibName: "ProductItemsTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductItemsTableViewCell")
        self.tableView.register(UINib(nibName: "ProductActionItemsTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductActionItemsTableViewCell")
        self.tableView.register(UINib(nibName: "PriceItemTableViewCell", bundle: nil), forCellReuseIdentifier: "PriceItemTableViewCell")
        self.tableView.register(UINib(nibName: "AboutProductItemTableViewCell", bundle: nil), forCellReuseIdentifier: "AboutProductItemTableViewCell")
        self.tableView.register(UINib(nibName: "KeyInfoItemTableViewCell", bundle: nil), forCellReuseIdentifier: "KeyInfoItemTableViewCell")
        
        self.tableView.tableFooterView = UIView(frame:CGRect.zero)
        
        self.tableView.estimatedRowHeight=120
        self.tableView.rowHeight = UITableViewAutomaticDimension
        DispatchQueue.global(qos: .background).async {
            self.getProductsList(0)
        }
        self.navigationItem.setHidesBackButton(true, animated:true);
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
        
    }
    
    @IBAction func backAction(_ sender: UIButton) {
//        self.navigationController?.popViewController(animated: true)
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionFade
        self.navigationController?.view.layer.add(transition, forKey: nil)
        _ = self.navigationController?.popViewController(animated: false)
    }
    
    @IBAction func shareAction(_ sender: UIButton) {
        
        print("Share")
    }
    
    
    func getProductsList(_ page: Int)  {
        let activityIndicatorView = CustomActivityIndicatorView.sharedInstance
        activityIndicatorView.showActivityIndicatorView(self)
        
        APIManagerClass.sharedInstance.getProductsDetails(productId: productID, success: { (result, statusCode) in
            
            DispatchQueue.main.async {
                self.model = result
                activityIndicatorView.removeActivityIndicatorView(self)
                self.tableView.reloadData()
            }
            
            print(result)
        }) { (errorMessage, statusCode) in
            
            DispatchQueue.main.async {
                activityIndicatorView.removeActivityIndicatorView(self)
                CustomAlertView.sharedInstance.displayAlert(target: self, title: Constants.ErrorMessage.rawValue, errorMessage: errorMessage!, completionHandler: { (state) in
                })
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension ProductsViewController: UITableViewDelegate, UITableViewDataSource{
    // MARK: - TableView Delegate methods
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductItemsTableViewCell") as? ProductItemsTableViewCell
            if let images = self.model?.product?.images{
                cell?.configureItems(images)
            }
            return cell!
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductNameTableViewCell") as? ProductNameTableViewCell
            if let title = self.model?.product?.title{
                cell?.nameLabel.text = title
            }
            if let weight = self.model?.product?.warehouse?.measure?.wt, let wtMet = self.model?.product?.warehouse?.measure?.wtMetric{
                cell?.weightLabel.text = "\(weight)" + " " + "\(wtMet)"
            }
            return cell!
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PriceItemTableViewCell") as? PriceItemTableViewCell
            if let price = self.model?.product?.pricing?.price{
                cell?.priceLabel.text = "$" + " " + "\(price)"
            }
            return cell!
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductActionItemsTableViewCell") as? ProductActionItemsTableViewCell
            cell?.addToCartButton.addTarget(self, action: #selector(self.addToCartAction), for: .touchUpInside)
            cell?.saveToListButton.addTarget(self, action: #selector(self.saveToListAction), for: .touchUpInside)

            return cell!
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "KeyInfoItemTableViewCell") as? KeyInfoItemTableViewCell
            cell?.mainTItileLabel.text = "Key Information"
            if let name = self.model?.product?.title{
                cell?.subTitileLabel.text = name
            }
            
            cell?.arrowButton.addTarget(self, action: #selector(self.arrowClicked), for: .touchUpInside)
            return cell!
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AboutProductItemTableViewCell") as? AboutProductItemTableViewCell
            
            cell?.mainTitleLabel.text = "About the Prodcut"
            if let desc = self.model?.product?.desc{
                cell?.subTItileLabel.text = desc
            }
            return cell!
        default:
            let cell = UITableViewCell()
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        
        switch indexPath.row {
        case 0:
            return 200
        case 1:
            return UITableViewAutomaticDimension
        case 2:
            return 60
        case 3:
            return 140
        case 4:
            return UITableViewAutomaticDimension
        case 5:
            return UITableViewAutomaticDimension
        default:
            break
        }
        
        return 100
    }
    
    
    @objc func arrowClicked()
    {
        print("Arrow")
    }
    
    
    @objc func addToCartAction()
    {
        print("addToCartAction")
    }
    
    @objc func saveToListAction()
    {
        print("saveToListAction")
    }
    
    
}
