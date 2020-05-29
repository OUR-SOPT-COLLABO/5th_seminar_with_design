//
//  PicViewViewController.swift
//  5th_Seminar(todayhouse)
//
//  Created by hjyoo on 2020/05/24.
//  Copyright © 2020 hjyoo. All rights reserved.
//

import UIKit

class PicViewViewController: UIViewController {
    
    @IBOutlet var searchField: UITextField!
    @IBOutlet var bookMark: UIButton!
    @IBOutlet var shoppingCart: UIButton!
    
    @IBOutlet weak var collectionView: UICollectionView!
    private var btnKeywordList: [String] = []
    
    private var roomInformations: [RoomInformation] = []

    @IBOutlet weak var picTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 검색창 
        searchField.layer.cornerRadius = 10.0
        
        // 검색창에 검색 아이콘 추가하기
        let imageView = UIImageView(frame: CGRect(x:8.0, y:8.0, width: 15, height: 15 ))
        let image = UIImage(named: "iconSearch")
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        
        let view = UIView(frame: CGRect(x:0, y:0, width: 30, height: 30))
        view.addSubview(imageView)
        searchField.leftViewMode = UITextField.ViewMode.always
        searchField.leftView = view
        
        setBtnKeywordList()
       
        collectionView.dataSource = self
        collectionView.delegate = self
        
        setRoomInformations()
        picTableView.dataSource = self
        picTableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    private func setBtnKeywordList(){
        let keyword1 = "라탄&화이트"
        let keyword2 = "여름맞이"
        let keyword3 = "반려식물"
        let keyword4 = "블랙"
        let keyword5 = "겨울맞이"
        let keyword6 = "유럽풍"
        let keyword7 = "썸띵"
        
        btnKeywordList = [keyword1, keyword2, keyword3, keyword4, keyword5, keyword6, keyword7]
    }
    
    private func setRoomInformations() {
        let room1 = RoomInformation(userImageName: "picviewImgProfile", userName: "herenous", roomCategory: "다락방", text1: "면 좋았을까 이대로 또 모진 사람이 된 것 같아 또 걱정의 말을 해 나는 겁이 나서 또 울고만 있고 오늘은 곧 사라져 가는 사람들 속에서 아..", roomImageName: "picviewImgFeed1", text2: "니 더 큰 먼지가 되어온 날 날 바라보는 사람들 시선에 갇혀 지내도 나는 아직 모질고 거친 거야 잊고 서 있는 사람이 되고 싶")
        let room2 = RoomInformation(userImageName: "picviewImgProfile", userName: "herenous", roomCategory: "다락방", text1: "면 좋았을까 이대로 또 모진 사람이 된 것 같아 또 걱정의 말을 해 나는 겁이 나서 또 울고만 있고 오늘은 곧 사라져 가는 사람들 속에서 아..", roomImageName: "picviewImgFeed1", text2: "니 더 큰 먼지가 되어온 날 날 바라보는 사람들 시선에 갇혀 지내도 나는 아직 모질고 거친 거야 잊고 서 있는 사람이 되고 싶")
        let room3 = RoomInformation(userImageName: "picviewImgProfile", userName: "herenous", roomCategory: "다락방", text1: "면 좋았을까 이대로 또 모진 사람이 된 것 같아 또 걱정의 말을 해 나는 겁이 나서 또 울고만 있고 오늘은 곧 사라져 가는 사람들 속에서 아..", roomImageName: "picviewImgFeed1", text2: "니 더 큰 먼지가 되어온 날 날 바라보는 사람들 시선에 갇혀 지내도 나는 아직 모질고 거친 거야 잊고 서 있는 사람이 되고 싶")
        
        roomInformations = [room1, room2, room3]
    }
    
}

extension PicViewViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return btnKeywordList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)->UICollectionViewCell {
        guard let keywordCell = collectionView.dequeueReusableCell(withReuseIdentifier: KeywordCell.identifier, for: indexPath) as? KeywordCell else { return UICollectionViewCell() }
        
        keywordCell.set(keyword: btnKeywordList[indexPath.row])
        return keywordCell
    }
}

extension PicViewViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt
        indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 30)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20 }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5 }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
    }
}


extension PicViewViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roomInformations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let picViewCell = tableView.dequeueReusableCell(withIdentifier: PicViewTableViewCell.identifier, for: indexPath) as? PicViewTableViewCell else { return UITableViewCell() }
        
        picViewCell.setRoomInformation(
            userImageName: roomInformations[indexPath.row].userImageName,
            userName: roomInformations[indexPath.row].userName,
            roomCategory: roomInformations[indexPath.row].roomCategory,
            text1: roomInformations[indexPath.row].text1,
            roomImageName: roomInformations[indexPath.row].roomImageName,
            text2: roomInformations[indexPath.row].text2
        )
        
        return picViewCell
    }

}

extension PicViewViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
}
