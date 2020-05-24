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
        
        storeTableview.register(nibName1, forCellReuseIdentifier: "StoreITemCell")
        storeTableview.register(nibName2, forCellReuseIdentifier: "StoreStylingShotCell")
        storeTableview.register(nibName3, forCellReuseIdentifier: "StoreReviewCell")
    }
}

extension StoreViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else if section == 1 {
            return 1
        }
        else {
            return 2
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
                return storestylingshotCell
            }
        }
        else {
            guard let storereviewCell = tableView.dequeueReusableCell(withIdentifier: "StoreReviewCell", for: indexPath) as? StoreReviewTableViewCell else { return UITableViewCell() }
            return storereviewCell
        }
        
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
                return 560
            }
        }
        return 100
    }
}
