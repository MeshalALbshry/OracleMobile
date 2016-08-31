//
//  CustomersViewController.swift
//  oracle
//
//  Created by MESHAL AL-BSHRY on 8/23/16.
//  Copyright © 2016 meshal. All rights reserved.
//

import UIKit
import Alamofire

class CustomersViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var oIndictoer: UIActivityIndicatorView!
    
    @IBOutlet weak var oTable: UITableView!
    ///customer URL
    let url = "http://ec2-52-42-53-162.us-west-2.compute.amazonaws.com:3000/customers"
    //to turn json to dictionary
    var headers:NSDictionary?
    
    //Customer
    var customerName = [String]()
    var customerImage = [String]()
    var customerDescription = [String]()
    var customerEmail = [String]()
    var customerProject = [String]()
    
    //products
    var prodcutsName = [String]()
    var productsImage = [String]()
    
    //team
    var teamName = [String]()
    var teamImage = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.oIndictoer.startAnimating()
        self.title = "Customers"
        
        Alamofire.request(.GET, self.url)
            .responseJSON { response in
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                    self.headers = JSON as? NSDictionary
                    if self.headers != nil {
                        //Customer
                        let customerNameDic = self.headers!["References"]!["name"] as! NSArray
                        let customerImageDic = self.headers!["References"]!["image"] as! NSArray
                        let customerDescriptionDic = self.headers!["References"]!["description"] as! NSArray
                        let customerEmailDic = self.headers!["References"]!["contactEmail"] as! NSArray
                        let customerProjectDic = self.headers!["References"]!["project"] as! NSArray
                        //products
                        let prodcutsNameDic = self.headers!["Products"]!["name"] as! NSArray
                        let prodcutsImageDic = self.headers!["Products"]!["image"] as! NSArray
                        //team
                        let teamNameDic = self.headers!["Team"]!["name"] as! NSArray
                        let teamImageDic = self.headers!["Team"]!["image"] as! NSArray
                        for i in 0 ..< customerNameDic.count {
                            //customers
                            self.customerName.append(customerNameDic[i] as! String)
                            self.customerImage.append(customerImageDic[i] as! String)
                            self.customerDescription.append(customerDescriptionDic[i] as! String)
                            self.customerEmail.append(customerEmailDic[i] as! String)
                            self.customerProject.append(customerProjectDic[i] as! String)
                            //products
                            self.prodcutsName.append(prodcutsNameDic[i] as! String)
                            self.productsImage.append(prodcutsImageDic[i] as! String)
                            //team
                            self.teamName.append(teamNameDic[i] as! String)
                            self.teamImage.append(teamImageDic[i] as! String)
                        }
                        self.oTable.reloadData()
                        self.oIndictoer.hidden = true
                    }
                }
        }
        
        //Delegate and Datasource
        self.oTable.dataSource = self
        self.oTable.delegate = self
    }
    
    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.customerName.count
    }
    
    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = self.oTable.dequeueReusableCellWithIdentifier("CustomersCell", forIndexPath: indexPath) as! CustomersViewCustomCell
        cell.oName.text = self.customerName[indexPath.row]
        cell.oImage.image = self.urlToImage(self.customerImage[indexPath.row])
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let CD = self.storyboard?.instantiateViewControllerWithIdentifier("CustomersDeatils") as! CustomersDeatilsViewController
        //customers
        CD.cNameS = self.customerName[indexPath.row]
        CD.cEmailS = self.customerEmail[indexPath.row]
        CD.cDescriptionS = self.customerDescription[indexPath.row]
        CD.cImageS = self.customerImage[indexPath.row]
        CD.cProjectS = self.customerProject[indexPath.row]
        //product
        CD.cpNameS = self.prodcutsName[indexPath.row]
        CD.cpImageS = self.productsImage[indexPath.row]
        //team
        CD.ctNameS = self.teamName[indexPath.row]
        CD.ctImageS = self.teamImage[indexPath.row]
        
        self.navigationController?.pushViewController(CD, animated: true)
    }
    
    ///tansfer url to image
    func urlToImage(url:String) -> UIImage{
        let urlf = NSURL(string:url)
        let data = NSData(contentsOfURL:urlf!)
        return UIImage(data: data!)!
    }
}
