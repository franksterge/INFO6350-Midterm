//
//  CustomCell.swift
//  Midterm
//
//  Created by GeFrank on 3/30/21.
//

import UIKit

class CustomCell: UITableViewCell {
    var stateLabel = UILabel()
    var positiveLabel = UILabel()
    var totalLabel = UILabel()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(frame: CGRect) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: String(describing: CustomCell.self))
        self.stateLabel.text = "hello"
        self.positiveLabel.text = "hello"
        self.totalLabel.text = "hello"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    func setStateLabel(state: String) {
        self.stateLabel = UILabel(frame: CGRect(x: 40, y: 10, width: 100, height: 40))
        self.stateLabel.text = state
        self.stateLabel.center = CGPoint(x: 40, y: 10)
        self.stateLabel.sizeToFit()
        self.addSubview(self.stateLabel)

    }
    
    func setPositiveLabel(positive: Int) {
        self.positiveLabel = UILabel(frame: CGRect(x: 100, y: 10, width: 100, height: 40))
        self.stateLabel.text = String(positive)
        self.stateLabel.center = CGPoint(x: 100, y: 10)
        self.stateLabel.sizeToFit()
        self.addSubview(self.positiveLabel)

    }
    
    func setTotalLabel(total: Int) {
        self.totalLabel = UILabel(frame: CGRect(x: 200, y: 10, width: 100, height: 40))
        self.stateLabel.text = String(total)
        self.stateLabel.center = CGPoint(x: 200, y: 10)
        self.stateLabel.sizeToFit()
        self.addSubview(self.totalLabel)

    }
}

