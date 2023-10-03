//
//  ProductListVC.swift
//  MVVMPattern
//
//  Created by Shouaib Ahmed on 26/09/23.
//

import UIKit

class ProductListVC: UIViewController {

    @IBOutlet weak var productTbleView: UITableView!
    
    private var viewModel = ProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configuration()
    }

}

extension ProductListVC{
    
    func configuration(){
        productTbleView.register(UINib(nibName: "ProductListCell", bundle: nil), forCellReuseIdentifier: "ProductListCell")
        initViewModel()
        observeEvent()
    }
    
    func initViewModel(){
        viewModel.fetchProducts()
    }
    
    func observeEvent(){
        viewModel.eventHandler = { [weak self] event in
            
            guard let self else{
                return
            }
            
            switch event{
            case .loading: break
            case .stopLoading: break
            case .dataLoaded: 
                print(self.viewModel.products)
                DispatchQueue.main.async {
                    self.productTbleView.reloadData()
                }
            case .error(let error):
                print(error)
            }
        }
    }
}

extension ProductListVC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductListCell") as? ProductListCell else{
            return UITableViewCell()
        }
        let product = viewModel.products[indexPath.row]
        cell.product = product
        return cell
    }
}
