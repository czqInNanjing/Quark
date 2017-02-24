//
//  PersonDetailEditTableViewController.swift
//  Science_Plus
//
//  Created by Mac on 16/7/22.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import UIKit
import AVFoundation
import Photos

class PersonDetailEditTableViewController: UITableViewController ,UIImagePickerControllerDelegate,UIActionSheetDelegate,UINavigationControllerDelegate{
    
    var person=Person()
    fileprivate var model=PersonShowModel()
    
    @IBOutlet weak var nameT: UITextField!
    @IBOutlet weak var introductionT: UITextField!
    @IBOutlet weak var unitT: UITextField!
    @IBOutlet weak var genderT: UITextField!
    @IBOutlet weak var majorT: UITextField!
    @IBOutlet weak var provinceT: UITextField!
    @IBOutlet weak var cityT: UITextField!
    @IBOutlet weak var schoolT: UITextField!
    @IBOutlet weak var degreeT: UITextField!
    @IBOutlet weak var workspaceT: UITextField!
    
    @IBOutlet weak var positionT: UITextField!
    
    
    @IBOutlet weak var imageView:UIImageView!
    fileprivate var sheet:UIAlertController!
    fileprivate var sourceType = UIImagePickerControllerSourceType.photoLibrary

    override func viewDidLoad() {
        super.viewDidLoad()
        print(person.name)
        showInfo()
    }
    
    fileprivate struct storyboard{
        
        static let nullInfo="信息不完整"
        
    }

    
    fileprivate func showInfo(){
        nameT.text=person.name
        introductionT.text=person.introduction
        
        let address=person.residence
        if address != ""{
            let fullAddressArr = address.components(separatedBy: "&")
            provinceT.text=fullAddressArr[0]
            cityT.text=fullAddressArr.count>1 ? fullAddressArr[1] : " "
        }
        
        //woman的图片未上传
        //        let gender=person.gender == 0 ? storyboard.woman : storyboard.man
        //        genderImage=UIImage(named: gender)
        
        let education=person.education
        if education != ""{
            let fullArr = education.components(separatedBy: "%")
            schoolT.text=fullArr[0]
            degreeT.text=fullArr.count>1 ? fullArr[1] : " "
        }
        
        let work=person.work
        if work != ""{
            let fullArr = work.components(separatedBy: "%")
            workspaceT.text=fullArr[0]
            positionT.text=fullArr.count>1 ? fullArr[1] : " "
        }
        
    }
    
    
    @IBAction func save(){
        if nameT.text == "" || introductionT.text == ""{
            self.noticeInfo(storyboard.nullInfo)
        }
        else{//由于API问题，只修改了名字和介绍
            let editedPerson=Person()
            editedPerson.name=nameT.text!
            editedPerson.introduction=introductionT.text!
            
            
            // add by Qiang  about the upload of the userImage
            let picName = HttpConstants.qiniuUserImage +  HttpHandler.userID + "/" + MyDate.getContemporaryTime() + HttpConstants.img_PNG_Suffix
            
            let data = UIImagePNGRepresentation(imageView.image ?? UIImage(named: SystemConstants.defaultUserImage)! )
            editedPerson.img_url =  HttpConstants.qiniuPrefix  + picName
//            print(editedPerson.img_url)
            QiniuSDK.upload(data, name:picName )
            
            
            
            model.changePersonInfo(editedPerson, controller: self)
            self.navigationController?.popViewController(animated: false)

        }
        
    }


    
    /**
     判断相机权限
     
     - returns: 有权限返回true，没权限返回false
     */
    func cameraPermissions() -> Bool{
        
        let authStatus:AVAuthorizationStatus = AVCaptureDevice.authorizationStatus(forMediaType: AVMediaTypeVideo)
        
        if(authStatus == AVAuthorizationStatus.denied || authStatus == AVAuthorizationStatus.restricted) {
            return false
        }else {
            return true
        }
        
    }
    
    /**
     判断相册权限
     
     - returns: 有权限返回ture， 没权限返回false
     */
    
    func PhotoLibraryPermissions() -> Bool {
        
        let library:PHAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
        if(library == PHAuthorizationStatus.denied || library == PHAuthorizationStatus.restricted){
            return false
        }else {
            return true
        }
    }
    
    //    取消图片选择操作
    func imagePickerControllerDidCancel(_ picker:UIImagePickerController)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    //    选择完图片操作
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [AnyHashable: Any]!) {
        imageView.image = image
        self.dismiss(animated: true, completion: nil)
        
        
        
        
    }
    
    @IBAction func picker(_ sender: AnyObject) {
        
        //判断设置是否支持图片库和相机
        
        
        sheet = UIAlertController(title: nil, message: "选择获取头像方式", preferredStyle: .actionSheet)
        
        //取消
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: {(action) in
            print("取消")
        })
        sheet.addAction(cancelAction)
        
        
        //相册
        let OKAction = UIAlertAction(title: "相册", style: .default, handler: {(action) in
            if(self.PhotoLibraryPermissions() == true){
                self.sourceType = UIImagePickerControllerSourceType.photoLibrary
                self.open()
            }else{
                //弹出提示框
                self.sheet = UIAlertController(title: nil, message: "请在设置中打开相册权限", preferredStyle: .alert)
                
                let tempAction = UIAlertAction(title: "确定", style: .cancel) { (action) in
                    print("取消")
                    
                }
                self.sheet.addAction(tempAction)
                self.present(self.sheet, animated: true, completion: nil)
            }
        })
        if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary)){
            sheet.addAction(OKAction)
        }
        
        
        //摄像头
        let destroyAction = UIAlertAction(title: "摄像头", style: .default, handler: { (action) in
            if(self.cameraPermissions() == true){
                self.sourceType = UIImagePickerControllerSourceType.camera
                self.open()
            }else {
                //弹出提示框
                self.sheet = UIAlertController(title: nil, message: "请在设置中打开摄像头权限", preferredStyle: .alert)
                
                let tempAction = UIAlertAction(title: "确定", style: .cancel) { (action) in
                }
                self.sheet.addAction(tempAction)
                self.present(self.sheet, animated: true, completion: nil)
            }
        })
        if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)){
            sheet.addAction(destroyAction)
        }
        
        
        
        self.present(self.sheet, animated: true, completion: nil)
    }
    
    //    打开图库或相机
    func open(){
        
        let imagePickerController:UIImagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true//true为拍照、选择完进入图片编辑模式
        imagePickerController.sourceType = sourceType
        self.present(imagePickerController, animated: true, completion:{
            
        })
        
    }
    


    
    

}
