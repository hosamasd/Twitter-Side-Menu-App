//
//  ViewController.swift
//  Twitter Side Menu App
//
//  Created by Hossam on 9/13/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    lazy var collectionView:UICollectionView = {
            let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
            layout.scrollDirection = .horizontal
            let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
            cv.translatesAutoresizingMaskIntoConstraints = false
            cv.showsHorizontalScrollIndicator = false
            cv.register(MenuBarCollectionViewCell.self, forCellWithReuseIdentifier: "MenuBarCollectionViewCell")
            cv.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: "HomeCollectionViewCell")
            cv.setCollectionViewLayout(layout, animated: false)
            cv.delegate = self
            cv.dataSource = self
            cv.isPagingEnabled = true
            cv.bounces = false
            return cv
        }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setupViews()
            
        }
    
    
        
        override func viewDidAppear(_ animated: Bool) {
            let index = IndexPath(row: 1, section: 0)
            collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let x = scrollView.contentOffset.x / (collectionView.frame.width - 80)
            let v = CGFloat(x)
            let index = IndexPath(row: 1, section: 0)
            if let cell = self.collectionView.cellForItem(at: index) as? HomeCollectionViewCell {
                cell.headerView.alpha = v + 0.4
                if v < 1 {
                    cell.overlayView.isHidden = false
                    cell.overlayView.alpha = ( 1 - v ) + 0.4
                } else if v == 1 {
                    cell.overlayView.isHidden = true
                }
            }
        }
    
    func setupViews()  {
        view.addSubview(collectionView)
        collectionView.fillSuperview()
    }
        
    }

    extension MainViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 2
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            if indexPath.row == 0 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuBarCollectionViewCell", for: indexPath) as! MenuBarCollectionViewCell
                cell.backgroundColor = .white
                return cell
            }
            if indexPath.row == 1 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
                cell.backgroundColor = .white
                cell.delegate = self
                return cell
            }
            return UICollectionViewCell()
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            if indexPath.row == 0 {
                return CGSize(width: collectionView.frame.width - 80, height: collectionView.frame.height)
            }
            if indexPath.row == 1 {
                return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
            }
            return CGSize()
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
        
    }

    extension MainViewController:SideMenuToggle{
        func sideMenu() {
            let index = IndexPath(row: 0, section: 0)
            self.collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
        }
    }


