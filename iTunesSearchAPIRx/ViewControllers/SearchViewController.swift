//
//  ViewController.swift
//  iTunesSearchAPIRx
//
//  Created by 황인호 on 11/8/23.
//

import UIKit
import RxSwift
import RxCocoa

import SnapKit

final class SearchViewController: UIViewController {
    
    private let searchController = {
        let bar = UISearchController(searchResultsController: nil)
        bar.searchBar.placeholder = "앱, 게임, 스토리 등"
        return bar
    }()
    
    private let tableView = {
        let view = UITableView()
        view.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.identifier)
        view.backgroundColor = .lightGray
        view.rowHeight = 300
        view.separatorStyle = .none
        return view
    }()
    
    
    private let viewModel = SearchViewModel()
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationSetting()
        setUI()
    }
    
    
    private func navigationSetting() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "검색"
        self.navigationItem.searchController = searchController
        
    }
    
    private func setUI() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(10)
        }
        
    }
    
    
}

