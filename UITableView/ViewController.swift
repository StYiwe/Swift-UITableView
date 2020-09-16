//
//  ViewController.swift
//  UITableView
//
//  Created by StYiWe on 2020/9/14.
//  Copyright © 2020 stYiwe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK: - 使用系统cell的基本使用
    @IBAction func btn1Action(_ sender: Any) {
        let vc = TableView1.init()
        self.navigationController?.pushViewController(vc, animated: false)
        
    }
    
    //MARK: - 带索引的tableView
    @IBAction func btn2Action(_ sender: Any) {
        let vc = TableView2.init()
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    //MARK: - 与UISearchBar一起使用
    @IBAction func btn3Action(_ sender: Any) {
        let vc = TableView3.init()
        self.navigationController?.pushViewController(vc, animated: false)
    }
}

