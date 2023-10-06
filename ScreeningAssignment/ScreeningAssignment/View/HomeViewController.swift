//
//  HomeViewController.swift
//  ScreeningAssignment
//
//  Created by Kumar Anand on 05/10/23.
//

import UIKit

class HomeViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var comboTableView: UITableView!
    var comboSections: [ComboSection] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        comboTableView.dataSource = self
        comboTableView.delegate = self
        comboTableView.separatorStyle = .none
                // Register your custom combo cell
        comboTableView.register(UINib(nibName: "ComboTableViewCell", bundle: nil), forCellReuseIdentifier: "ComboTableViewCell")
        populateComboSections()
        // Do any additional setup after loading the view.
    }
    func populateComboSections() {
            // Create combo items
            let item1 = ComboItem(itemName: "Combo 1", itemDescription: "Description 1", itemImage: UIImage(named: "Combo1Image")!)
            let item2 = ComboItem(itemName: "Combo 2", itemDescription: "Description 2", itemImage: UIImage(named: "Combo2Image")!)
            let item3 = ComboItem(itemName: "Combo 3", itemDescription: "Description 3", itemImage: UIImage(named: "Combo3Image")!)
            let item4 = ComboItem(itemName: "Combo 4", itemDescription: "Description 4", itemImage: UIImage(named: "Combo4Image")!)
            let item5 = ComboItem(itemName: "Combo 5", itemDescription: "Description 5", itemImage: UIImage(named: "Combo5Image")!)

            // Create combo sections
            let section1 = ComboSection(sectionTitle: "Recommended Combos ", comboItems: [item1])//, item2, item3])
            let section2 = ComboSection(sectionTitle: "Hottest", comboItems: [item4, item5])

            // Add sections to comboSections array
            comboSections = [section1, section2]
            comboTableView.reloadData()
        }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension HomeViewController {
    func numberOfSections(in tableView: UITableView) -> Int {
            return comboSections.count
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ComboTableViewCell", for: indexPath) as! ComboTableViewCell

            return cell
        }
        
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return comboSections[section].sectionTitle
        }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
}
