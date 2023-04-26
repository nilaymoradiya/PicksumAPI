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
    
    private var refreshControl = UIRefreshControl()
    private var isLoadingMore = false
    var viewModel: PicksumViewModel = PicksumViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
        getImages()
    }
    
    func setupUI() {
        title = "Picksum"
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: UIControl.Event.valueChanged)
        refreshControl.tintColor = .black
        tableView.addSubview(refreshControl)
    }
    
    @objc func refresh(sender: AnyObject?) {
        viewModel.resetAllData()
        tableView.reloadData()
        getImages()
    }
    
    private func getImages() {
        viewModel.getImges { response in
            self.refreshControl.endRefreshing()
            self.isLoadingMore = false
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = viewModel.items[indexPath.row]
        let ratio = (item.width ?? 0) / (item.height ?? 1)
        return tableView.frame.width / ratio
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if !self.isLoadingMore {
            let currentOffset = scrollView.contentOffset.y
            let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
            // Change 10.0 to adjust the distance from bottom
            if maximumOffset - currentOffset <= 10.0 {
                if viewModel.isLoadMoreRecord {
                    viewModel.page += 1
                    getImages()
                }
            }
        }
    }
}
