//
//  ViewController.swift
//  Memopad
//
//  Created by 武井　太紀 on 2019/10/22.
//  Copyright © 2019 武井　太紀. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let SaveDate: UserDefaults = UserDefaults.standard
    
    @IBOutlet var table: UITableView!
    
    var titleArray : [String] = []
    
    var contentArray : [String] = []
    
    // どのセルをタップしたかの番号が入る変数
    var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if SaveDate.object(forKey: "title") != nil {
            
            titleArray = (SaveDate.object(forKey: "title")as? [String])!
            contentArray = (SaveDate.object(forKey: "content")as? [String])!
        }
        
        table.reloadData()
    }
    

        // Do any additional setup after loading the view.

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"Cell")
        
        cell?.textLabel?.text = titleArray[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // タップしたセルの番号を入れる
        index = indexPath.row
        //画面遷移の開始
        performSegue(withIdentifier: "toMemo", sender: nil)
        
    }
    
    // 画面遷移
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //遷移の種類を判定
        if segue.identifier == "toMemo" {
            //MemoViewControllerのindexにViewControllerのindexを入れる
            let memoViewController = segue.destination as! MemoViewController
            memoViewController.index = index
        }
    }

}



