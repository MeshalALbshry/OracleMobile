//
//  TeamDeatilsViewController.swift
//  oracle
//
//  Created by MESHAL AL-BSHRY on 8/23/16.
//  Copyright © 2016 meshal. All rights reserved.
//

import UIKit

class TeamDeatilsViewController: UIViewController {
    @IBOutlet weak var oScroll: UIScrollView!
    //team
    @IBOutlet weak var tImage: UIImageView!
    @IBOutlet weak var tName: UILabel!
    @IBOutlet weak var tSpecialty: UILabel!
    @IBOutlet weak var tPhone: UILabel!
    @IBOutlet weak var tEmail: UILabel!
    //References
    @IBOutlet weak var rImage: UIImageView!
    @IBOutlet weak var rName: UILabel!
    //products
    @IBOutlet weak var pImage: UIImageView!
    @IBOutlet weak var pName: UILabel!
    
    
    //team to string
    var tNameS = ""
    var tImageS = ""
    var tSpecialtyS = ""
    var tPhoneS = ""
    var tEmailS = ""
    //References to string
    var rImageS = ""
    var rNameS = ""
    //products to string
    var pImageS = ""
    var pNameS = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.oScroll.contentSize.height = 900
        //team
        self.tName.text = self.tNameS
        self.tImage.image = self.urlToImage(self.tImageS)
        self.tPhone.text = self.tPhoneS
        self.tSpecialty.text = self.tSpecialtyS
        self.tEmail.text = self.tEmailS
        
        //References
        self.rImage.image = self.urlToImage(self.rImageS)
        self.rName.text = self.rNameS
        
        //products
        self.pImage.image = self.urlToImage(self.pImageS)
        self.pName.text = self.pNameS
    }
    
    
    ///tansfer url to image
    func urlToImage(url:String) -> UIImage{
        let urlf = NSURL(string:url)
        let data = NSData(contentsOfURL:urlf!)
        return UIImage(data: data!)!
    }
}
