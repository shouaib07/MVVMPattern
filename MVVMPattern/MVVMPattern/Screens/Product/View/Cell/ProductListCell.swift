//
//  ProductListCell.swift
//  MVVMPattern
//
//  Created by Shouaib Ahmed on 27/09/23.
//

import UIKit

class ProductListCell: UITableViewCell {

    
    @IBOutlet weak var productBackgroundView: UIView!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    @IBOutlet weak var rateBtn: UIButton!
    @IBOutlet weak var productCategoryLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    
    var product:ProductModel? {
        
        didSet { // Property Observer
            productDetailConfiguragtion()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        productBackgroundView.clipsToBounds = false
        productBackgroundView.layer.cornerRadius = 15
        productBackgroundView.backgroundColor = .systemGray6
        productImage.layer.cornerRadius = 10
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func productDetailConfiguragtion(){
        guard let product else{
            return
        }
        titleLbl.text = product.title
        productCategoryLbl.text = product.category
        descriptionLbl.text = product.description
        priceLbl.text = "$\(product.price ?? 0.0)"
        rateBtn.setTitle("\(product.rating?.rate ?? 0.0)", for: .normal)
        productImage.setImage(with: product.image ?? "")
    }
    
}
