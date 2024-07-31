//
//  PropetiesTableViewController.swift
//  MVVMSample
//
//  Created by Hesham on 6/20/18.
//  Copyright © 2018 Hesham. All rights reserved.
//

import UIKit

class PropetiesTableViewController: UITableViewController {
    
    //MARK: - Properties
    var viewModel = PropertiesListViewModel()
    var propertyViewModels = [PropertyViewModel]()
    let cellIdentifier = "PropertyCell"
    let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
    
    //MARK: - Controller lifecycle and functions
    override func viewDidLoad() {
        super.viewDidLoad()
        loadProperties()
        setupTableView()
        setActivityIndicator()
    }
    
    func loadProperties() {
        viewModel.delegate = self
        viewModel.getProperties()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "PropertyTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        tableView.tableFooterView = UIView()
    }
    
    func setActivityIndicator() {
        activityIndicator.center = view.center
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    func showAlert(with message: String)  {
        let alert = UIAlertController(title: "Message", message: message, preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Dismiss", style: .default) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(dismissAction)
        self.present(alert, animated: true)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return propertyViewModels.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! PropertyTableViewCell
        let property = propertyViewModels[indexPath.row]
        cell.setupCell(WithProperty: property)
        return cell
    }
    
    //MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 136
    }
 
}

//MARK: - View model delegate functions
extension PropetiesTableViewController: PropertiesViewModelDelegate {
    func viewModelLoadedProperties(with properties: Properties) {
        DispatchQueue.main.async {
            for property in properties.properties {
                let aProperty = PropertyViewModel(withProperty: property)
                self.propertyViewModels.append(aProperty)
            }
            self.tableView.reloadData()
            self.activityIndicator.stopAnimating()
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }
    
    func viewModelFailedToLoadProperties(with error: Error) {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.showAlert(with: error.localizedDescription)
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }
}
