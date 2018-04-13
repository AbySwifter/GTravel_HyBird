//
//  UIColor+Extension.swift
//  AbysSwift
//
//  Created by aby on 2018/2/2.
//  Copyright © 2018年 Aby.wang. All rights reserved.
//

import UIKit


extension UIColor {
	convenience init(hexString: String, alpha: CGFloat? = 1.0) {
		let scanner:Scanner = Scanner(string:hexString)
		var valueRGB:UInt32 = 0
		if scanner.scanHexInt32(&valueRGB) == false {
			self.init(red: 0,green: 0,blue: 0,alpha: 0)
		}else{
			self.init(
				red:CGFloat((valueRGB & 0xFF0000)>>16)/255.0,
				green:CGFloat((valueRGB & 0x00FF00)>>8)/255.0,
				blue:CGFloat(valueRGB & 0x0000FF)/255.0,
				alpha:CGFloat(alpha!)
			)
		}
	}
}
