//
//  ClassExtension.swift
//  Science_Plus
//
//  Created by Qiang Chen on 7/15/16.
//  Copyright © 2016 Chem_Plus. All rights reserved.
//

import Foundation

import DGElasticPullToRefresh
extension UIColor{
    static var defaultTintColor:UIColor {
        return UIColor(red: 57/255.0, green: 67/255.0, blue: 89/255.0, alpha: 1.0)
    }
    static var defaultBackgroundColor:UIColor{
        return UIColor.whiteColor()
    }
}

//测试Auto Lauout Constraints使用，会输出有效的信息，此时只需要给Constraints 唯一的 id ， 就可以输出有效的信息
extension NSLayoutConstraint {
    
    override public var description: String {
        let id = identifier ?? ""
        return "id: \(id), constant: \(constant)" //you may print whatever you want here
    }
}

extension UIView {
    @IBInspectable
    public var myCornerRadius: CGFloat{
        set {
            layer.cornerRadius = newValue
            self.clipsToBounds = true
        }
        get {
            return layer.cornerRadius
        }
    }
}
extension String {
    var length: Int {
        return characters.count
    }
}

extension Int {
    /**convenient transform from int to string*/
    var str:String {
        return String(self)
    }
}

extension UIScrollView {
    func dg_stopScrollingAnimation() {}
    
    /**Remember to call dg_stopLoading at the end of the process*/
    func addPullToRefresh(tintColor:UIColor = UIColor.defaultTintColor , backgroundColor:UIColor = UIColor.defaultBackgroundColor , loadingView: DGElasticPullToRefreshLoadingView = DGElasticPullToRefreshLoadingViewCircle(),  actionHandler: () -> Void) {
        loadingView.tintColor = UIColor(red: 78/255.0, green: 221/255.0, blue: 200/255.0, alpha: 1.0)
        dg_setPullToRefreshFillColor(tintColor)
        dg_setPullToRefreshBackgroundColor(backgroundColor)
        dg_addPullToRefreshWithActionHandler(actionHandler,loadingView: loadingView)
        
    }
    
    
    func addInfititeScroll(actionHandler: ((AnyObject!) -> Void)!) {
        infiniteScrollIndicatorView = CustomTableIndicator(frame: CGRectMake(0, 0, 24, 24))
        addInfiniteScrollWithHandler(actionHandler)
    }
    
    
}
extension UIImageView {
    public func imageFromUrl(urlString: String) {
        if let url = NSURL(string: urlString) {
            let request = NSURLRequest(URL: url)
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {
                (response: NSURLResponse?, data: NSData?, error: NSError?) -> Void in
                if let imageData = data as NSData? {
                    self.image = UIImage(data: imageData)
                }
            }
        }
    }
}