//
//  ViewController.swift
//  GTravel_HyBird
//
//  Created by aby on 2018/4/10.
//  Copyright © 2018年 Aby.wang. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
	let label: UILabel = UILabel.init()
	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = UIColor.white
		// Do any additional setup after loading the view, typically from a nib.
		creatNativeView()
		label.font = UIFont.systemFont(ofSize: 20)
		label.textColor = UIColor.init(hexString: "333333")
		label.text = "我就是一个地地道道的原生界面"
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	func creatNativeView() -> Void {
		view.addSubview(label)
		label.snp.makeConstraints { (make) in
			make.center.equalToSuperview()
		}
	}
}

