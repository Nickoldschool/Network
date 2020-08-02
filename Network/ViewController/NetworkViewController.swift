//
//  NetworkViewController.swift
//  Network
//
//  Created by Nick Chekmazov on 02.08.2020.
//  Copyright © 2020 Nick Chekmazov. All rights reserved.
//

import UIKit

class NetworkViewController: UIViewController {
    var networkManager: NetworkManager!
    
    init(networkManager: NetworkManager) {
        super.init(nibName: nil, bundle: nil)
        self.networkManager = networkManager
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        networkManager.getCurrencies(rate: "EUR") { (currencies, error) in
            
        }
        
        
    }
    
}
