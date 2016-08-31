//
//  ViewController.swift
//  oracle
//
//  Created by MESHAL AL-BSHRY on 8/22/16.
//  Copyright © 2016 meshal. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var oTable: UITableView!
    // products, Customers, Partners ,Team
    var imageArry = ["Products","Customers","Partners","Team"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //---NavigationBar
        self.title = "Oracle"
        let nav = self.navigationController?.navigationBar
        nav?.barTintColor = UIColor(red:0.94, green:0.05, blue:0.10, alpha:1.00)
        nav?.tintColor = UIColor(red:0.93, green:0.97, blue:0.99, alpha:1.00)
        nav?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor(red:0.93, green:0.97, blue:0.99, alpha:1.00)]
        
        //Delegate and Datasource
        self.oTable.dataSource = self
        self.oTable.delegate = self
        
    }
    //number of row
    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.imageArry.count
    }
    
    //custom cell
    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = self.oTable.dequeueReusableCellWithIdentifier("mainCell", forIndexPath: indexPath) as! mainViewCustomCell
        cell.oImage.image = UIImage(named: self.imageArry[indexPath.row])
        cell.oName.text = self.imageArry[indexPath.row]
        return cell
    }
    
    //select row
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //Products
        if indexPath.row == 0 {
            let prodcutsView = self.storyboard?.instantiateViewControllerWithIdentifier("ProductsView") as! ProductsViewController
            self.navigationController?.pushViewController(prodcutsView, animated: true)
        //Customers
        }else if indexPath.row == 1 {
            let customersView = self.storyboard?.instantiateViewControllerWithIdentifier("CustomersView") as! CustomersViewController
            self.navigationController?.pushViewController(customersView, animated: true)
        //Partners
        }else if indexPath.row == 2 {
            let partnersView = self.storyboard?.instantiateViewControllerWithIdentifier("PartnersView") as! PartnersViewController
            self.navigationController?.pushViewController(partnersView, animated: true)
        //Team
        }else if indexPath.row == 3{
            let teamView = self.storyboard?.instantiateViewControllerWithIdentifier("TeamView") as! TeamViewController
            self.navigationController?.pushViewController(teamView, animated: true)
        }
        
        
    }
    
}

