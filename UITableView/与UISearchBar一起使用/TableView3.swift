//
//  TableView3.swift
//  UITableView
//
//  Created by StYiWe on 2020/9/15.
//  Copyright © 2020 stYiwe. All rights reserved.
//

import UIKit

class TableView3: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    //searchBar
    var searchBar : UISearchBar!
    
    //tableView
    var tableView : UITableView!
    
    //数据
    var dataList = ["🐰", "秃子", "鹰酱", "毛熊", "Cat", "棒子", "脚盆鸡", "高卢鸡", "狗大户", "🐫", "沙某", "河马", "Big Dog", "Apple"]
    
    //搜索数据
    var searchDataList: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "与UISearchBar一起使用"
        self.view.backgroundColor = .white
        
        //搜索数据默认加载全部
        searchDataList = dataList
        
        //UI
        creatUI()
        
    }
    
    func creatUI() {
        //tableView
        tableView = UITableView.init(frame: UIScreen.main.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        //注册cell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        self.view.addSubview(tableView)
        
        //searchBar
        searchBar = UISearchBar.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 60))
        //显示取消按钮
        searchBar.showsCancelButton = true
        searchBar.delegate = self
        tableView.tableHeaderView = searchBar
        
    }
    
    //MARK: - 取消搜索
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
        searchBar.text = ""
        searchDataList = dataList
        tableView.reloadData()
    }
    
    //MARK: - 搜索代理，每次改变搜索内容都会调用
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("搜索内容:\(searchText)")
        //没有搜索内容时显示全部数据
        if searchText == "" {
            searchDataList = dataList
        } else {
            //获取搜索栏文字，筛选后更新列表
            let text = searchText.trimmingCharacters(in: .whitespaces)
            //获取符合的数据
            searchFilter(text: text)
        }
        
        tableView.reloadData()
    }
    
    //MARK: - 添加一个筛选器方法:使用Swift数组系统filter方法,返回一个符合条件的新数组
    func searchFilter(text: String) {
        searchDataList = dataList.filter({ (str) -> Bool in
            return str.localizedCaseInsensitiveContains(text)
        })
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        
        cell.textLabel?.text = searchDataList[indexPath.row]
        
        return cell
    }

}
