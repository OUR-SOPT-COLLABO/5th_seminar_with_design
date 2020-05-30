//
//  StoreViewController.swift
//  5th_Seminar(todayhouse)
//
//  Created by hjyoo on 2020/05/24.
//  Copyright © 2020 hjyoo. All rights reserved.
//

import UIKit

class StoreViewController: UIViewController {
    
    @IBOutlet weak var storeTableview: UITableView!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            registerXib()
            storeTableview.dataSource = self
            storeTableview.delegate = self
        }
        
        private func registerXib() {
            let nibName1 = UINib(nibName: "StoreITemTableViewCell", bundle: nil)
            let nibName2 = UINib(nibName: "StoreStylingShotTableViewCell", bundle: nil)
            let nibName3 = UINib(nibName: "StoreReviewTableViewCell", bundle: nil)
            let nibName4 = UINib(nibName: "StoreReviewTableViewSecondCell", bundle: nil)
            
            
            storeTableview.register(nibName1, forCellReuseIdentifier: "StoreITemCell")
            storeTableview.register(nibName2, forCellReuseIdentifier: "StoreStylingShotCell")
            storeTableview.register(nibName3, forCellReuseIdentifier: "StoreReviewCell")
            storeTableview.register(nibName4, forCellReuseIdentifier: "StoreReviewSecondCell")
            
        }
    }

    extension StoreViewController: UITableViewDataSource {
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 4
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if section == 0 {
                return 1
            }
            else if section == 1 {
                return 1
            }
            else if section == 2 {
                return 1
            }
            else {
                return 4 // 임의로 4로 해놓은 상태. 나중에 서버와 협동시, 데이터 개수에 맞게 출력하게 해야 함
            }
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if indexPath.section == 0 {
                if indexPath.row == 0 {
                    guard let storeitemCell = tableView.dequeueReusableCell(withIdentifier: "StoreITemCell", for: indexPath) as? StoreITemTableViewCell else { return UITableViewCell() }
                    return storeitemCell
                }
            }
            else if indexPath.section == 1 {
                if indexPath.row == 0 {
                    guard let storestylingshotCell = tableView.dequeueReusableCell(withIdentifier: "StoreStylingShotCell", for: indexPath) as? StoreStylingShotTableViewCell else { return UITableViewCell() }
                    
                    //storestylingshotCell.stylingbigImg.image = UIImage(named: <#T##String#>)
                    return storestylingshotCell
                }
            }
                else if indexPath.section == 2 {
                    if indexPath.row == 0 {
                        guard let storereviewCell = tableView.dequeueReusableCell(withIdentifier: "StoreReviewCell", for: indexPath) as? StoreReviewTableViewCell else { return UITableViewCell() }
                        return storereviewCell
                    }
                }
            else {
                guard let storereviewsecondCell = tableView.dequeueReusableCell(withIdentifier: "StoreReviewSecondCell", for: indexPath) as? StoreReviewTableViewSecondCell else { return UITableViewCell() }
                return storereviewsecondCell
            } //4번째 셀을 추가 생성하면서 코드도 추가함.
            
            return UITableViewCell()
        }
    }

    extension StoreViewController: UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            if indexPath.section == 0 {
                if indexPath.row == 0 {
                    return 750
                }
            }
            else if indexPath.section == 1 {
                if indexPath.row == 0 {
                    return 602
                }
            }
            else if indexPath.section == 2 {
                if indexPath.row == 0 {
                    return 180
                }
            }
            else if indexPath.section == 3 {
                       if indexPath.row == 0 {
                           return 325
                       }
                   }
            return 325 //4번째 셀이 반복될 때 높이 설정
        }
    }
