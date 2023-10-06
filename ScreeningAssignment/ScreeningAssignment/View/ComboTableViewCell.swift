//
//  ComboTableViewCell.swift
//  ScreeningAssignment
//
//  Created by Kumar Anand on 04/10/23.
//

import UIKit

class ComboTableViewCell: UITableViewCell {

    
    var comboItem: [ComboItem] = []
    @IBOutlet weak var comboCollectionViewCell: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.comboCollectionViewCell.dataSource = self
        self.comboCollectionViewCell.delegate = self
        
        // Register the xib for collection view cell
                let cellNib = UINib(nibName: "ComboCollectionViewCell", bundle: nil)
                self.comboCollectionViewCell.register(cellNib, forCellWithReuseIdentifier: "ComboCollectionViewCell")
        populateComboItem()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populateComboItem() {
        // Create combo items
        comboItem.append(ComboItem(itemName: "Combo 1", itemDescription: "2,000", itemImage: UIImage(named: "Combo1Image")!))
        comboItem.append(ComboItem(itemName: "Combo 2", itemDescription: "8,000", itemImage: UIImage(named: "Combo2Image")!))
        comboItem.append(ComboItem(itemName: "Combo 3", itemDescription: "10,000", itemImage: UIImage(named: "Combo3Image")!))
        comboItem.append(ComboItem(itemName: "Combo 4", itemDescription: "5,000", itemImage: UIImage(named: "Combo4Image")!))
        comboItem.append(ComboItem(itemName: "Combo 5", itemDescription: "9,000", itemImage: UIImage(named: "Combo5Image")!))
        comboCollectionViewCell.reloadData()
       
    }
    
}

extension ComboTableViewCell : UICollectionViewDelegate,UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return comboItem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ComboCollectionViewCell", for: indexPath) as? ComboCollectionViewCell {
            cell.contentView.layer.cornerRadius = 5
            let comboItem = comboItem[indexPath.row]
            cell.itemImage.image = comboItem.itemImage
            cell.titleLbl.text = comboItem.itemName
            cell.descLbl.text = comboItem.itemDescription
                    return cell
                }
                return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        }
    
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 1.0
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 8.0
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Calculate the desired width and height for your collection view cell
        let cellWidth: CGFloat = 190 // Set your desired width here
        let cellHeight: CGFloat = 200 // Set your desired height here

        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    
}

