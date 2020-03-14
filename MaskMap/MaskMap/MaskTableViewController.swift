//
//  MaskTableViewController.swift
//  maskMap
//
//  Created by wyn on 2020/3/8.
//  Copyright © 2020 Wyn. All rights reserved.
//

import UIKit

class MaskTableViewController: UITableViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    let listOfMasks = [MaskDetail]()
//    {
//        willSet{
//            DispatchQueue.main.async{
//                self.tableView.reloadData()
//                self.navigationItem.title = "\(self.listOfMasks.count) Hospitals found"
//            }
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        searchBar.delegate = self
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return listOfMasks.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let mask = listOfMasks[indexPath.row]
        cell.textLabel?.text = mask.name
        cell.detailTextLabel?.text = mask.address
        
        return cell
    }
}
//extension MaskTableViewController : UISearchBarDelegate{
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        guard let searchBarText = searchBar.text else{return}
//        let masksRequest = MaskRequest(address: searchBarText)
//        masksRequest.getMasks { [weak self] resault in switch resault{
//        case .failure(let error):
//            print(error)
//        case .success(let masks):
//            self?.listOfMasks = masks
//            }
//
//        }
//}
//}
