//
//  DetailTableViewCell.swift
//  iTunesSearchAPIRx
//
//  Created by 황인호 on 11/11/23.
//

import UIKit

import SnapKit

final class DetailCollectionViewCell: UICollectionViewCell {
    
    let screenshots = {
        let view = UIImageView()
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        contentView.addSubview(screenshots)
        screenshots.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            
        }
    }
    
    
}
