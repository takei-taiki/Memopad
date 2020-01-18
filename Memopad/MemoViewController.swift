//
//  MemoViewController.swift
//  Memopad
//
//  Created by 武井　太紀 on 2019/10/22.
//  Copyright © 2019 武井　太紀. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextView: UITextView!
    
    let saveData: UserDefaults = UserDefaults.standard
    
    var titleArray : [String] = []
    
    var contentArray : [String] = []
    
    var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //titleTextField.text = saveData.object(forKey: "title") as? String
        //contentTextView.text = saveData.object(forKey: "content") as? String
        titleTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if saveData.object(forKey: "title") != nil {
            
            titleArray = (saveData.object(forKey: "title")as? [String])!
            contentArray = (saveData.object(forKey: "content")as? [String])!
        }
    }
    
    @IBAction func saveMemo() {
            
            titleArray.append(titleTextField.text!)
            contentArray.append(contentTextView.text!)
            
            saveData.set(titleArray, forKey: "title")
            saveData.set(contentArray, forKey: "content")
            
        let alert: UIAlertController = UIAlertController (title: "保存",message: "メモの保存が完了しました。",
                                                          preferredStyle: .alert)
            alert .addAction(
                             UIAlertAction(
                                title: "OK",
                                style: .default,
                                handler: { action in
                                    self.navigationController?.popViewController(animated: true)
                             }
                )
            )
            present(alert, animated: true, completion: nil)
        }
        // Do any additional setup after loading the view.
   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
