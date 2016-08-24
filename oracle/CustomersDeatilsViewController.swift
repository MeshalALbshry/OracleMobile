//
//  CustomersDeatilsViewController.swift
//  oracle
//
//  Created by MESHAL AL-BSHRY on 8/23/16.
//  Copyright © 2016 meshal. All rights reserved.
//

import UIKit

class CustomersDeatilsViewController: UIViewController {
    //customer
    @IBOutlet weak var cName: UILabel!
    @IBOutlet weak var cProject: UILabel!
    @IBOutlet weak var cDescription: UILabel!
    @IBOutlet weak var cEmail: UILabel!
    @IBOutlet weak var cimage: UIImageView!
    
    //products
    @IBOutlet weak var cpImage: UIImageView!
    @IBOutlet weak var cpName: UILabel!
    
    //team
    @IBOutlet weak var ctImage: UIImageView!
    @IBOutlet weak var ctName: UILabel!
    
    
    //customer to string
    var cNameS = ""
    var cProjectS = ""
    var cDescriptionS = ""
    var cImageS = ""
    var cEmailS = ""
    
    //products to string
    var cpImageS = ""
    var cpNameS = ""
    //team to string
    var ctImageS = ""
    var ctNameS = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Customer
        self.cName.text = self.cNameS
        self.cProject.text = self.cProjectS
        self.cDescription.text = self.cDescriptionS
        self.cEmail.text = self.cEmailS
        self.cimage.image = self.urlToImage(self.cImageS)
        //products
        self.cpImage.image = self.urlToImage(self.cpImageS)
        self.cpName.text = self.cpNameS
        //team
        self.ctImage.image = self.urlToImage(self.ctImageS)
        self.ctName.text = self.ctNameS
    }
    
    ///tansfer url to image
    func urlToImage(url:String) -> UIImage{
        let urlf = NSURL(string:url)
        let data = NSData(contentsOfURL:urlf!)
        return UIImage(data: data!)!
    }
}
