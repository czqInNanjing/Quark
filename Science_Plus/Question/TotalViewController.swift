//
//  ViewController.swift
//  Science_Plus
//
//  Created by Mac on 16/5/7.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import UIKit

class TotalViewController: UIViewController {
    
    var pageViewController: UIPageViewController!
    @IBOutlet var sliderView: UIView!
    @IBOutlet var addQuestionButton: UIButton!
    var questionController: QuestionViewController!
    var answerController: QuestionNeedAnswerViewController!
    var controllers = [UIViewController]()
    
    
    private struct myStoryboard {
        
        static let questionDetail =  "showQuestionDetail"
        static let addQuestion = "addQuestion"
        
        static let questionViewControllerID = "QuestionViewController"
        static let answerViewControllerID = "AnswerViewController"
        static let sliderImageName = "slider"
        
        static let questionButtonName = "提问"
        static let answerButtonName = "回答"
        
    }
    
    var sliderImageView: UIImageView!
    
    var lastPage = 0
    var currentPage: Int = 0 {
        didSet {
            print("current page \(currentPage)")
            //根据当前页面计算得到偏移量
            //一个微小的动画移动提示条
            let offset = self.view.frame.width / 3.0 * CGFloat(currentPage)
            UIView.animateWithDuration(0.3) { () -> Void in
                self.sliderImageView.frame.origin = CGPoint(x: offset, y: -1)
            }
            
            //根据currentPage 和 lastPage的大小关系，控制页面的切换方向
            if currentPage > lastPage {
                self.pageViewController.setViewControllers([controllers[currentPage]], direction: .Forward, animated: true, completion: nil)
            }
            else {
                self.pageViewController.setViewControllers([controllers[currentPage]], direction: .Reverse, animated: true, completion: nil)
            }
            
            lastPage = currentPage
        }
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeController()
    }
    
    
    func initializeController() {
        //获取到嵌入的UIPageViewController
        pageViewController = self.childViewControllers.first as! UIPageViewController
        
        //根据Storyboard ID来创建一个View Controller
        questionController = storyboard?.instantiateViewControllerWithIdentifier(myStoryboard.questionViewControllerID) as! QuestionViewController
        answerController = storyboard?.instantiateViewControllerWithIdentifier(myStoryboard.answerViewControllerID) as! QuestionNeedAnswerViewController
        
        //设置pageViewController的数据源、代理为当前Controller
        pageViewController.dataSource = self
        pageViewController.delegate = self
        
        //手动为pageViewController提供提一个页面
        pageViewController.setViewControllers([questionController], direction: .Forward, animated: true, completion: nil)
        
        //添加提示条到页面中
        sliderImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width / 3.0, height: 5.0))
        sliderImageView.image = UIImage(named: myStoryboard.sliderImageName)
        sliderView.addSubview(sliderImageView)
        
        //把页面添加到数组中
        controllers.append(questionController)
        controllers.append(answerController)
        
        
    }
    
    @IBAction func changeCurrentPage(sender: UIButton) {
        if sender.currentTitle == myStoryboard.answerButtonName {
            currentPage = 1
        } else{
            currentPage = 0
        }
    }
    
    
    
    override func viewWillAppear(animated: Bool) {
        if let parent = self.parentViewController as? UINavigationController{
            if let main = parent.parentViewController as? UITabBarController{
                main.tabBar.hidden = false
            }
        }
    }
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == myStoryboard.questionDetail {
            
            if let parent = self.parentViewController as? UINavigationController{
                if let main = parent.parentViewController as? UITabBarController{
                    main.tabBar.hidden = true
                }
            }
            if let question = sender as? Question {
                
                if let questionDetailController = segue.destinationViewController as? QAnswerViewController {
                    questionDetailController.question = question
                }
            }
            
            
        }
        
        if segue.identifier == myStoryboard.addQuestion{
            if let parent = self.parentViewController as? UINavigationController{
                if let main = parent.parentViewController as? UITabBarController{
                    main.tabBar.hidden = true
                }
            }
        }
    }
    
}

extension TotalViewController : UIPageViewControllerDataSource, UIPageViewControllerDelegate{
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        if viewController.isKindOfClass(QuestionViewController){
//            print("question View")
            return answerController
        }
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {

        if viewController.isKindOfClass(QuestionNeedAnswerViewController) {
//            print("answer View")
            return questionController
        }
        
        return nil
    }
    /** Will change the slide view when the page did change*/
    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            if previousViewControllers[0].isKindOfClass(QuestionViewController){
                currentPage = 1
            }else{
                currentPage = 0
            }
        }
    }
    
//    func pageViewController(pageViewController: UIPageViewController, spineLocationForInterfaceOrientation orientation: UIInterfaceOrientation) -> UIPageViewControllerSpineLocation {
//        //TODO
//    }
}
