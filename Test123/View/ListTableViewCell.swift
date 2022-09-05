//
//  ListTableViewCell.swift
//  Test123
//
//  Created by Shibanee Mishra on 05/09/22.
//

import UIKit

class ListTableViewCell: BaseTableCell {

    @IBOutlet weak var lblTitle : UILabel!
    @IBOutlet weak var lblBody : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func update<T>(data: T, rowIndex: Int? = 0){
        
        guard let data = data as? Response  else { return }
        lblTitle.text = data.title
        lblBody.text = data.body

    }
}
