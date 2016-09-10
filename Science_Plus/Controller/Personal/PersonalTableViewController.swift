//
//  PersonalTableViewController.swift
//  Science_Plus
//
//  Created by Qiang Chen on 16/5/7.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import UIKit

class PersonalTableViewController: UITableViewController {
    
    @IBOutlet var nameL: UILabel!
    @IBOutlet var introduction:UILabel!
    @IBOutlet var thumbnailImageView: UIImageView!
    @IBOutlet weak var upNumber: UILabel!
    @IBOutlet weak var fansNumber: UILabel!
    @IBOutlet weak var focusNumber: UILabel!
    
    private var model=PersonShowModel()
    
    private struct storyboard{
        static let showFocus="showFocus"
        static let showFans="showFans"
        static let showArea="showArea"
        static let showUp="showUp"
        static let showFocusQuestion="showFocusQuestion"
        static let showQuery="showQuery"
        static let showAnswerQuestion="showAnswerQuestion"
        static let showPersonDetail="showPersonDetail"
        static var user_id=3
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model.getPersonInfo(storyboard.user_id,controller: self)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        model.getPersonInfo(storyboard.user_id,controller: self)
        if let parent = self.parentViewController as? UINavigationController{
            if let main = parent.parentViewController as? UITabBarController{
                main.tabBar.hidden = false
            }
        }
    }
    
    static func setUserId(id:Int){
        storyboard.user_id=id
    }
    
    func showPersonInfo(person:Person){
        nameL.text=person.name
        introduction.text=person.introduction
        upNumber.text=String(person.numberOfUp)
        focusNumber.text=String(person.numberOfFocus)
        fansNumber.text=String(person.numberOfFans)
        print("image url is \(person.img_url)")
        thumbnailImageView.imageFromUrl(person.img_url)
    }
   

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //        navigationItem.backBarButtonItem=UIBarButtonItem(title: "", style:
        //            .Plain, target: nil, action: nil)
        
        if let identifier = segue.identifier{
            switch identifier {
            case storyboard.showUp:
                if let showFocusViewController = segue.destinationViewController as? FocusTableViewController{
                    showFocusViewController.title="赞我的人"
                }
            case storyboard.showFocus:
                if let showFocusViewController = segue.destinationViewController as? FocusTableViewController{
                    showFocusViewController.title="我关注的人"
                }
            case storyboard.showFans:
                if let showFocusViewController = segue.destinationViewController as? FocusTableViewController{
                    showFocusViewController.title="关注我的人"
                }
            case storyboard.showArea:
                if let showFocusViewController = segue.destinationViewController as? FocusTableViewController{
                    showFocusViewController.title="我关注的领域"
                }
            case storyboard.showFocusQuestion:
                if let showFocusViewController = segue.destinationViewController as? FocusQuestionTableViewController{
                    showFocusViewController.title="我关注的问题"
                }
            case storyboard.showQuery:
                if let showFocusViewController = segue.destinationViewController as? FocusQuestionTableViewController{
                    showFocusViewController.title="我提出的问题"
                }
            case storyboard.showAnswerQuestion:
                if let showFocusViewController = segue.destinationViewController as? MyAnswerTableViewController{
                    showFocusViewController.title="我回答的问题"
                }
            case storyboard.showPersonDetail:
                if let parent = self.parentViewController as? UINavigationController{
                    if let main = parent.parentViewController as? UITabBarController{
                        main.tabBar.hidden = true
                    }
                }
                if let showDetailController = segue.destinationViewController as? PersonDetailTableViewController{
                    showDetailController.title=nameL.text
                    PersonDetailTableViewController.setUserId(storyboard.user_id)
                }
            default:
                break
            }
        }
    }
    

    
}
