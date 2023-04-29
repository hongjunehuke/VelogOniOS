//
//  TabBarController.swift
//  VelogOnMobile
//
//  Created by 홍준혁 on 2023/04/29.
//

import UIKit

import SnapKit
import Moya


class TabBarController: UITabBarController{
    
    fileprivate lazy var defaultTabBarHeight = { tabBar.frame.size.height }()
    
    let PostsVC = PostsTabManViewController()
    let ListVC = SubscriberListViewController()
    let notifiVC = NotificationViewController()
    let settingVC = MyPageViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        setUpTabBar()
    }
    
    func setUpTabBar(){
        self.tabBar.tintColor = .brandColor
        self.tabBar.unselectedItemTintColor = .black
        self.tabBar.isTranslucent = false
        self.tabBar.backgroundColor = .white

        PostsVC.title = "Posts"
        ListVC.title = "Lists"
        notifiVC.title = "Alerm"
        settingVC.title = "Setting"

        let ViewControllers:[UIViewController] = [PostsVC,ListVC,notifiVC,settingVC]
        self.setViewControllers(ViewControllers, animated: true)

        PostsVC.tabBarItem.image = UIImage(systemName: "books.vertical")
        ListVC.tabBarItem.image = UIImage(systemName: "folder")
        notifiVC.tabBarItem.image = UIImage(systemName: "megaphone")
        settingVC.tabBarItem.image = UIImage(systemName: "gear")
        
        self.hidesBottomBarWhenPushed = false
        viewWillLayoutSubviews()
    }
}

