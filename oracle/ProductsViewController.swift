//
//  ProductsViewController.swift
//  oracle
//
//  Created by MESHAL AL-BSHRY on 8/22/16.
//  Copyright © 2016 meshal. All rights reserved.
//

import UIKit
import Alamofire

class ProductsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    ///table view
    @IBOutlet weak var oTable: UITableView!
    ///Activity Indicator
    @IBOutlet weak var oIndicator: UIActivityIndicatorView!
    ///URL for get json
    let oURL = "http://ec2-52-42-53-162.us-west-2.compute.amazonaws.com:3000/products"
    //to turn json to dictionary
    var headers:NSDictionary?
    
    //---Prdoucts---
    var productsName = [String]()
    var prodcutsFamily = [String]()
    var prodcutsDescription = [String]()
    var prodcutsImage = [String]()
    
    //---References---
    var referencesName = [String]()
    var referencesImage = [String]()
    //---Team---
    var teamName = [String]()
    var teamImage = [String]()
    //---Partners---
    var partnersName = [String]()
    var partnersImage = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Products"
        print("welcome to products")
        
        //Deletage and DataSource
        self.oTable.delegate = self
        self.oTable.dataSource = self
        
        Alamofire.request(.GET, self.oURL)
            .responseJSON { response in
                
                if let JSON = response.result.value {
//                    print("JSON: \(JSON)")
                    self.headers = JSON as? NSDictionary
                    if self.headers != nil{
                        //products to dic
                        let productsNameDic = self.headers!["products"]!["name"] as! NSArray
                        let prodcutsImageDic = self.headers!["products"]!["image"] as! NSArray
                        let prodcutsFamilyDic = self.headers!["products"]!["family"] as! NSArray
                        let prodcutsDescriptionDic = self.headers!["products"]!["description"] as! NSArray
                        //References to dic
                        let referencesNameDic = self.headers!["References"]!["name"] as! NSArray
                        let referencesImageDic = self.headers!["References"]!["image"] as! NSArray
                        //Team to dic
                        let teamNameDic = self.headers!["Team"]!["name"] as! NSArray
                        let teamImageDic = self.headers!["Team"]!["image"] as! NSArray
                        //Partners to dic
                        let partnersNameDic = self.headers!["Partners"]!["name"] as! NSArray
                        let partnersImageDic = self.headers!["Partners"]!["image"] as! NSArray
                        
                        for i in 0 ..< productsNameDic.count {
                            //append products
                            self.productsName.append(productsNameDic[i] as! String)
                            self.prodcutsImage.append(prodcutsImageDic[i] as! String)
                            self.prodcutsFamily.append(prodcutsFamilyDic[i] as! String)
                            self.prodcutsDescription.append(prodcutsDescriptionDic[i] as! String)
                            //append References
                            self.referencesName.append(referencesNameDic[i] as! String)
                            self.referencesImage.append(referencesImageDic[i] as! String)
                            //append Team
                            self.teamName.append(teamNameDic[i] as! String)
                            self.teamImage.append(teamImageDic[i] as! String)
                            //append Partners
                            self.partnersName.append(partnersNameDic[i] as! String)
                            self.partnersImage.append(partnersImageDic[i] as! String)
                        }
                        self.oTable.reloadData()
                    }
                    self.stopIndicator()
                }
        }
        
    }
    //number of row
    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.productsName.count
    }
    //custome cell
    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.oTable.dequeueReusableCellWithIdentifier("ProductsCell", forIndexPath: indexPath) as! ProductsViewCustomCell
        
        //to get image from URL
        let url = NSURL(string:self.prodcutsImage[indexPath.row])
        let data = NSData(contentsOfURL:url!)
        
        cell.oimage.image = UIImage(data: data!)
        cell.oLabel.text = self.productsName[indexPath.row]
        return cell
    }
    //if select row
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let PD = self.storyboard?.instantiateViewControllerWithIdentifier("ProductsDetails") as! ProductsDetailsViewController
        //products
        PD.uImageS = self.prodcutsImage[indexPath.row]
        PD.uNameS = self.productsName[indexPath.row]
        PD.uFamilyS = self.prodcutsFamily[indexPath.row]
        PD.uDescriptionS = self.prodcutsDescription[indexPath.row]
        //References
        PD.urNameS = self.referencesName[indexPath.row]
        PD.urImageS = self.referencesImage[indexPath.row]
        //Team
        PD.utNameS = self.teamName[indexPath.row]
        PD.utImageS = self.teamImage[indexPath.row]
        //Partners
        PD.upNameS = self.partnersName[indexPath.row]
        PD.upImageS = self.partnersImage[indexPath.row]
        
        self.navigationController?.pushViewController(PD, animated: true)
        
    }
    
    
    ///stop Indictor animting
    func stopIndicator() {
        self.oIndicator.stopAnimating()
        self.oIndicator.hidden = true
    }
    ///tansfer url to image
    func urlToImage(url:String) -> UIImage{
        let urlf = NSURL(string:url)
        let data = NSData(contentsOfURL:urlf!)
        return UIImage(data: data!)!
    }
    
    
}
