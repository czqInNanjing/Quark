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
    
    @IBOutlet var indicator: UIView!
 
    @IBOutlet var panGesture: UIPanGestureRecognizer!
//
    fileprivate func testAction(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .began:
            print("Start . . .")
        case .cancelled:
            print("cancel. . .")
        case .ended:
            print("ended")
        case .changed:
            print("change")
        default:
            print("nothing")
        }

    }
//
    
    
    
    
    fileprivate struct myStoryboard {
        
        static let questionDetail =  "showQuestionDetail"
        static let addQuestion = "addQuestion"
        
        static let questionViewControllerID = "QuestionViewController"
        static let answerViewControllerID = "AnswerViewController"
        static let sliderImageName = "slider"
        
        static let questionButtonName = "提问"
        static let answerButtonName = "回答"
        
    }
    
//    var sliderImageView: UIView!
    
    var lastPage = 0
    var currentPage: Int = 0 {
        didSet {
            print("current page \(currentPage)")
            //根据当前页面计算得到偏移量
            //一个微小的动画移动提示条
            let offset = self.sliderView.frame.width / 2.0 * CGFloat(currentPage)
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                self.indicator.frame.origin = CGPoint(x: offset, y: -1)
            }) 
            
            //根据currentPage 和 lastPage的大小关系，控制页面的切换方向
            if currentPage > lastPage {
                self.pageViewController.setViewControllers([controllers[currentPage]], direction: .forward, animated: true, completion: nil)
            }
            else {
                self.pageViewController.setViewControllers([controllers[currentPage]], direction: .reverse, animated: true, completion: nil)
            }
            
            lastPage = currentPage
        }
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeController()
        panGesture.delegate = self
//        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(TotalViewController.pan(_:)))
//        panGestureRecognizer.delegate = self
//        view.userInteractionEnabled = true
//        view.addGestureRecognizer(panGestureRecognizer)
        
    }
    
    
    func initializeController() {
        //获取到嵌入的UIPageViewController
        pageViewController = self.childViewControllers.first as! UIPageViewController
        
        //根据Storyboard ID来创建一个View Controller
        questionController = storyboard?.instantiateViewController(withIdentifier: myStoryboard.questionViewControllerID) as! QuestionViewController
        answerController = storyboard?.instantiateViewController(withIdentifier: myStoryboard.answerViewControllerID) as! QuestionNeedAnswerViewController
        
        //设置pageViewController的数据源、代理为当前Controller
        pageViewController.dataSource = self
        pageViewController.delegate = self
        
        //手动为pageViewController提供提一个页面
        pageViewController.setViewControllers([questionController], direction: .forward, animated: true, completion: nil)
        
        //把页面添加到数组中
        controllers.append(questionController)
        controllers.append(answerController)
        
        
    }
    
    @IBAction func changeCurrentPage(_ sender: UIButton) {
        if sender.currentTitle == myStoryboard.answerButtonName {
            currentPage = 1
        } else{
            currentPage = 0
        }
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        if let parent = self.parent as? UINavigationController{
            if let main = parent.parent as? UITabBarController{
                main.tabBar.isHidden = false
            }
        }
        navigationController?.navigationBar.isHidden=false
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == myStoryboard.questionDetail {
            
            if let parent = self.parent as? UINavigationController{
                if let main = parent.parent as? UITabBarController{
                    main.tabBar.isHidden = true
                }
            }
            if let question = sender as? Question {
                
                if let questionDetailController = segue.destination as? QAnswerViewController {
                    questionDetailController.question = question
                }
            }
            
            
        }
        
        if segue.identifier == myStoryboard.addQuestion{
            if let parent = self.parent as? UINavigationController{
                if let main = parent.parent as? UITabBarController{
                    main.tabBar.isHidden = true
                }
            }
        }
    }
    
//    @objc private func pan(gestureRecognizer: UIPanGestureRecognizer!) {
////        guard !panningDisabled else {
////            return
////        }
////        
////        switch gestureRecognizer.state {
////        case .Began:
////            initialIndicatorViewFrame = indicatorView.frame
////        case .Changed:
////            var frame = initialIndicatorViewFrame!
////            frame.origin.x += gestureRecognizer.translationInView(self).x
////            frame.origin.x = max(min(frame.origin.x, bounds.width - indicatorViewInset - frame.width), indicatorViewInset)
////            indicatorView.frame = frame
////        case .Ended, .Failed, .Cancelled:
////            try! setIndex(nearestIndexToPoint(indicatorView.center))
////        default: break
////        }
//    }
}

extension TotalViewController : UIPageViewControllerDataSource, UIPageViewControllerDelegate{
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if viewController.isKind(of: QuestionViewController.self){
//            print("question View")
            return answerController
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

        if viewController.isKind(of: QuestionNeedAnswerViewController.self) {
//            print("answer View")
            return questionController
        }
        
        return nil
    }
    /** Will change the slide view when the page did change*/
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            if previousViewControllers[0].isKind(of: QuestionViewController.self){
                currentPage = 1
            }else{
                currentPage = 0
            }
        }
    }
    
        
    
}
extension TotalViewController: UIGestureRecognizerDelegate{
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        print("Judging")
        if gestureRecognizer is UIPanGestureRecognizer {
            testAction(gestureRecognizer as! UIPanGestureRecognizer)
        }
        return true
    }
}
