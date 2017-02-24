//
//  QueryViewController.swift
//  Science_Plus
//
//  Created by Mac on 16/5/17.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import UIKit

class QueryViewController: UIViewController {
    @IBOutlet var titleText:UITextView!
    
    fileprivate struct storyboard {
        static let questionDetail =  "showQueryDetail"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title="一句话概括你的问题"
        print("QueryViewController")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == storyboard.questionDetail {
            if let queryDetialViewController = segue.destination as?
                QueryDetialViewController{
                queryDetialViewController.question_title=titleText.text
            }
            
        }
    }
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
