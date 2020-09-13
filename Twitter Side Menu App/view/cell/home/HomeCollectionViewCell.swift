//
//  HomeCollectionViewCell.swift
//  Twitter Side Menu App
//
//  Created by Hossam on 9/13/20.
//  Copyright © 2020 Hossam. All rights reserved.
//
import UIKit

struct UserTwit {
    let name:String!
    let userName:String!
    let userImage:String!
    let time:String!
    let tweet:String!
    let like:String!
    let retweet:String!
    let comment:String!
}

class HomeCollectionViewCell: BaseCollectionCell {
    
    var data = [
        UserTwit(name: "Storm Front", userName: "_strom_", userImage: "img1", time: "3h", tweet: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy.", like: "34", retweet: "12", comment: "21"),
        UserTwit(name: "Homelander", userName: "a**h***", userImage: "img2", time: "2d", tweet: "Hello fellow citizens! I'm inevitable.", like: "34k", retweet: "1k", comment: "11K"),
        UserTwit(name: "Starlight", userName: "star_l", userImage: "img3", time: "3d", tweet: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy.", like: "12K", retweet: "1k", comment: "6k"),
        UserTwit(name: "Billy Butcher", userName: "billy_silly", userImage: "img4", time: "4d", tweet: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy.", like: "45k", retweet: "8k", comment: "25k")
    ]
    var delegate:SideMenuToggle?
    
    lazy var tableView:UITableView = {
        let tv = UITableView()
        tv.tableFooterView = UIView()
        tv.separatorColor = CustomColors.appExtraLightGray
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(HomeFeedTableViewCell.self, forCellReuseIdentifier: "HomeFeedTableViewCell")
        tv.delegate = self
        tv.dataSource = self
        return tv
    }()
    
    lazy var overlayView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor(red: 225/255, green: 232/255, blue: 237/255, alpha: 0.5)
        v.isHidden = true
        return v
    }()
    
    lazy var headerView:CustomNavHeaderView = {
        let v = CustomNavHeaderView()
        v.delegate = self
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        return v
    }()
    
    override func setupViews() {
        
        
        addSubview(headerView)
        addSubview(tableView)
        addSubview(overlayView)
        overlayView.fillSuperview()
        setUpConstraints()
        
        
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: topAnchor),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 90),
            
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    @objc func didImageTapped(){
        delegate?.sideMenu()
    }
    
   
}

extension HomeCollectionViewCell:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeFeedTableViewCell", for: indexPath) as! HomeFeedTableViewCell
        cell.backgroundColor = .white
        cell.data = data[indexPath.row]
        cell.selectionStyle = .none
        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let width = tableView.frame.width - 110
        let font = UIFont(name: "HelveticaNeue", size: 17)!
        let estimatedH = data[indexPath.row].tweet.height(withWidth: width, font: font)
        return estimatedH + 100
    }
    
}
