//
//  DetailViewController.swift
//  iTunesSearchAPIRx
//
//  Created by 황인호 on 11/9/23.
//

import UIKit
import RxSwift
import RxCocoa

import Kingfisher

final class DetailViewController: UIViewController {
    
    private let viewModel = SearchViewModel()
    
    private let disposeBag = DisposeBag()
    
    var items: Results?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        bind()
        setUI()
    }
    
    private func bind() {
        
        appIconImageView.load(url: URL(string: items!.artworkUrl512)!)
        appNameLabel.text = items?.artistName
        corpLabel.text = items?.artistName
        versionLabel.text = "버전 \(items?.version ?? "0.0")"
        updateNewLabel.text = items?.releaseNotes
        descriptionLabel.text = items?.description
    }
    
    private func setUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [topView, appIconImageView, appNameLabel, corpLabel, downloadButton, middleView, newLabel, versionLabel, updateNewLabel, screenShotCollectionView, descriptionLabel].forEach {
            contentView.addSubview($0)
        }
        
        scrollView.bounces = false
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.height.greaterThanOrEqualTo(view.snp.height)
        }
        
        contentView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(scrollView.contentLayoutGuide)
            make.bottom.equalTo(scrollView.contentLayoutGuide).inset(20)
            make.width.equalTo(scrollView.frameLayoutGuide)
        }
        
        topView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(contentView.safeAreaLayoutGuide)
            make.height.equalTo(170)
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
        
        screenShotCollectionView.snp.makeConstraints { make in
            make.top.equalTo(middleView.snp.bottom).offset(30)
            make.horizontalEdges.equalTo(topView.snp.horizontalEdges)
            make.height.equalTo(300)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(screenShotCollectionView.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(topView.snp.horizontalEdges)
            make.bottom.equalTo(contentView.snp.bottom).inset(-20)
        }
    }
    
    private lazy var scrollView = UIScrollView()
    
    private let contentView = UIView()
    
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

    private let screenShotCollectionView = {
      
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(DetailCollectionViewCell.self, forCellWithReuseIdentifier: DetailCollectionViewCell.identifier)
        view.backgroundColor = .blue
        
        
        
        return view
    }()
    
    private let descriptionLabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
}
