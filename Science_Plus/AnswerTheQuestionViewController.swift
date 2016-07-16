//
//  AnswerTheQuestionViewController.swift
//  Science_Plus
//
//  Created by Mac on 16/5/27.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import UIKit

class AnswerTheQuestionViewController: UIViewController {
    private var question_id=0
    private var answer_content=""
    private var answerAddedModel=AnswerAddedModel()
    
    @IBOutlet var textView:UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setQuestionId(id:Int){
        question_id=id
//        print(question_id)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        answer_content=textView.text
        answerAddedModel.addAnswer(question_id, content: answer_content)
    }
    
    @IBAction func saveAnswer(){
        answer_content=textView.text
        answerAddedModel.addAnswer(question_id, content: answer_content)
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
