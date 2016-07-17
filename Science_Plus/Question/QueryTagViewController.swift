//
//  QueryTagViewController.swift
//  Science_Plus
//
//  Created by Mac on 16/5/25.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import UIKit

class QueryTagViewController: UIViewController {
    var question_title=""
    var question_content=""
    var question_tag=[String]()
    
    @IBOutlet var tagText:UITextView!
    
    private var questionAddedModel = QuestionAddedModel()
    
    private struct showMessage{
        static let addSuccess="问题添加成功！"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("QueryTagViewController")
        print(question_title)
        print(question_content)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func saveQuestion(){
        question_tag=tagText.text.componentsSeparatedByString("，")
        questionAddedModel.addQuestion(question_title, content: question_content, tag: question_tag)
        self.navigationController?.popToRootViewControllerAnimated(false)
        let alertController = UIAlertController(title: showMessage.addSuccess, message: "", preferredStyle: UIAlertControllerStyle.Alert)
        let delay = 2.0 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            alertController.dismissViewControllerAnimated(true, completion: nil)
        })
        self.presentViewController(alertController, animated: true, completion:nil)
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
