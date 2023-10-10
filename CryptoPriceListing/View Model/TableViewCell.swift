//
//  TableViewCell.swift
//  CryptoPriceListing
//
//  Created by hanif hussain on 08/10/2023.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    let backgroundCardView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray5
        return view
    }()
    
    var cryptoTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Poppins", size: 11)
        label.adjustsFontSizeToFitWidth = true
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var cryptoSymbolLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Poppins", size: 11)
        label.adjustsFontSizeToFitWidth = true
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var cryptoPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Poppins", size: 11)
        label.adjustsFontSizeToFitWidth = true
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(backgroundCardView)
        backgroundCardView.addSubview(cryptoTitleLabel)
        backgroundCardView.addSubview(cryptoSymbolLabel)
        backgroundCardView.addSubview(cryptoPriceLabel)
        
        setupView()
    }
    
    func setupView() {
        cryptoTitleLabel.font = cryptoTitleLabel.font.withSize(16)
        cryptoSymbolLabel.font = cryptoTitleLabel.font.withSize(16)
        cryptoPriceLabel.font = cryptoTitleLabel.font.withSize(16)
        
        NSLayoutConstraint.activate([
            backgroundCardView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            backgroundCardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            backgroundCardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            backgroundCardView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            cryptoTitleLabel.topAnchor.constraint(equalTo: backgroundCardView.topAnchor, constant: 10),
            cryptoTitleLabel.leadingAnchor.constraint(equalTo: backgroundCardView.leadingAnchor, constant: 10),
            cryptoTitleLabel.widthAnchor.constraint(equalToConstant: 110),
            cryptoTitleLabel.heightAnchor.constraint(equalToConstant: 50),
            
            cryptoSymbolLabel.topAnchor.constraint(equalTo: backgroundCardView.topAnchor, constant: 10),
            cryptoSymbolLabel.leadingAnchor.constraint(equalTo: cryptoTitleLabel.trailingAnchor, constant: 50),
            cryptoSymbolLabel.widthAnchor.constraint(equalToConstant: 110),
            cryptoSymbolLabel.heightAnchor.constraint(equalToConstant: 50),
            
            cryptoPriceLabel.topAnchor.constraint(equalTo: backgroundCardView.topAnchor, constant: 10),
            cryptoPriceLabel.leadingAnchor.constraint(equalTo: cryptoSymbolLabel.trailingAnchor, constant: 40),
            //cryptoPriceLabel.widthAnchor.constraint(equalToConstant: 100),
            cryptoPriceLabel.trailingAnchor.constraint(equalTo: backgroundCardView.trailingAnchor, constant: -2),
            cryptoPriceLabel.heightAnchor.constraint(equalToConstant: 50),
        
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
