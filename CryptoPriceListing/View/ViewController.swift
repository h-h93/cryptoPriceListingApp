//
//  ViewController.swift
//  CryptoPriceListing
//
//  Created by hanif hussain on 07/10/2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    let tableDataSource = TableViewDataSource()
    // create a table view
    let tableView: UITableView = {
        let tableView = UITableView()
        //tableView.backgroundColor = UIColor.black
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Name"
        return label
    }()
    
    let symbolLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Symbol"
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Price"
        return label
    }()
    
    var headerLabelPortraitConstraints = [NSLayoutConstraint]()
    var headerLabelLandscapeConstraints = [NSLayoutConstraint]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        startParsingJson()
        
        view.addSubview(nameLabel)
        view.addSubview(symbolLabel)
        view.addSubview(priceLabel)
        
        setupColumnLabelHeaderConstraints()
        
        setupTableView()
    }
    
    func setupColumnLabelHeaderConstraints() {
        // constraints for our column header label when portrait
        headerLabelPortraitConstraints = [
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            
            symbolLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            symbolLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 110),
            
            priceLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            priceLabel.leadingAnchor.constraint(equalTo: symbolLabel.trailingAnchor, constant: 110),
        ]
        
        // constraints for our column header label when landscape
        headerLabelLandscapeConstraints = [
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            
            symbolLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            symbolLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 250),
            
            priceLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            priceLabel.leadingAnchor.constraint(equalTo: symbolLabel.trailingAnchor, constant: 250),
        ]
        
        // check device orientation and depending on what orientation the app is opened in we activate constraints
        if UIDevice.current.orientation.isLandscape {
            // disable portrait constraints
            for x in headerLabelPortraitConstraints {
                x.isActive = false
            }
            // activate landscape constraints
            for i in headerLabelLandscapeConstraints {
                i.isActive = true
            }
        } else {
            // disable landscape constraints
            for i in headerLabelLandscapeConstraints {
                i.isActive = false
            }
            // activate portrain constraints
            for x in headerLabelPortraitConstraints {
                x.isActive = true
            }
        }
    }
    
    func startParsingJson() {
        Task {
            await loadParseJson()
        }
    }

    
    func loadParseJson() async {
        let urlString = "https://api.coinlore.net/api/tickers/"
        
        if let url = URL(string: urlString) {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                parse(json: data)
            } catch {
                print(error)
            }
        }
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        if let jsonPetitions = try? decoder.decode(coinData.self, from: json) {
            print("here")
            tableDataSource.cryptoCoins = jsonPetitions.data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = tableDataSource
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
        tableView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
    
    // when view transitions orientation e.g. landscape to portrait or portrait to landscape
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        if UIDevice.current.orientation.isLandscape {
            for x in headerLabelPortraitConstraints {
                x.isActive = false
            }

            for i in headerLabelLandscapeConstraints {
                i.isActive = true
            }
        } else {
            for i in headerLabelLandscapeConstraints {
                i.isActive = false
            }
            
            for x in headerLabelPortraitConstraints {
                x.isActive = true
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }


}

