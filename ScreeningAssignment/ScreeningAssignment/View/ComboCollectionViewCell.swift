//
//  ComboCollectionViewCell.swift
//  ScreeningAssignment
//
//  Created by Kumar Anand on 04/10/23.
//

import UIKit

class ComboCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    
    @IBOutlet weak var descLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        itemImage.layer.cornerRadius = itemImage.frame.size.width / 2
        itemImage.clipsToBounds = true
        self.bgView.layer.cornerRadius = 5
    }

}
