//
//  PicksumVC.swift
//  Picksum
//
//  Created by Nilay M on 26/04/23.
//

import UIKit

class PicksumVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.tableHeaderView = UIView(frame: .zero)
            tableView.tableFooterView = UIView(frame: .zero)
            tableView.register(UINib(nibName: "PicksumTVC", bundle: Bundle.main), forCellReuseIdentifier: "PicksumTVC")
        }
    }
    
    var viewModel: PicksumViewModel = PicksumViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        getImages()
    }
    
    func setupUI() {
        title = "Picksum"
    }
    
    private func getImages() {
        viewModel.getImages { response in
            self.tableView.reloadData()
        }
    }
}

extension PicksumVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PicksumTVC = tableView.dequeueReusableCell(withIdentifier: "PicksumTVC", for: indexPath) as! PicksumTVC
        cell.item = viewModel.items[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = viewModel.items[indexPath.row]
        if item.isSelected {
            CommonHelper.showAlert(title: "Info!", message: item.author)
        }
        else {
            CommonHelper.showAlert(title: "Error!", message: "Checkbox is disabled.")
        }
    }
}
