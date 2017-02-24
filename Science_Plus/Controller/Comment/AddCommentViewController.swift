//
//  AddCommentViewController.swift
//  Science_Plus
//
//  Created by Mac on 16/5/27.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import UIKit

class AddCommentViewController: UIViewController {
    fileprivate var answer_id=0
    fileprivate var comment_content=""
    
    fileprivate var commentAddedModel=CommentAddedModel()
    
    @IBOutlet var textView:UITextView!
    
    fileprivate struct showMessage{
        static let addSuccess="添加评论成功！"
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setAnswerId(_ id:Int){
        print("set id",id)
        answer_id=id
    }
    
    
    @IBAction func addComment(){
        comment_content=textView.text
        commentAddedModel.addComment(answer_id, content: comment_content)
        self.navigationController?.popViewController(animated: false)
        self.noticeSuccess("增加评论成功！")
        
        
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
