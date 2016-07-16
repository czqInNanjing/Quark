//
//  ViewController.swift
//  Science_Plus
//
//  Created by Mac on 16/5/7.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import UIKit

class TotalViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet var addQuestionButton: UIButton!
    
    
    @IBAction func indexChanged(sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            firstView.hidden = false
            secondView.hidden = true
        case 1:
            firstView.hidden = true
            secondView.hidden = false
        default:
            break;
        }
    }

    private struct storyboard {
        
        static let questionDetailForList =  "showQuestionDetailForAsk"
        static let questionDetailForAnswer =  "showQuestionDetailForAnswer"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        firstView.hidden = false
        secondView.hidden = true
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action:#selector(TotalViewController.handleSwipes(_:)))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(TotalViewController.handleSwipes(_:)))
        
        leftSwipe.direction = .Left
        rightSwipe.direction = .Right
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)

        // Do any additional setup after loading the view.
    }
    
    func handleSwipes(sender:UISwipeGestureRecognizer) {
        if (sender.direction == .Left) {
            firstView.hidden=true
            secondView.hidden = false
            segmentedControl.selectedSegmentIndex=1
        }
        
        if (sender.direction == .Right) {
            firstView.hidden = false
            secondView.hidden = true
            segmentedControl.selectedSegmentIndex=0
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let parent = self.parentViewController as? UINavigationController{
            if let main = parent.parentViewController as? UITabBarController{
                main.hidesBottomBarWhenPushed = true
            }
        }
        if segue.identifier == storyboard.questionDetailForList {
            if let question = sender as? Question {
                
                if let questionDetailController = segue.destinationViewController as? QAnswerViewController {
                    questionDetailController.title="6月6日创建"//未实现
                    questionDetailController.question = question
                }
            }
        } else if segue.identifier == storyboard.questionDetailForAnswer{
            
        }
    }

}
