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
        print(items?.releaseNotes)
    }
    
    private func bind() {
        
        appIconImageView.load(url: URL(string: items!.artworkUrl512)!)
        appNameLabel.text = items?.artistName
        corpLabel.text = items?.artistName
        versionLabel.text = "버전 \(items?.version ?? "0.0")"
        updateNewLabel.text = items?.releaseNotes
    }
    
    private func setUI() {
        [scrollView ,topView, appIconImageView, appNameLabel, corpLabel, downloadButton, middleView, newLabel, versionLabel, updateNewLabel].forEach {
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
        
        appNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(appIconImageView.snp.trailing).offset(10)
            make.top.equalTo(topView.snp.top).offset(20)
        }
        
        corpLabel.snp.makeConstraints { make in
            make.leading.equalTo(appNameLabel.snp.leading)
            make.top.equalTo(appNameLabel.snp.bottom).offset(15)
            
        }
        
        downloadButton.snp.makeConstraints { make in
            make.leading.equalTo(appNameLabel.snp.leading)
            make.top.equalTo(corpLabel.snp.bottom).offset(10)
            make.width.equalTo(70)
        }
        
        middleView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(topView.snp.horizontalEdges)
            make.top.equalTo(topView.snp.bottom).offset(30)
            make.height.greaterThanOrEqualTo(100)
            make.bottom.equalTo(updateNewLabel.snp.bottom)
        }
        
        newLabel.snp.makeConstraints { make in
            make.leading.equalTo(middleView.snp.leading)
            make.top.equalTo(middleView.snp.top)
        }
        
        versionLabel.snp.makeConstraints { make in
            make.leading.equalTo(middleView.snp.leading)
            make.top.equalTo(newLabel.snp.bottom).offset(10)
        }
        
        updateNewLabel.snp.makeConstraints { make in
            make.leading.equalTo(middleView.snp.leading)
            make.top.equalTo(versionLabel.snp.bottom).offset(20)
        }
    }
    
    private let scrollView = UIScrollView()
    
    private let topView = {
        let view = UIView()
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
      label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
   private let corpLabel = {
        let label = CustomLabel()
        label.text = "카카오"
       label.textColor = .lightGray
        return label
    }()
    
   private let downloadButton = {
        let bt = UIButton()
       bt.setTitle(" 받기 ", for: .normal)
       bt.backgroundColor = .systemBlue
       bt.layer.cornerRadius = 15
       bt.clipsToBounds = true
       bt.setContentCompressionResistancePriority(.required, for: .horizontal)
       bt.setTitleColor(.white, for: .normal)
        return bt
    }()
    
    private lazy var middleView = {
        let view = UIView()
        return view
    }()
    
    private let newLabel = {
        let label = UILabel()
        label.text = "새로운 소식"
        label.font = .boldSystemFont(ofSize: 30)
        
        return label
    }()
    
    private let versionLabel = {
        let label = UILabel()
        label.textColor = .lightGray
        return label
    }()
    
    private let updateNewLabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
}
