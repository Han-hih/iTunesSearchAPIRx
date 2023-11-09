//
//  SearchTableViewCell.swift
//  iTunesSearchAPIRx
//
//  Created by 황인호 on 11/8/23.
//

import UIKit

import SnapKit

final class SearchTableViewCell: UITableViewCell {
    
    private lazy var topView = {
        let view = UIView()
        return view
    }()
    
    let appIconView = {
        let view = UIImageView()
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    let appNameLabel = {
        let label = UILabel()
        label.text = "카카오"
        return label
    }()
    
    let downloadButton = {
        let bt = UIButton()
        bt.setTitle(" 받기 ", for: .normal)
        bt.tintColor = .blue
        bt.backgroundColor = .gray
        bt.layer.cornerRadius = 10
        bt.clipsToBounds = true
        return bt
    }()
    
    private let starImage = {
        let image = UIImageView()
        image.image = UIImage(systemName: "star.fill")
        
        return image
    }()
    
    private lazy var bottomView = {
        let view = UIView()
        return view
    }()
    
    let rateLabel = {
        let label = CustomLabel()
        label.text = "3.4"
        return label
    }()
    
    let corpLabel = {
        let label = CustomLabel()
        label.text = "카카오"
        return label
    }()
    
    let genreLabel = {
        let label = CustomLabel()
        label.text = "여행"
        return label
    }()
    
   private lazy var stackView = {
        let view = UIStackView(arrangedSubviews: [firstImageView, secondImageView, thirdImageView])
       view.spacing = 8
       view.axis = .horizontal
       view.distribution = .fillEqually
       view.alignment = .fill
    return view
    }()
    
    let firstImageView = {
        let view = CustomImageView(frame: .zero)
        view.backgroundColor = .red
        return view
    }()
    
    let secondImageView = {
        let view = CustomImageView(frame: .zero)
        view.backgroundColor = .green
        return view
    }()
    
    let thirdImageView = {
        let view = CustomImageView(frame: .zero)
        view.backgroundColor = .blue
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   private func setUI() {
       
       [topView, appIconView, appNameLabel, downloadButton, bottomView, starImage, rateLabel, corpLabel, genreLabel, stackView].forEach {
           contentView.addSubview($0)
       }
       
       topView.snp.makeConstraints { make in
           make.top.leading.trailing.equalToSuperview()
           make.height.equalToSuperview().multipliedBy(0.2)
       }
       appIconView.snp.makeConstraints { make in
           make.leading.equalTo(topView.snp.leading)
           make.centerY.equalTo(topView.snp.centerY)
           make.height.equalTo(topView.snp.height)
           make.width.equalTo(appIconView.snp.height)
       }
       appNameLabel.snp.makeConstraints { make in
           make.centerY.equalTo(topView.snp.centerY)
           make.leading.equalTo(appIconView.snp.trailing).offset(10)
           make.trailing.equalTo(downloadButton).inset(10)
       }
       downloadButton.snp.makeConstraints { make in
           make.centerY.equalTo(topView.snp.centerY)
           make.trailing.equalTo(topView.snp.trailing)
       }
       
       bottomView.snp.makeConstraints { make in
           make.top.equalTo(topView.snp.bottom)
           make.horizontalEdges.equalToSuperview()
           make.height.equalToSuperview().multipliedBy(0.1)
       }
       
       starImage.snp.makeConstraints { make in
           make.leading.equalToSuperview()
           make.centerY.equalTo(bottomView.snp.centerY)
       }
       
       rateLabel.snp.makeConstraints { make in
           make.leading.equalTo(starImage.snp.trailing).offset(5)
           make.centerY.equalTo(bottomView.snp.centerY)
       }
       
       corpLabel.snp.makeConstraints { make in
           make.center.equalTo(bottomView)
       }
       
       genreLabel.snp.makeConstraints { make in
           make.centerY.equalTo(bottomView.snp.centerY)
           make.trailing.equalTo(bottomView.snp.trailing)
       }
       
       stackView.snp.makeConstraints { make in
           make.top.equalTo(bottomView.snp.bottom)
           make.horizontalEdges.equalToSuperview()
           make.bottom.equalToSuperview().inset(20)
       }
       
    }
    
    
    
    
    
}
