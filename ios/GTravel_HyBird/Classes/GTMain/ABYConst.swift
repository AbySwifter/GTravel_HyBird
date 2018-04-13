//
//  ABYConst.swift
//  AbysSwift
//
//  Created by aby on 2018/2/2.
//  Copyright © 2018年 Aby.wang. All rights reserved.
//

import UIKit
import Foundation

let SystemVersion: String = UIDevice.current.systemName + " " + UIDevice.current.systemVersion
// 计算比例的函数
func W750(_ number: CGFloat) -> CGFloat {
	let standWidth: CGFloat = 750.0
	return (number / standWidth) * UIScreen.main.bounds.size.width
}

// 主题色
func ABYGlobalThemeColor() ->  UIColor {
	return UIColor.init(hexString: "0084bf")
}

// 主题背景色
func ABYGlobalBackGroundColor() -> UIColor {
	return UIColor.init(hexString: "f5f5f5")
}

// boder色
func ABYGlobalBorderColor() -> UIColor {
	return UIColor.init(hexString: "e9e9e9")
}

// 生成随机字符串
func newGUID(length: Int = 30) -> String {
	let characters = "0123456789abcdef"
	var ranStr = ""
	for _ in 0..<length {
		let index = Int(arc4random_uniform(16))
		ranStr.append(characters[characters.index(characters.startIndex, offsetBy: index)])
	}
	return ranStr
}


/// 自定义的log打印
///
/// - Parameters:
///   - message: 打印的消息
///   - fileName: 打印的当前文件名称
///   - methodName: 打印的方法名
///   - lineNumber: 当前行数
func ABYPrint<N>(_ message: N, fileName: String = #file, methodName: String = #function, lineNumber: Int = #line){
	#if DEBUGSWIFT
		let file = (fileName as NSString).lastPathComponent.replacingOccurrences(of: ".Swift", with: "")
	print("\(file):\(lineNumber)行。\n\(methodName)中的打印信息:\n\(message)");
	#endif
}
