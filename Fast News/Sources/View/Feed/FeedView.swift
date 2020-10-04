//
//  FeedView.swift
//  Fast News
//
//  Copyright © 2019 Lucas Moreton. All rights reserved.
//

import UIKit

protocol FeedViewDelegate {
    func didTouch(cell: FeedCell, indexPath: IndexPath)
    func loadNews()
}

extension FeedViewDelegate
{
    func loadNews(){}
}

class FeedView: UIView {
    
    //MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!
    var viewModels: [HotNewsViewModel] = [HotNewsViewModel]() {
        didSet {
            tableView.reloadData()
        }
    }
    var delegate: FeedViewDelegate?
    
    //MARK: - Public Methods
    
    func setup(with viewModels: [HotNewsViewModel], and delegate: FeedViewDelegate) {
        
        tableView.register(UINib(nibName: "FeedCell", bundle: Bundle.main), forCellReuseIdentifier: "FeedCell")
        tableView.register(UINib(nibName: "LoadingCell", bundle: Bundle.main), forCellReuseIdentifier: "LoadingCell")
        
        self.delegate = delegate
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundColor = .white
        
        self.viewModels.append(contentsOf: viewModels) 
    }
}

extension FeedView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count + 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == viewModels.count
        {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "LoadingCell", for: indexPath) as? LoadingCell else { fatalError("Cell is not of type FeedCell!") }
            cell.startLoading()
            self.delegate?.loadNews()
            return cell
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell", for: indexPath) as? FeedCell else { fatalError("Cell is not of type FeedCell!") }
        
        cell.setup(hotNewsViewModel: viewModels[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == viewModels.count
        {
            return 44.0
        }        
        return 260.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? FeedCell else { fatalError("Cell is not of type FeedCell!") }
        if indexPath.row == viewModels.count
        {
            return
        }
        delegate?.didTouch(cell: cell, indexPath: indexPath)
    }
}
