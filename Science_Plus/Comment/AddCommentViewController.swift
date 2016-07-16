//
//  AddCommentViewController.swift
//  Science_Plus
//
//  Created by Mac on 16/5/27.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import UIKit

class AddCommentViewController: UIViewController {
    private var answer_id=0
    private var comment_content=""
    
    private var commentAddedModel=CommentAddedModel()
    
    @IBOutlet var textView:UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setAnswerId(id:Int){
        print("set id",id)
        answer_id=id
    }
    
    
    @IBAction func addComment(){
        comment_content=textView.text
        commentAddedModel.addComment(answer_id, content: comment_content)
        self.navigationController?.popViewControllerAnimated(false)
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
