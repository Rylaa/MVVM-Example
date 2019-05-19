//
//  MovieWithImageTableViewCell.swift
//  MVVM-Example
//
//  Created by Yusuf DEMİRKOPARAN on 18.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import UIKit
import TinyConstraints
import Kingfisher

class MovieWithImageTableViewCell : UITableViewCell {
    
    lazy var name : UILabel = {
        let label = UILabel()
        return label
    }()
    lazy var artistName : UILabel = {
        let label = UILabel()
        return label
    }()
    lazy var albumImage : UIImageView = {
        var img = UIImageView()
        return img
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(albumImage)
        self.addSubview(name)
        self.addSubview(artistName)
        
        albumImage.left(to: self)
        albumImage.width(50)
        albumImage.height(50)
        
        name.leftToRight(of: albumImage)
        
        artistName.topToBottom(of: name)
        artistName.leftToRight(of: albumImage)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
