//
//  PicViewTableViewCell.swift
//  5th_Seminar(todayhouse)
//
//  Created by 양재욱 on 2020/05/27.
//  Copyright © 2020 hjyoo. All rights reserved.
//

import UIKit

class PicViewTableViewCell: UITableViewCell {
    static let identifier: String = "picVIewCell"
    private var roomDetailList:[RoomDetail] = []

    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var lblUserName: UILabel!
    @IBOutlet var lblRoomCategory: UILabel!
    @IBOutlet var btnFollow: UIButton!
    @IBOutlet var btnShare: UIButton!
    @IBOutlet var btnEtc: UIButton!
    @IBOutlet var lblText1: UILabel!
    @IBOutlet var roomImageView: UIImageView!
    @IBOutlet var btnLike: UIButton!
    @IBOutlet var btnComment: UIButton!
    @IBOutlet var btnBookMark: UIButton!
    @IBOutlet var lblText2: UILabel!
    
    @IBOutlet weak var roomDetailCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setRoomDetails()
        
        self.roomDetailCollectionView.delegate = self
        self.roomDetailCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setRoomInformation(userImageName: String, userName: String, roomCategory: String, text1: String, roomImageName: String, text2: String) {
        
        userImageView.image = UIImage(named: userImageName)
        lblUserName.text = userName
        lblRoomCategory.text = roomCategory
        lblText1.text = text1
        roomImageView.image = UIImage(named: roomImageName)
        lblText2.text = text2
    }
    
    func setRoomDetails(){
        
        PicviewService.shared.getData(){ NetworkResult in
            switch NetworkResult {
            case .success(let data):
                guard let data = data as? [DetailData] else {return}
                print("@@@@@@data@@@@@@")
                print(data)
                let detail1 = RoomDetail(imageName: "picviewImgProduct1", factoryName: data[0].company, description: data[0].content, price: data[0].price)
                let detail2 = RoomDetail(imageName: "picviewImgProduct2", factoryName: data[1].company, description: data[1].content, price: data[1].price)
                let detail3 = RoomDetail(imageName: "picviewImgProduct3", factoryName: data[1].company, description: data[1].content, price: data[1].price)
                self.roomDetailList = [detail1, detail2, detail3]
                self.roomDetailCollectionView.reloadData()

            case .requestErr(_):
                print("Request error@@")
            case .pathErr:
                print("path error")
            case .serverErr:
                print("server error")
            case .networkFail:
                print("network error")
            }
        }
//        let detail1 = RoomDetail(imageName: "picviewImgProduct1", factoryName: "체어 팩토리", description: "딱딱해 보이지만 생각보다 편안한 의자", price: 26000)
//        let detail2 = RoomDetail(imageName: "picviewImgProduct2", factoryName: "체어 팩토리", description: "딱딱해 보이지만 생각보다 편안한 의자", price: 26000)
//        let detail3 = RoomDetail(imageName: "picviewImgProduct3", factoryName: "체어 팩토리", description: "딱딱해 보이지만 생각보다 편안한 의자", price: 26000)
//        roomDetailList = [detail1, detail2, detail3]
    }
    

}

extension PicViewTableViewCell: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return roomDetailList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)->UICollectionViewCell {
        guard let roomDetailCell = collectionView.dequeueReusableCell(withReuseIdentifier: RoomDetailCell.identifier, for: indexPath) as? RoomDetailCell else { return UICollectionViewCell() }
        
        roomDetailCell.set(roomDetail: roomDetailList[indexPath.row])
        return roomDetailCell
    }
}
extension PicViewTableViewCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt
        indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 90)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: -10, left: -10, bottom: 0, right: 0) }

    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
    }
}
