//
//  KeywordCell.swift
//  5th_Seminar(todayhouse)
//
//  Created by 양재욱 on 2020/05/28.
//  Copyright © 2020 hjyoo. All rights reserved.
//

import UIKit

class KeywordCell: UICollectionViewCell {
    static let identifier:String = "keywordCell"
    
    @IBOutlet var btnKeyword: UIButton!
    
    func set(keyword: String){
        btnKeyword.setTitle(keyword, for: .normal)
        btnKeyword.layer.cornerRadius = 6.0
    }
}
