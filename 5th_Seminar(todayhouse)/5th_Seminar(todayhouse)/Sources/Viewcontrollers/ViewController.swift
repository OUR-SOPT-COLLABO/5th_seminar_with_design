//
//  ViewController.swift
//  5th_Seminar(todayhouse)
//
//  Created by hjyoo on 2020/05/24.
//  Copyright © 2020 hjyoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   /* @IBOutlet weak var topCollectionView: UICollectionView!
    @IBOutlet weak var storyCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    private var topList: [TopData] = []
    private var storyList: [StoryData] = []
    private var popularList: [PopularData] = []
    
    private func setTopList() {
        let top1 = TopData(num: "1", imageName: "imageBanner")
        let top2 = TopData(num: "2", imageName: "imageBanner")
        
        topList = [top1, top2]
    }
    private func setStoryList() {
        let story1 = StoryData(imageName: "imgbtnStory1")
        let story2 = StoryData(imageName: "imgbtnStory2")
        let story3 = StoryData(imageName: "imgbtnStory3")
        let story4 = StoryData(imageName: "imgbtnStory4")
        
        storyList = [story1, story2, story3, story4]
    }
    private func setPopularList() {
        let popular1 = PopularData(imageName: "imgbtnPhoto1")
        let popular2 = PopularData(imageName: "imgbtnPhoto2")
        let popular3 = PopularData(imageName: "imgbtnPhoto3")
        let popular4 = PopularData(imageName: "imgbtnPhoto4")
        let popular5 = PopularData(imageName: "imgbtnPhoto5")
        let popular6 = PopularData(imageName: "imgbtnPhoto6")
        let popular7 = PopularData(imageName: "imgbtnPhoto7")
        let popular8 = PopularData(imageName: "imgbtnPhoto8")
        let popular9 = PopularData(imageName: "imgbtnPhoto9")

        popularList = [popular1, popular2, popular3, popular4, popular5, popular6, popular7, popular8, popular9]
    }
    
    
    func setupNavVar() {
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupNavVar()
        
        topCollectionView.dataSource = self
        topCollectionView.delegate = self
        //topCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "TopCell")
        
        storyCollectionView.dataSource = self
        storyCollectionView.delegate = self
        //storyCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "StoryCell")
        
        popularCollectionView.dataSource = self
        popularCollectionView.delegate = self
        //popularCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "PopularCell")
        
        topCollectionView.tag = 1
        storyCollectionView.tag = 2
        popularCollectionView.tag = 3
    }


}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1 {
            return 2
        }
        if collectionView.tag == 2 {
            return 4
        }
        if collectionView.tag == 3 {
            return 9
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // cell identifier 별로 다르게 작업하는 방법
        // cell identifier 통일하되 각 컬렉션 별로 작업하는 방법
        // 아이에 컬렉션뷰 배치를 코드로 하는 방법
        switch collectionView.tag {
        case 1:
           /* guard let topCell = collectionView.dequeueReusableCell(withReuseIdentifier: MainTopCollectionViewCell.identifier, for:
            indexPath) as? MainTopCollectionViewCell
            else { return UICollectionViewCell() }
            
            topCell.topSet(topList[indexPath.row])
            //MainTopCollectionViewCell.setDataInformation(name: "김지현",
            //message: "아요^0^", imageName: "profile7Img")*/
            
            let topCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopCell", for: indexPath)
            return topCell
            
        case 2:
            /*guard let storyCell = collectionView.dequeueReusableCell(withReuseIdentifier: MainStoryCollectionViewCell.identifier, for:
            indexPath) as? MainStoryCollectionViewCell
            else { return UICollectionViewCell() }
            
            storyCell.storySet(storyList[indexPath.row])
            //MainTopCollectionViewCell.setDataInformation(name: "김지현",
            //message: "아요^0^", imageName: "profile7Img")
 */
            
            let storyCell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCell", for: indexPath)
            
            return storyCell
            
        case 3:
            /*guard let popularCell = collectionView.dequeueReusableCell(withReuseIdentifier: MainPopularCollectionViewCell.identifier, for:
            indexPath) as? MainPopularCollectionViewCell
            else { return UICollectionViewCell() }
            
            popularCell.popularSet(popularList[indexPath.row])
            //MainTopCollectionViewCell.setDataInformation(name: "김지현",
            //message: "아요^0^", imageName: "profile7Img")
            
            return popularCell*/
            
            let popularCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularCell", for: indexPath)
            
            return popularCell
        default:
            guard let popularCell = collectionView.dequeueReusableCell(withReuseIdentifier: MainPopularCollectionViewCell.identifier, for:
            indexPath) as? MainPopularCollectionViewCell
            else { return UICollectionViewCell() }
            
            popularCell.popularSet(popularList[indexPath.row])
            //MainTopCollectionViewCell.setDataInformation(name: "김지현",
            //message: "아요^0^", imageName: "profile7Img")
            
            return popularCell
        }
    }
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt
        indexPath: IndexPath) -> CGSize {
        switch collectionView.tag {
        case 1:
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        case 2:
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        default:
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }
    } // 셀 가로와 세로 크기 지정
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        switch collectionView.tag {
        case 1:
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        case 2:
            return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        default:
            return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        }
    } // 콜렉션 뷰 인셋 지정
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView.tag {
        case 1:
            return 0
        case 2:
            return 0
        default:
            return 10
        }
    } // 셀 위아래 간격 조정
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView.tag {
        case 1:
            return 0
        case 2:
            return 12
        default:
            return 10
        }
    } // 셀 좌우 간격 조정*/
    
}
