//
//  MineViewController.swift
//  GTravel_HyBird
//
//  Created by aby on 2018/4/11.
//  Copyright © 2018年 Aby.wang. All rights reserved.
//

import UIKit
//import React.RCTBridge


class MineViewController: ABYBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		self.navigationController?.navigationBar.isHidden = true
		guard getbundleFromDocument() else {
			loadJSBundle()
			return
		}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	func loadJSBundle() -> Void {
		let mockData: NSDictionary = ["routeName":"Mine"]
		let jsCodeLocation = RCTBundleURLProvider.sharedSettings().jsBundleURL(forBundleRoot: "index", fallbackResource: nil)
		let rootView = RCTRootView(bundleURL: jsCodeLocation!, moduleName: "GTravel_HyBird", initialProperties: mockData as [NSObject: AnyObject], launchOptions: nil)
		self.view = rootView!
	}

	func getbundleFromDocument() -> Bool {
//		FileManager.default.
		let documents = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
		ABYPrint("路径为\(documents)")
		guard let documentPath: String = documents.first else { return false }
		let filePath = documentPath + "/main.jsbundle"
		if FileManager.default.fileExists(atPath: filePath) {
			let jsCodeLocation = URL.init(string: filePath)
			let mockData: NSDictionary = ["routeName":"Main"]
			let rootView = RCTRootView(bundleURL: jsCodeLocation!, moduleName: "GTravel_HyBird", initialProperties: mockData as [NSObject: AnyObject], launchOptions: nil)
			self.view = rootView!
			return true
		} else {
			return false
		}

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
