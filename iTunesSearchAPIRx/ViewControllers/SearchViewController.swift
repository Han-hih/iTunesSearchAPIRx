//
//  ViewController.swift
//  iTunesSearchAPIRx
//
//  Created by 황인호 on 11/8/23.
//

import UIKit

import SnapKit

final class SearchViewController: UIViewController {

   private let searchBar = {
        let search = UISearchBar()
        search.placeholder = "게임, 앱, 스토리 등"
        search.setShowsCancelButton(true, animated: true)
        return search
    }()
    
    
    
   private let viewModel = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationSetting()
        setUI()
    }
    
    
   private func navigationSetting() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "검색"
    }
    
   private func setUI() {
        [searchBar].forEach {
            view.addSubview($0)
        }
        searchBar.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        
        
    }
    
    
}

