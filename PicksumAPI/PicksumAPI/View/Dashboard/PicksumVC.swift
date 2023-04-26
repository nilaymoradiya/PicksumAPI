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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    func setupUI() {
        title = "Picksum"
    }
}

extension PicksumVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PicksumTVC = tableView.dequeueReusableCell(withIdentifier: "PicksumTVC", for: indexPath) as! PicksumTVC
        cell.selectionStyle = .none
        return cell
    }
}
