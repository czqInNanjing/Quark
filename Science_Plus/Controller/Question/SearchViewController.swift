//
//  SearchViewController.swift
//  Science_Plus
//
//  Created by Mac on 16/7/23.
//  Copyright © 2016年 Chem_Plus. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchResultsUpdating, UISearchBarDelegate{

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView=UITableView(frame: self.view.frame, style: .Plain)
        tableView.backgroundColor=UIColor.blue
        
        self.view.addSubview(tableView)
        
    }
    func updateSearchResults(for searchController: UISearchController) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    @IBAction func cancel(){
//        self.navigationController?.popViewControllerAnimated(true)
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
