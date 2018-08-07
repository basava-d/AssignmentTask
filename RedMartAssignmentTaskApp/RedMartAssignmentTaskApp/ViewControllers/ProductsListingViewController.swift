//
//  ProductsListingViewController.swift
//  RedMartAssignmentTaskApp
//
//  Created by Basavaraj D on 03/08/2018.
//  Copyright © 2018 Basavaraj D. All rights reserved.
//

import UIKit
import SDWebImage

class ProductsListingViewController: UIViewController{
    
    @IBOutlet weak var productsCollectionView: UICollectionView!
    
    var model: ProductsListModel?
    var previousCategories : [Categories] = []
    var products: [Products] = []
    
    var isProductsSelected: Bool = false
    var isNewDataLoading: Bool = false
    var nextPage: Int = 0
    var selectedProductID: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.productsCollectionView.delegate = self
        self.productsCollectionView.dataSource = self
        
        self.productsCollectionView.register(UINib(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductCollectionViewCell")
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let cellwidth = self.productsCollectionView.frame.size.width
        layout.itemSize = CGSize(width: cellwidth/3+4, height: 120)
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        self.productsCollectionView!.collectionViewLayout = layout
        
        self.title = "New"
        
        DispatchQueue.global(qos: .background).async {
            self.getProductsList(0)
        }
        
    }
    
    
    //MARK: - Custom button actions
    func addBackButton()  {
        let backbutton = UIButton(type: .custom)
        backbutton.setTitle("Back", for: .normal)
        backbutton.setTitleColor(UIColor.white, for: .normal)
        backbutton.addTarget(self, action: #selector(self.backAction), for: .touchUpInside)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backbutton)
    }
    
    @objc func backAction(){
        self.isProductsSelected = false
        self.navigationItem.leftBarButtonItem = nil
        DispatchQueue.main.async {
            UIView.animate(withDuration: 2, animations: {
                self.productsCollectionView.reloadData()

            }, completion: nil)
        }
    }
    
    //MARK: - API Calls
    
    func getProductsList(_ page: Int)  {
        
        let urlEndPoint = "&pageSize=30&page=" + "\(page)"
        let activityIndicatorView = CustomActivityIndicatorView.sharedInstance
        activityIndicatorView.showActivityIndicatorView(self)
        
        APIManagerClass.sharedInstance.getProductsList(urlEndPoint: urlEndPoint, success:  { (result, statusCode) in
            self.model = result
            if let facets = result.facets{
                if let categories = facets.categories{
                    if(categories.count != 0){
                        self.model?.facets?.categories?.removeAll()
                        self.previousCategories.append(contentsOf: categories)
                        self.model?.facets?.categories?.append(contentsOf: self.previousCategories)
                        self.nextPage = self.nextPage + 1
                        self.isNewDataLoading = false
                    }else{
                        self.isNewDataLoading = true
                        self.model?.facets?.categories?.removeAll()
                        self.model?.facets?.categories?.append(contentsOf: self.previousCategories)
                        
                    }
                }
            }
            
            DispatchQueue.main.async {
                activityIndicatorView.removeActivityIndicatorView(self)
                self.productsCollectionView.reloadData()
            }
            
            print(result)
        }) { (errorMessage, statusCode) in
            print("Error message:",errorMessage ?? "",statusCode ?? "")
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
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "segue_productsList_productDetails") {
            let destinationVC = segue.destination as! ProductsViewController
            destinationVC.productID = self.selectedProductID
            
        }
    }
    
    
}


extension ProductsListingViewController: UICollectionViewDataSource,UICollectionViewDelegate ,UICollectionViewDelegateFlowLayout{
    
    //MARK: - Collection View Delegate methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.isProductsSelected {
            return self.products.count
        }
        
        if let count = (self.model?.facets?.categories?.count){
            return count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath as IndexPath) as! ProductCollectionViewCell
        cell.backgroundColor = UIColor.clear
        
        if self.isProductsSelected {
            let model: Products = (self.products[indexPath.row])
            if let name = model.title{
                cell.productNameLabel.text = name;
            }
            
            if let imagePath = model.img?.name{
                let imageURL = URL(string: Constants.ImageBaseURL.rawValue + imagePath)
                cell.productImageView.sd_setShowActivityIndicatorView(true)
                cell.productImageView.sd_setIndicatorStyle(.gray)
                cell.productImageView.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "placeholder.png"))
            }
        }else{
            let model: Categories = (self.model?.facets?.categories?[indexPath.row])!
            
            if let name = model.name, let count = model.count{
                let countString : String = "\(count)"
                let newStr = name + " " + countString
                let range = NSRange(location:name.count+1,length:countString.count)
                let outputString = NSMutableAttributedString(string: newStr)
                outputString.addAttribute(.foregroundColor, value: UIColor.lightGray, range:range );
                cell.productNameLabel.attributedText = outputString;
            }
            
            if let imagePath = model.image{
                let imageURL = URL(string: Constants.ImageBaseURL.rawValue + imagePath)
                cell.productImageView.sd_setShowActivityIndicatorView(true)
                cell.productImageView.sd_setIndicatorStyle(.gray)
                cell.productImageView.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "placeholder.png"))
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        self.updatePorductsList(indexPath);
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.alpha = 0
        cell.layer.transform = CATransform3DMakeScale(0.5, 0.5, 0.5)
        UIView.animate(withDuration: 0.4, animations: { () -> Void in
            cell.alpha = 1
            cell.layer.transform = CATransform3DScale(CATransform3DIdentity, 1, 1, 1)
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.5) {
            if let cell = collectionView.cellForItem(at: indexPath) as? ProductCollectionViewCell {
                cell.productImageView.transform = .init(scaleX: 0.95, y: 0.95)
                cell.contentView.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.5) {
            if let cell = collectionView.cellForItem(at: indexPath) as? ProductCollectionViewCell {
                cell.productImageView.transform = .identity
                cell.contentView.backgroundColor = .clear
            }
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        if ((scrollView.contentOffset.y + scrollView.frame.size.height) >= scrollView.contentSize.height)
        {
            if !isNewDataLoading{
                isNewDataLoading = true
                if self.nextPage != 0 {
                    self.getProductsList(self.nextPage)
                }
            }
        }
    }
    
    
    func updatePorductsList(_ indexPath: IndexPath)  {
        if(self.isProductsSelected){
            let model: Products = (self.products[indexPath.row])
            if let  prodId = model.id{
                self.selectedProductID = "\(String(describing: prodId))"
                
                let destinationVC = self.storyboard?.instantiateViewController(withIdentifier: "ProductsViewController") as! ProductsViewController
                destinationVC.productID = self.selectedProductID
                let transition = CATransition()
                transition.duration = 0.5
                transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
                transition.type = kCATransitionPush
                transition.subtype = kCATransitionFromRight
                self.navigationController!.view.layer.add(transition, forKey: nil)
                self.navigationController?.pushViewController(destinationVC, animated: false)
                
              //  self.performSegue(withIdentifier: "segue_productsList_productDetails", sender: self)
                return
            }
        }
        
        let model: Categories = (self.model?.facets?.categories?[indexPath.row])!
        if let  prodId = model.id{
            let newItems = self.model?.products?.filter({ (product) -> Bool in
                (product.categories?.contains(where: { (item) -> Bool in
                    return item == prodId
                }))!
            })
            
            if(newItems?.count != 0){
                self.products = newItems!
                self.isProductsSelected = true;
                
                DispatchQueue.main.async {
                    self.addBackButton()
                    self.productsCollectionView.reloadData()
                }
            }else{
                DispatchQueue.main.async {
                    CustomAlertView.sharedInstance.displayAlert(target: self, title: "", errorMessage: "No Products!", completionHandler: { (state) in
                    })
                }
                
            }
        }
    }
    
}


