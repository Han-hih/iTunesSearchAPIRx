//
//  DetailViewController.swift
//  iTunesSearchAPIRx
//
//  Created by 황인호 on 11/9/23.
//

import UIKit
import RxSwift
import RxCocoa

final class DetailViewController: UIViewController {
    
    private let viewModel = SearchViewModel()
    
    private let disposeBag = DisposeBag()
    
    var items: Results?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        bind()
        setUI()
//        print(viewModel.selectedItems)
    }
    
    private func bind() {
        
        appIconImageView.load(url: URL(string: items!.artworkUrl512)!)
        
    }
    
    private func setUI() {
        [scrollView ,topView, appIconImageView, appNameLabel, corpLabel, downloadButton].forEach {
            view.addSubview($0)
        }
        
        scrollView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.bottom.equalTo(view.snp.bottom)
        }
        
        topView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(scrollView.safeAreaLayoutGuide)
            make.height.equalTo(view.snp.height).multipliedBy(0.13)
        }
        
        appIconImageView.snp.makeConstraints { make in
            make.leading.equalTo(topView.snp.leading)
            make.centerY.equalTo(topView.snp.centerY)
            make.height.width.equalTo(topView.snp.height)
        }
        
    }
    
    private let scrollView = UIScrollView()
    
    private let topView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
   private let appIconImageView = {
        let view = UIImageView()
       view.backgroundColor = .white
       view.layer.cornerRadius = 10
       view.layer.borderWidth = 1
       view.layer.borderColor = UIColor.black.cgColor
       view.clipsToBounds = true
        return view
    }()
    
  private let appNameLabel = {
        let label = UILabel()
        label.text = "카카오톡"
        return label
    }()
    
   private let corpLabel = {
        let label = CustomLabel()
        label.text = "카카오"
        return label
    }()
    
   private let downloadButton = {
        let bt = UIButton()
       bt.setTitle(" 받기 ", for: .normal)
       bt.tintColor = .white
       bt.backgroundColor = .systemBlue
       bt.layer.cornerRadius = 15
       bt.clipsToBounds = true
       bt.setContentCompressionResistancePriority(.required, for: .horizontal)
       bt.setTitleColor(.systemBlue, for: .normal)
        return bt
    }()
    
  
}
