//
//  ABYBaseViewController.swift
//  AbysSwift
//	在这个基础的类里设置Toast的样式，全局的网络监听。
//  Created by aby on 2018/2/12.
//  Copyright © 2018年 Aby.wang. All rights reserved.
//

import UIKit
//import Alamofire

class ABYBaseViewController: UIViewController {
//	let manager = NetworkReachabilityManager.init() // 网路检测
    override func viewDidLoad() {
        super.viewDidLoad()
//		manager?.listener = { (status) in
//			switch status {
//			case .reachable(.ethernetOrWiFi):
//				print("wifi")
//			case .notReachable:
//				print("notReachable")
//			case .unknown:
//				print("未知网络")
//			default:
//				print("这是啥?")
//			}
//		}
//		manager?.startListening()
    }
	deinit {
//		manager?.stopListening()
	}
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

	}
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		
	}

	/// 设置当前VC的导航栏透明
	func setNavigationBarType() -> Void {
		self.navigationController?.navigationBar.isTranslucent = true
		let color = UIColor.clear
		let rect = CGRect.init(x: 0, y: 0, width: self.view.bounds.size.width, height: 64)
		UIGraphicsBeginImageContext(rect.size)
		let context = UIGraphicsGetCurrentContext()
		context?.setFillColor(color.cgColor)
		context?.fill(rect)
		let image = UIGraphicsGetImageFromCurrentImageContext()
		self.navigationController?.navigationBar.setBackgroundImage(image, for: .any, barMetrics: .default)
		self.navigationController?.navigationBar.clipsToBounds = true
	}

	func setWhiteNavigationBar() -> Void {
		guard let navBar = self.navigationController?.navigationBar else {
			return
		}
		navBar.isTranslucent = false
		navBar.barTintColor = UIColor.white
		navBar.tintColor = UIColor.black
		navBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.black, NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18.0)]
	}

	func setThemeNavigationBar() -> Void {
		guard let navBar = self.navigationController?.navigationBar else {
			return
		}
		navBar.isTranslucent = false
		navBar.barTintColor = ABYGlobalThemeColor()
		navBar.tintColor = UIColor.white
		navBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18.0)]
	}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
