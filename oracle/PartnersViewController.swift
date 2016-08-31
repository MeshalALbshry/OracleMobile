//
//  PartnersViewController.swift
//  oracle
//
//  Created by MESHAL AL-BSHRY on 8/23/16.
//  Copyright © 2016 meshal. All rights reserved.
//

import UIKit
import Alamofire

class PartnersViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var oTable: UITableView!
    @IBOutlet weak var oIndicator: UIActivityIndicatorView!
    let url = "http://ec2-52-42-53-162.us-west-2.compute.amazonaws.com:3000/partners"
    //to turn json to dictionary
    var headers:NSDictionary?
    //Partners
    var partnersName = [String]()
    var parnersImage = [String]()
    var parnersSummry = [String]()
    var partnersSpecialty = [String]()
    var partnersEmail = [String]()
    //products
    var productsName = [String]()
    var productsImage = [String]()
    //team
    var teamName = [String]()
    var teamImage = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Partners"
        Alamofire.request(.GET, self.url)
            .responseJSON { response in
                
                if let JSON = response.result.value {
//                    print("JSON: \(JSON)")
                    self.headers = JSON as? NSDictionary
                    if self.headers != nil {
                        //partners Dic
                        let partnersNameDic = self.headers!["Partners"]!["name"] as! NSArray
                        let partnersImageDic = self.headers!["Partners"]!["image"] as! NSArray
                        let parnersSummryDic = self.headers!["Partners"]!["summary"] as! NSArray
                        let partnersSpecialtyDic = self.headers!["Partners"]!["specialty"] as! NSArray
                        let partnersEmailDic = self.headers!["Partners"]!["contactemail"] as! NSArray
                        //products Dic
                        let productsNameDic = self.headers!["Products"]!["name"] as! NSArray
                        let productsImageDic = self.headers!["Products"]!["image"] as! NSArray
                        //team
                        let teamNameDic = self.headers!["Team"]!["name"] as! NSArray
                        let teamImageDic = self.headers!["Team"]!["image"] as! NSArray
                        for i in 0 ..< partnersNameDic.count {
                            //partners
                            self.partnersName.append(partnersNameDic[i] as! String)
                            self.parnersImage.append(partnersImageDic[i] as! String)
                            self.parnersSummry.append(parnersSummryDic[i] as! String)
                            self.partnersSpecialty.append(partnersSpecialtyDic[i] as! String)
                            self.partnersEmail.append(partnersEmailDic[i] as! String)
                            //products
                            self.productsName.append(productsNameDic[i] as! String)
                            self.productsImage.append(productsImageDic[i] as! String)
                            //team
                            self.teamName.append(teamNameDic[i] as! String)
                            self.teamImage.append(teamImageDic[i] as! String)
                        }
                        
                        self.oTable.reloadData()
                        self.oIndicator.hidden = true
                    }
                }
        }
        //Delegate and Datasource
        self.oTable.dataSource = self
        self.oTable.delegate = self
    }
    
    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.parnersImage.count
        
    }
    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = self.oTable.dequeueReusableCellWithIdentifier("PartnersCell", forIndexPath: indexPath) as! PartnersvViewCustomeCell
        //partner
        cell.oImage.image = self.urlToImage(self.parnersImage[indexPath.row])
        cell.oName.text = self.partnersName[indexPath.row]
        
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //PartnersDeatils
        let PD = self.storyboard?.instantiateViewControllerWithIdentifier("PartnersDeatils") as! PartnersDeatilsViewController
        //partners
        PD.pNameS = self.partnersName[indexPath.row]
        PD.pImageS = self.parnersImage[indexPath.row]
        PD.pEmailS = self.partnersEmail[indexPath.row]
        PD.pSummryS = self.parnersSummry[indexPath.row]
        PD.pSpecialtyS = self.partnersSpecialty[indexPath.row]
        PD.pImageS = self.parnersImage[indexPath.row]
        //products
        PD.ppNameS = self.productsName[indexPath.row]
        PD.ppImageS = self.productsImage[indexPath.row]
        //team
        PD.tNameS = self.teamName[indexPath.row]
        PD.tImageS = self.teamImage[indexPath.row]
        
        self.navigationController?.pushViewController(PD, animated: true)
    }
    
    
    ///tansfer url to image
    func urlToImage(url:String) -> UIImage{
        let urlf = NSURL(string:url)
        let data = NSData(contentsOfURL:urlf!)
        return UIImage(data: data!)!
    }
    
}
