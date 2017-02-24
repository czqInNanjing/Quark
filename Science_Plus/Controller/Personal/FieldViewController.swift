//
//  FieldViewController.swift
//  Science_Plus
//
//  Created by Mac on 16/7/24.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import UIKit

class FieldViewController: UIViewController , UITableViewDataSource,UITableViewDelegate{
    
    @IBOutlet weak var fieldImageView: UIImageView!
    @IBOutlet weak var fieldName: UILabel!
    @IBOutlet weak var fieldDescription: UILabel!
    @IBOutlet weak var numberOfFocus: UILabel!
    @IBOutlet weak var numberOfIn: UILabel!
    @IBOutlet weak var tableView: UITableView!

    
    fileprivate struct storyboard {
        static let questionCell = "questionCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int{
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: storyboard.questionCell , for: indexPath) as! FieldQuestionTableViewCell
        
        return cell
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
