//
//  ABYTabBarComtroller.swift
//  公共的、可抽象的TabBarCotroller
//
//  Created by aby on 2018/2/1.
//  Copyright © 2018年 Aby.wang. All rights reserved.
//

import UIKit

class ABYTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
		let tabBar = UITabBar.appearance()
		tabBar.barTintColor = UIColor.white
		tabBar.tintColor = ABYGlobalThemeColor()
		// 调用添加子控制器的方法
		addChildViewControllers()
//		NotificationCenter.default.addObserver(self, selector: #selector(observerAction(notification:)), name: Account.share.logoutName, object: nil)
    }
	// 在视图即将出现的时候弹出登录页面（每次视图出现都会走这个方法）
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		presentLoginVC()
	}
	deinit {
		NotificationCenter.default.removeObserver(self)
	}
	@objc
	func observerAction(notification: Notification) -> Void {
		presentLoginVC(true)
	}
	@objc
	func presentLoginVC(_ animated: Bool = false) -> Void {
//		if (!Account.share.isLogin) {
//			present(LoginViewController(), animated:animated) {}
//		}
	}
	/// 添加子控制器
	func addChildViewControllers() -> Void {
		addChildViewController(childController: MainViewController(), title: "首页", icon: #imageLiteral(resourceName: "tab_form"), selectedIcon: #imageLiteral(resourceName: "tab_form_selected"))

		addChildViewController(childController: ViewController(), title: "目的地", icon: #imageLiteral(resourceName: "tab_form"), selectedIcon: #imageLiteral(resourceName: "tab_form_selected"))
		addChildViewController(childController: MineViewController(), title: "我的", icon: #imageLiteral(resourceName: "tab_form"), selectedIcon: #imageLiteral(resourceName: "tab_form_selected"))
	}
	/**
	# 初始化子控制器

	- parameter VCConfig: 初始化的子控制器配置
	*/
	private func addChildViewController(childController: UIViewController, title: String, icon:UIImage, selectedIcon: UIImage ) {
		childController.tabBarItem.image = icon
		childController.tabBarItem.selectedImage = selectedIcon
		childController.title = title
		let navC = ABYNavigationController(rootViewController: childController)
		addChildViewController(navC)
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
