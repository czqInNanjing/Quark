//
//  QueryDetialViewController.swift
//  Science_Plus
//
//  Created by Mac on 16/5/20.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import UIKit

class QueryDetialViewController: UIViewController ,UIImagePickerControllerDelegate,UITextViewDelegate,UIToolbarDelegate,UIActionSheetDelegate,UINavigationControllerDelegate{
    
    @IBOutlet var Toolbar: UIToolbar!
    @IBOutlet var text: UITextView!
    @IBOutlet var toRight: NSLayoutConstraint!
    @IBOutlet var toolBarLayOut: NSLayoutConstraint!
    @IBOutlet var textViewBottomLayoutGuideConstraint: NSLayoutConstraint!
    
    var question_title = ""
    
    private struct storyboard {
        static let questionTag =  "showQueryTag"
    }
    
    var fontSize: CGFloat  = 24.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("QueryDetialViewController")
        print(question_title)
        textViewDidChange(text)
        setup()
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == storyboard.questionTag {
            
            if let queryTagViewController = segue.destinationViewController as? QueryTagViewController {
                queryTagViewController.question_title=question_title
                queryTagViewController.question_content=text.text
                
            }
        }
    }
    
    func setup(){
        /*
         使用UITextView的时候经常出现光标不在最下方的情况。。。(iOS8)
         解决方法：
         1、首先去除所有的Padding：
         self.text.textContainerInset = UIEdgeInsetsZero
         self.text.textContainer.lineFragmentPadding = 0
         
         2、然后在委托方法里加上一行：
         func textViewDidChange(textView: UITextView) {
         self.text.scrollRangeToVisible(self.text.selectedRange)
         }
         ps:委托方法在最下边。
         */
        self.text.textContainerInset = UIEdgeInsetsZero
        self.text.textContainer.lineFragmentPadding = 0
        
        self.text.layoutManager.allowsNonContiguousLayout = false   //用于解决改变文字属性，TextView自动滑到顶部问题
        self.Toolbar.clipsToBounds = true
        
        //        text.text = "Typing you want!"
        text.textColor = UIColor.lightGrayColor()
        
        self.text.editable = true
    }
    
    /*
     //移动Toolbar到右边
     */
    @IBAction func toright(sender: UIBarButtonItem) {
        if self.toRight.constant < 0{                               //简单判断左移还是右移
            self.Toolbar.layer.cornerRadius = 22                    //改成圆角
            self.toRight.constant += (text.bounds.width - 40)
            sender.image = UIImage(named: "fa-left")                //改变图片
        }else {
            self.Toolbar.layer.cornerRadius = 0                     //恢复原来不是圆角那样
            self.toRight.constant -= (text.bounds.width - 40)
            sender.image = UIImage(named: "fa-right")
        }
    }
    
    /*
     //隐藏键盘
     */
    @IBAction func keybordDown(sender: UIBarButtonItem) {
        self.text.resignFirstResponder()
    }
    
    /*
     //减小字体
     */
    @IBAction func down(sender: AnyObject) {
        if fontSize > 16 {
            self.fontSize = text.font!.pointSize
            self.fontSize -= 2
            self.text.typingAttributes[NSFontAttributeName] = UIFont.systemFontOfSize((CGFloat)(self.fontSize))
        }
        //        Notice.showText("减小字体", fontsize: fontSize,obliqueness: 0)//弹出提示
        
    }
    
    /*
     //增大字体
     */
    @IBAction func up(sender: AnyObject) {
        
        if fontSize < 40 {
            self.fontSize = text.font!.pointSize
            fontSize += 4
            self.text.typingAttributes[NSFontAttributeName] = UIFont.systemFontOfSize((CGFloat)(self.fontSize))
            
        }
        //        Notice.showText("增大字体", fontsize: fontSize,obliqueness: 0)//弹出提示
    }
    
    /*
     //下划线
     */
    @IBAction func underLine(sender: UIBarButtonItem) {
        _ = UIFont(name:NSUnderlineStyleAttributeName, size: fontSize)
        let typ = text.typingAttributes[NSUnderlineStyleAttributeName] as? NSNumber
        if (typ == 1) {
            self.text.typingAttributes[NSUnderlineStyleAttributeName] = 0
            //            Notice.showText("取消下划线", fontsize: fontSize, obliqueness: 0)//弹出提示
        }else {
            self.text.typingAttributes[NSUnderlineStyleAttributeName] = 1
            //            Notice.showText("下划线", fontsize: fontSize, obliqueness: 0)//弹出提示
            
        }
        
    }
    
    /*
     //粗体字
     */
    @IBAction func bold(sender: UIBarButtonItem) {
        let changedFontDescriptor = UIFont.systemFontOfSize((CGFloat)(self.fontSize))
        let typ = text.typingAttributes[NSFontAttributeName] as? UIFont
        if ( typ == changedFontDescriptor) {
            self.text.typingAttributes[NSFontAttributeName] = UIFont.boldSystemFontOfSize((CGFloat)(self.fontSize))
            //            Notice.showText("粗体", fontsize: fontSize, obliqueness: 2)
        }else {
            self.text.typingAttributes[NSFontAttributeName] = UIFont.systemFontOfSize((CGFloat)(self.fontSize))
            //            Notice.showText("取消粗体", fontsize: fontSize, obliqueness: 2)
            
        }
        
    }
    
    /*
     //斜体字
     */
    @IBAction func Obliqueness(sender: UIBarButtonItem) {
        let typ = text.typingAttributes[NSObliquenessAttributeName] as? NSNumber
        if typ == 0.5 {
            //            text.typingAttributes[NSObliquenessAttributeName] = (text.typingAttributes[NSObliquenessAttributeName] as? NSNumber) == 0.5 ? 0 : 0.5
            text.typingAttributes[NSObliquenessAttributeName] = 0
            //            Notice.showText("取消斜体", fontsize: fontSize, obliqueness: 1)
        }else {
            text.typingAttributes[NSObliquenessAttributeName] = 0.5
            //            Notice.showText("斜体", fontsize: fontSize, obliqueness: 0)
        }
        
    }
    
    
    /*
     //选取照片
     */
    @IBAction func photoSelect(sender: AnyObject) {
        
        self.text.resignFirstResponder()
        var sheet:UIActionSheet
        if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)){
            sheet = UIActionSheet(title: nil, delegate: self, cancelButtonTitle: "取消", destructiveButtonTitle: nil,otherButtonTitles: "从相册选择", "拍照")
        }else{
            sheet = UIActionSheet(title:nil, delegate: self, cancelButtonTitle: "取消", destructiveButtonTitle: nil, otherButtonTitles: "从相册选择")
        }
        sheet.showInView(self.view)
    }
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        var sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        if(buttonIndex != 0){
            if(buttonIndex==1){                                     //相册
                sourceType = UIImagePickerControllerSourceType.PhotoLibrary
                self.text.resignFirstResponder()
            }else{
                sourceType = UIImagePickerControllerSourceType.Camera
            }
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.allowsEditing = true              //true为拍照、选择完进入图片编辑模式
            imagePickerController.sourceType = sourceType
            self.presentViewController(imagePickerController, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]){
        let string:NSMutableAttributedString = NSMutableAttributedString(attributedString: self.text.attributedText)
        var img  = info[UIImagePickerControllerEditedImage] as! UIImage
        img = self.scaleImage(img)
        let textAttachment = NSTextAttachment()
        textAttachment.image = img
        let textAttachmentString = NSAttributedString(attachment: textAttachment)
        
        let countString:Int = self.text.text.characters.count as Int
        string.insertAttributedString(textAttachmentString, atIndex: countString) //可以用这个函数实现 插入到光标所在点 ps:如果你实现了希望能共享
        text.attributedText = string
        /*
         //
         */
        //string.appendAttributedString(textAttachmentString)                    //也可以直接添加都后面
        picker.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func scaleImage(image:UIImage)->UIImage{
        UIGraphicsBeginImageContext(CGSizeMake(self.view.bounds.size.width, image.size.height*(self.view.bounds.size.width/image.size.width)))
        image.drawInRect(CGRectMake(0, 0, self.view.bounds.size.width, image.size.height*(self.view.bounds.size.width/image.size.width)))
        let scaledimage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return scaledimage
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // Listen for changes to keyboard visibility so that we can adjust the text view accordingly.
        
        /*
         // 用于注册键盘通知服务
         */
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserver(self, selector: #selector(QueryDetialViewController.handleKeyboardWillShowNotification(_:)), name: UIKeyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(QueryDetialViewController.handleKeyboardWillHideNotification(_:)), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    
    /*
     //此bool 标志是为了让键盘 出现和隐藏 成对出现，否则会出现跳出两次的情况.
     */
    var bool:Bool = true
    func handleKeyboardWillShowNotification(notification: NSNotification) {
        if bool {
            keyboardWillChangeFrameWithNotification(notification, showsKeyboard: true)
            print("---show")
            bool = !bool
        }
    }
    func handleKeyboardWillHideNotification(notification: NSNotification) {
        if !bool {
            keyboardWillChangeFrameWithNotification(notification, showsKeyboard: false)
            print("---hide")
            bool = !bool
            
        }
    }
    
    func keyboardWillChangeFrameWithNotification(notification: NSNotification, showsKeyboard: Bool) {
        print("4")
        
        let userInfo = notification.userInfo!
        let animationDuration: NSTimeInterval = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        // Convert the keyboard frame from screen to view coordinates.
        let keyboardScreenBeginFrame = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).CGRectValue()
        let keyboardScreenEndFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        
        let keyboardViewBeginFrame = view.convertRect(keyboardScreenBeginFrame, fromView: view.window)
        let keyboardViewEndFrame = view.convertRect(keyboardScreenEndFrame, fromView: view.window)
        print(keyboardViewBeginFrame.origin.y)
        print(keyboardViewEndFrame.origin.y)
        let originDelta = abs((keyboardViewEndFrame.origin.y - keyboardViewBeginFrame.origin.y))
        print("the origin:\(originDelta)")
        // The text view should be adjusted, update the constant for this constraint.
        if showsKeyboard {
            textViewBottomLayoutGuideConstraint.constant += (originDelta+44)
            self.toolBarLayOut.constant += originDelta
            print(self.toolBarLayOut.constant)
        }else {
            textViewBottomLayoutGuideConstraint.constant -= (originDelta-44)
            self.toolBarLayOut.constant -= originDelta
        }
        UIView.animateWithDuration(animationDuration, delay: 0, options: .BeginFromCurrentState, animations: {
            self.view.layoutIfNeeded()
            }, completion: nil)
        
        // Scroll to the selected text once the keyboard frame changes.
        self.text.scrollRangeToVisible(self.text.selectedRange)              //让TextView滑到光标所在地方
    }
    
    func textViewDidChange(textView: UITextView) {
        self.text.scrollRangeToVisible(self.text.selectedRange)
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
