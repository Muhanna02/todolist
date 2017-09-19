//
//  FirstViewController.swift
//  To do list
//
//  Created by Mehna Almotery on 7/28/16.
//  Copyright © 2016 Mehna Almotery. All rights reserved.
//

import UIKit

var doList = [String]()
var doDescription = [String]()

class FirstViewController: UIViewController ,UITableViewDelegate{

    @IBOutlet weak var doListTabel: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if UserDefaults.standard.object(forKey: "doList")  != nil{
            doList = UserDefaults.standard.object(forKey: "doList") as! [String]
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return doList.count
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
   
    open func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = doList[indexPath.row]
        
        return cell
        
    }
    open func tableView(_ tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: IndexPath){
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            
            doList.remove(at: indexPath.row)
            
            UserDefaults.standard.set(doList, forKey: "doList")
            
            doListTabel.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        doListTabel.reloadData()
    }

}

