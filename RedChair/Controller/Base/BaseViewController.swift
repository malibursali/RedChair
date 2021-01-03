//
//  BaseViewController.swift
//  RedChair
//
//  Created by Muhammed Ali BURSALI on 1.01.2021.
//  Copyright © 2021 Muhammed Ali BURSALI. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    // MARK: - Properties
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupComponents()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setupNavigationBar()
    }
    
    
    // MARK: - Setup
    
    func setupComponents() {
        
    }
    
    func setupNavigationBar() {
        self.setNavigationBarColor(withColor: ColorHelper.theme.color)
        self.setNavigationBarTintColor(withColor: .white)
    }
    
    
    // MARK: - Actions
    
    
    // MARK: - Methods
    
    func hideNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
//        self.navigationController?.navigationBar.isHidden = true
    }
    
    func showNavigationBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
//        self.navigationController?.navigationBar.isHidden = false
    }
    
    func setNavigationBarColor(withColor color: UIColor?) {
        self.navigationController?.navigationBar.barTintColor = color
    }
    
    func setNavigationBarTintColor(withColor color: UIColor?) {
        self.navigationController?.navigationBar.tintColor = color
        
        let textAttributes: [NSAttributedString.Key : Any] = [NSAttributedString.Key.foregroundColor: color!]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    func hideBackButton() {
        self.navigationItem.hidesBackButton = true
    }
    
    func setTitle(_ title: String) {
        self.navigationItem.title = title
    }
    
    func showViewController(storyboard name: String) {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        guard let viewController = storyboard.instantiateInitialViewController() else {
            return
        }
        
        self.navigationController?.show(viewController, sender: nil)
    }
    
    func getViewController(storyboard name: String) -> UIViewController? {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        guard let viewController = storyboard.instantiateInitialViewController() else {
            return nil
        }
        
        return viewController
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alertController.addAction(okButton)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showLoadingView() {
        let loadingView = LoadingView(frame: self.view.frame)
        loadingView.tag = 100
        loadingView.startAnimation()
        self.navigationController?.view.addSubview(loadingView)
    }
    
    func hideLoadingView() {
        guard let loadingView = self.navigationController?.view.viewWithTag(100) as? LoadingView else { return }
        loadingView.removeFromSuperview()
        loadingView.stopAnimation()
    }
}
