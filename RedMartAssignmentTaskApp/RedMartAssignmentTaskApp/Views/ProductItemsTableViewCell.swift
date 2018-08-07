//
//  ProductItemsTableViewCell.swift
//  RedMartAssignmentTaskApp
//
//  Created by Basavaraj on 05/08/18.
//  Copyright © 2018 Basavaraj D. All rights reserved.
//

import UIKit
import SDWebImage

class ProductItemsTableViewCell: UITableViewCell {
    @IBAction func leftGestureAction(_ sender: UISwipeGestureRecognizer) {
        print("Left")
    }
    
    @IBAction func rightGestureAction(_ sender: UISwipeGestureRecognizer) {
        print("Right")
    }
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    var items: [Images] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.collectionView.register(UINib(nibName: "ItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ItemCollectionViewCell")
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureItems(_ images: [Images])  {
        self.items.append(contentsOf: images)
        self.pageControl.numberOfPages = self.items.count
        
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}


extension ProductItemsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCollectionViewCell", for: indexPath as IndexPath) as! ItemCollectionViewCell
        cell.backgroundColor = UIColor.clear
        let model = self.items[indexPath.row]
        if let imgPath = model.name {
            let imageURL = URL(string: Constants.ImageBaseURL.rawValue + imgPath)
            cell.productItemImageView.sd_setShowActivityIndicatorView(true)
            cell.productItemImageView.sd_setIndicatorStyle(.gray)
            cell.productItemImageView.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "placeholder.png"))
        }
        
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let cellwidth = collectionView.frame.size.width
        let cellheight = collectionView.frame.size.height
        return CGSize(width: cellwidth, height: cellheight)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
      
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let pageWidth = self.collectionView.frame.size.width
        let targetXContentOffset = Float(targetContentOffset.pointee.x)
        let contentWidth = Float(self.collectionView!.contentSize.width  )
        var newPage = Float(self.pageControl.currentPage)
        
        if velocity.x == 0 {
            newPage = floor( (targetXContentOffset - Float(pageWidth) / 2) / Float(pageWidth)) + 1.0
        } else {
            newPage = Float(velocity.x > 0 ? self.pageControl.currentPage + 1 : self.pageControl.currentPage - 1)
            if newPage < 0 {
                newPage = 0
            }
            if (newPage > contentWidth / Float(pageWidth)) {
                newPage = ceil(contentWidth / Float(pageWidth)) - 1.0
            }
        }
        
        self.pageControl.currentPage = Int(newPage)
        let point = CGPoint (x: CGFloat(newPage * Float(pageWidth)), y: targetContentOffset.pointee.y)
        targetContentOffset.pointee = point
    }
}
