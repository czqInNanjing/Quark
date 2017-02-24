//
//  CommentViewController.swift
//  Science_Plus
//
//  Created by Mac on 16/5/15.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import UIKit

class CommentViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    @IBOutlet weak var table: UITableView!
    fileprivate var model = CommentViewModel()
    
    var answerID:Int?{
        get{
            return model.getAnswer()
        }
        set{
            model.setAnswer(newValue)
        }
    }
    
    fileprivate struct storyBoard{
        static let commentCell = "CommentCell"
        static let addComment="addComment"
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(true)
//        self.table
        model.loadComment(self)
//        self.table.reloadData()
        print("comment add ............")

    }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        model.loadComment(self)
//        self.table.reloadData()
//        // Do any additional setup after loading the view.
//    }
    
    func numberOfSections(in tableView: UITableView) -> Int{
        return model.getComment().count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.getComment()[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: storyBoard.commentCell, for: indexPath) as! CommentTableViewCell
        

        cell.comment = model.getComment()[indexPath.section][indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
            case storyBoard.addComment:
                if let addCommentViewController=segue.destination as? AddCommentViewController{
                    if let id = answerID{
                        addCommentViewController.setAnswerId(id)
                    }
                }
            default:
                break
            }
        }
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
