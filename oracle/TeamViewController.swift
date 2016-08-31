//
//  TeamViewController.swift
//  oracle
//
//  Created by MESHAL AL-BSHRY on 8/23/16.
//  Copyright © 2016 meshal. All rights reserved.
//

import UIKit
import Alamofire

class TeamViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var oTable: UITableView!
    @IBOutlet weak var oIndicator: UIActivityIndicatorView!
    let url = "http://ec2-52-42-53-162.us-west-2.compute.amazonaws.com:3000/team"
    //to turn json to dictionary
    var headers:NSDictionary?

    //team
    var teamName = [String]()
    var teamImage = [String]()
    var teamSpecialty = [String]()
    var teamPhone = [String]()
    var teamEmail = [String]()
    //References
    var referencesName = [String]()
    var referencesImage = [String]()
    //products
    var productsName = [String]()
    var productsImage = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Team"
        Alamofire.request(.GET, self.url)
            .responseJSON { response in
                
                if let JSON = response.result.value {
//                    print("JSON: \(JSON)")
                    self.headers = JSON as? NSDictionary
                      if self.headers != nil {
                        //team
                        let teamNameDic = self.headers!["Team"]!["name"] as! NSArray
                        let teamImageDic = self.headers!["Team"]!["image"] as! NSArray
                        let teamSpecialtyDic = self.headers!["Team"]!["specialty"] as! NSArray
                        let teamPhoneDic = self.headers!["Team"]!["phone"] as! NSArray
                        let teamEmailDic = self.headers!["Team"]!["email"] as! NSArray
                        //References
                        let referencesNameDic = self.headers!["References"]!["name"] as! NSArray
                        let referencesImageDic = self.headers!["References"]!["image"] as! NSArray
                        //Products
                        let productsNameDic = self.headers!["Products"]!["name"] as! NSArray
                        let productsimageDic = self.headers!["Products"]!["image"] as! NSArray
                        
                        for i in 0 ..< teamNameDic.count {
                            //team
                            self.teamName.append(teamNameDic[i] as! String)
                            self.teamImage.append(teamImageDic[i] as! String)
                            self.teamSpecialty.append(teamSpecialtyDic[i] as! String)
                            self.teamPhone.append(teamPhoneDic[i] as! String)
                            self.teamEmail.append(teamEmailDic[i] as! String)
                            //References
                            self.referencesName.append(referencesNameDic[i] as! String)
                            self.referencesImage.append(referencesImageDic[i] as! String)
                            //products
                            self.productsName.append(productsNameDic[i] as! String)
                            self.productsImage.append(productsimageDic[i] as! String)
                        }
                        
                        self.oTable.reloadData()
                        self.oIndicator.hidden = true
                     }
                }
        }
        //Delegate and DataSource
        self.oTable.dataSource = self
        self.oTable.delegate = self
    }
    
    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.teamName.count
    }
    
    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.oTable.dequeueReusableCellWithIdentifier("TeamCell", forIndexPath: indexPath) as! TeamViewCustomCell
        cell.oImage.image = self.urlToImage(self.teamImage[indexPath.row])
        cell.oName.text = self.teamName[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let TD = self.storyboard?.instantiateViewControllerWithIdentifier("TeamDeatils") as! TeamDeatilsViewController
        //team
        TD.tImageS = self.teamImage[indexPath.row]
        TD.tNameS = self.teamName[indexPath.row]
        TD.tSpecialtyS = self.teamSpecialty[indexPath.row]
        TD.tEmailS = self.teamEmail[indexPath.row]
        TD.tPhoneS = self.teamPhone[indexPath.row]
        //References
        TD.rNameS = self.referencesName[indexPath.row]
        TD.rImageS = self.referencesImage[indexPath.row]
        //prodcuts
        TD.pNameS = self.productsName[indexPath.row]
        TD.pImageS = self.productsImage[indexPath.row]
        self.navigationController?.pushViewController(TD, animated: true)
    }
    
    
    ///tansfer url to image
    func urlToImage(url:String) -> UIImage{
        let urlf = NSURL(string:url)
        let data = NSData(contentsOfURL:urlf!)
        return UIImage(data: data!)!
    }
}
