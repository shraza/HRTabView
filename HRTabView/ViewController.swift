//
//  ViewController.swift
//  HRTabView
//
//  Created by MacBook Pro on 08/02/2016.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,PagerViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let pager = PagerView(frame: CGRect(x: 0, y: 100, width: view.frame.size.width, height: 70), tabs: ["tab 1","tab 2","tab 3","tab 4"])
        pager.delegate = self
        self.view.addSubview(pager)
    }
    
    func didTapAtIndex(index: Int) {
        print("tap: \(index)")
    }
    
    func didScrollToIndex(index: Int) {
        print("scroll: \(index)")
    }
}

