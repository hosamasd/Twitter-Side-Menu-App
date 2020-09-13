//
//  MenuBarCollectionViewCell.swift
//  Twitter Side Menu App
//
//  Created by Hossam on 9/13/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit

class MenuBarCollectionViewCell: BaseCollectionCell {
    
    
    
    var  data = [
        SideMenuData(type: "withImage", img: "user", label: "Profile"),
        SideMenuData(type: "withImage", img: "lists", label: "Lists"),
        SideMenuData(type: "withImage", img: "save", label: "Bookmarks"),
        SideMenuData(type: "withImage", img: "moments", label: "Moments"),
        SideMenuData(type: "withoutImage", img: nil, label: "Settings and privacy"),
        SideMenuData(type: "withoutImage", img: nil, label: "Help Center")
    ]
    
    lazy var tableView:UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(MenuTableViewCell.self, forCellReuseIdentifier: "MenuTableViewCell")
        tv.register(MenuSimpleTableViewCell.self, forCellReuseIdentifier: "MenuSimpleTableViewCell")
        tv.tableFooterView = UIView()
        tv.delegate = self
        tv.dataSource = self
        tv.separatorColor = CustomColors.appExtraLightGray
        return tv
    }()
    
    lazy var headerView:CustomMenuHeaderView = {
        let v = CustomMenuHeaderView()
        v.delegate = self
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        
        return v
    }()
    
    lazy var bottomView:CustomMenuBottomView = {
        let v = CustomMenuBottomView()
        v.delegate = self
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        return v
    }()
    
    let dividerView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = CustomColors.appExtraLightGray
        return v
    }()
    
    override func setupViews() {
        
        addSubview(headerView)
        addSubview(bottomView)
        addSubview(tableView)
        addSubview(dividerView)
        
        
        
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 190),
            
            bottomView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 70),
            
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomView.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            dividerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            dividerView.topAnchor.constraint(equalTo: topAnchor),
            dividerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            dividerView.widthAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y
        print(y)
        
        if y >= 12.0 {
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.8, options: .curveEaseInOut, animations: {
                self.headerView.dividerView.alpha = 1
            }, completion: nil)
        } else {
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.8, options: .curveEaseInOut, animations: {
                self.headerView.dividerView.alpha = 0
            }, completion: nil)
        }
        
        if y < -160.5 {
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.8, options: .curveEaseInOut, animations: {
                self.bottomView.dividerView.alpha = 1
            }, completion: nil)
        } else {
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.8, options: .curveEaseInOut, animations: {
                self.bottomView.dividerView.alpha = 0
            }, completion: nil)
        }
    }
    
}

extension MenuBarCollectionViewCell:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if data[indexPath.row].type == "withImage" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
            cell.data = data[indexPath.row]
            cell.selectionStyle = .none
            if indexPath.row == 3 {
                cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            } else {
                cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: tableView.frame.width)
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MenuSimpleTableViewCell", for: indexPath) as! MenuSimpleTableViewCell
            cell.data = data[indexPath.row]
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: tableView.frame.width)
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}


