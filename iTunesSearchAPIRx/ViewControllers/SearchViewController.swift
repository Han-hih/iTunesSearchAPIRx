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
import Kingfisher

final class SearchViewController: UIViewController {
    
    private let searchController = {
        let bar = UISearchController(searchResultsController: nil)
        bar.searchBar.placeholder = "앱, 게임, 스토리 등"
        return bar
    }()
    
    private let tableView = {
        let view = UITableView()
        view.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.identifier)
        view.rowHeight = 350
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
        bind()
    }
    
    private func bind() {
        let input = SearchViewModel.Input(searchButtonTap: searchController.searchBar.rx.searchButtonClicked.asObservable(), searchText: searchController.searchBar.rx.text.orEmpty.asObservable())
        let output = viewModel.transform(input: input)
        output.items
            .bind(to: tableView.rx.items(cellIdentifier: SearchTableViewCell.identifier, cellType: SearchTableViewCell.self)) { (row, element, cell) in
                cell.rateLabel.text = String(format: "%.1f", element.averageUserRating)
                cell.appNameLabel.text = element.trackName
                cell.corpLabel.text = element.artistName
                cell.genreLabel.text = element.genres[0]
                
                cell.appIconView.kf.setImage(with: URL(string: element.artworkUrl512)!)
                cell.firstImageView.kf.setImage(with: URL(string: element.screenshotUrls[0])!)
                cell.secondImageView.kf.setImage(with: URL(string: element.screenshotUrls[1])!)
                cell.thirdImageView.kf.setImage(with: URL(string: element.screenshotUrls[2])!)
            }
            .disposed(by: disposeBag)
     
        Observable.zip(tableView.rx.modelSelected(Results.self), tableView.rx.itemSelected)
            .map { $0.0 }
            .bind(with: self, onNext: { owner, value in
                self.presentDetail(of: value)
            })
            .disposed(by: disposeBag)
    }
    
    private func presentDetail(of items: Results) {
        let vc = DetailViewController()
        vc.viewModel.items = items
        self.navigationItem.largeTitleDisplayMode = .never
        self.navigationController?.pushViewController(vc, animated: true)
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

