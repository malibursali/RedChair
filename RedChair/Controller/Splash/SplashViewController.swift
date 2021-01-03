//
//  SplashViewController.swift
//  RedChair
//
//  Created by Muhammed Ali BURSALI on 1.01.2021.
//  Copyright © 2021 Muhammed Ali BURSALI. All rights reserved.
//

import UIKit
import Reachability

class SplashViewController: BaseViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.checkNetworkConnection()
    }
    
    
    // MARK: - Setup
    
    override func setupNavigationBar() {
        super.setupNavigationBar()
        
        self.hideNavigationBar()
    }
    
    
    // MARK: - Actions
    
    
    // MARK: - Methods
    
    func checkNetworkConnection() {
        if NetworkService.sharedInstance.isConnected() {
            FirebaseService.sharedInstance.fetchRemoteConfig { (isSucces) in
                self.fetchLabelValue()
            }
        }
        else {
            self.showConnectionError()
        }
    }
    
    func showConnectionError() {
        self.showAlert(title: "", message: "Network connection not found. Please check your network conection.")
    }
    
    func fetchLabelValue() {
        let text = FirebaseService.sharedInstance.fetchValue(withKey: "splash_label").stringValue ?? ""
        
        DispatchQueue.main.async {
            self.titleLabel.text = text
            self.showHomeView()
        }
    }
    
    func showHomeView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.showViewController(storyboard: ViewControllerHelper.home.name)
        }
    }
}
