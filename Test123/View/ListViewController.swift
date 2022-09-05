//
//  ListViewController.swift
//  Test123
//
//  Created by Shibanee Mishra on 06/09/22.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var tableView:BaseTableView!
    var viewModel = ListViewModel(repo: ListRepository())

    override func viewDidLoad() {
        super.viewDidLoad()
     
        intialization()
        viewModel.getData{ ststus in
            print(ststus)
            if ststus {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }

        }
    }
    
    func intialization(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerCells(ListTableViewCell.self)
        tableView.reloadData()
    }


}

//
////MARK: TableView
//MARK: TableView

extension ListViewController : UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueCell(ListTableViewCell.self,viewModel.list[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.navigationController?.pushViewController(DetailsViewController.getInstance(details: viewModel.list[indexPath.row]), animated: true)
    }
    
}

extension ListViewController {
    static func getInstance() -> ListViewController {
        let controller = ListViewController()
        return controller
    }
}
