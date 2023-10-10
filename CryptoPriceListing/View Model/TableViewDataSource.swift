//
//  TableViewDataSource.swift
//  CryptoPriceListing
//
//  Created by hanif hussain on 08/10/2023.
//

import UIKit

class TableViewDataSource: NSObject, UITableViewDataSource {
    var cryptoCoins: [coin]?
    let cellIdentifier = "Cell"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cryptoCoins?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TableViewCell
        
        cell.cryptoTitleLabel.text = cryptoCoins?[indexPath.row].name
        cell.cryptoSymbolLabel.text = cryptoCoins?[indexPath.row].symbol
        cell.cryptoPriceLabel.text = " $\(cryptoCoins![indexPath.row].priceUsd)"
        
        return cell
    }
    

}
