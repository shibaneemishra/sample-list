//
//  BaseTableCell.swift
//  Test123
//
//  Created by Shibanee Mishra on 05/09/22.
//


import UIKit

class BaseTableCell: UITableViewCell{
    
    override  func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func update<T: Codable>(data: T,rowIndex:Int? = 0){}
}
