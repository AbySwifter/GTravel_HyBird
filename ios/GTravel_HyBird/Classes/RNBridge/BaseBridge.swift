//
//  BaseBridge.swift
//  GTravel_HyBird
//
//  Created by aby on 2018/4/10.
//  Copyright © 2018年 Aby.wang. All rights reserved.
//

import UIKit

@objc(BaseBridge)
class BaseBridge: NSObject {
	@objc func addEvent(_ name: String, location: String, date: NSNumber, resolver: (NSObject) -> (), rejecter: (NSString, NSString, NSError) -> () ) -> Void {
		// Date is ready to use!
		ABYPrint("\(Thread.current)")
		let result = ["good"] as NSArray
		resolver(result)
	}

	@objc func changeTab(_ hidden: Bool) -> Void {
		NotificationCenter.default.post(name: Notification.Name.init("ChangeUI"), object: nil, userInfo: ["status": hidden])
	}
}
