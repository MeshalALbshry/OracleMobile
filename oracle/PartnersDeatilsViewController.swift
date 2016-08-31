//
//  PartnersDeatilsViewController.swift
//  oracle
//
//  Created by MESHAL AL-BSHRY on 8/23/16.
//  Copyright © 2016 meshal. All rights reserved.
//

import UIKit

class PartnersDeatilsViewController: UIViewController {
    
    @IBOutlet weak var oScroll: UIScrollView!
    //partners
    @IBOutlet weak var pImage: UIImageView!
    @IBOutlet weak var pName: UILabel!
    @IBOutlet weak var psummry: UILabel!
    @IBOutlet weak var pSpecialty: UILabel!
    @IBOutlet weak var pEmail: UILabel!
    //products
    @IBOutlet weak var ppImage: UIImageView!
    @IBOutlet weak var ppName: UILabel!
    
    //team
    @IBOutlet weak var tImage: UIImageView!
    @IBOutlet weak var tName: UILabel!
    
    //partners to string
    var pImageS = ""
    var pNameS = ""
    var pSummryS = ""
    var pSpecialtyS = ""
    var pEmailS = ""
    
    //prodcuts to string
    var ppImageS = ""
    var ppNameS = ""
    
    //team to string
    var tImageS = ""
    var tNameS = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //scroll View
        self.oScroll.contentSize.height = 800
        //partners
        self.pImage.image = self.urlToImage(self.pImageS)
        self.pName.text = self.pNameS
        self.psummry.text = self.pSummryS
        self.pSpecialty.text = self.pSpecialtyS
        self.pEmail.text = self.pEmailS
//
        //products
        self.ppImage.image = self.urlToImage(self.ppImageS)
        self.ppName.text = self.ppNameS
        
        //team
        self.tImage.image = self.urlToImage(self.tImageS)
        self.tName.text = self.tNameS
    }
    
    ///tansfer url to image
    func urlToImage(url:String) -> UIImage{
        let urlf = NSURL(string:url)
        let data = NSData(contentsOfURL:urlf!)
        return UIImage(data: data!)!
    }
}
