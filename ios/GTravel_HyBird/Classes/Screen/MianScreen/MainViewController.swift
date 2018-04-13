//
//  MainViewController.swift
//  GTravel_HyBird
//
//  Created by aby on 2018/4/10.
//  Copyright © 2018年 Aby.wang. All rights reserved.
//

import UIKit
import React

class MainViewController: ABYBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		self.navigationController?.navigationBar.isHidden = true
		createReactNativeView()
		NotificationCenter.default.addObserver(self, selector: #selector(changeUI(notification:)), name: NSNotification.Name.init("ChangeUI"), object: nil)
        // Do any additional setup after loading the view.
    }

	@objc
	func changeUI(notification: Notification) -> Void {
		if let info = notification.userInfo {
			let isHidden = info["status"] as! Bool
			self.tabBarController?.tabBar.isHidden = isHidden
		}
	}

	deinit {
		NotificationCenter.default.removeObserver(self)
	}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	func createReactNativeView() {
		let jsCodeLocation = URL.init(string: "http://localhost:8081/index.bundle?platform=ios")
		let mockData: NSDictionary = ["routeName":"Main"
		]
		let rootView = RCTRootView(bundleURL: jsCodeLocation!, moduleName: "GTravel_HyBird", initialProperties: mockData as [NSObject: AnyObject], launchOptions: nil)
		self.view = rootView!
	}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
