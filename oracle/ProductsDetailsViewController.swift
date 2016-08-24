//
//  ProductsDetailsViewController.swift
//  oracle
//
//  Created by MESHAL AL-BSHRY on 8/23/16.
//  Copyright © 2016 meshal. All rights reserved.
//

import UIKit
import RappleProgressHUD

class ProductsDetailsViewController: UIViewController {
    
    @IBOutlet weak var uImage: UIImageView!
    @IBOutlet weak var uName: UILabel!
    @IBOutlet weak var uFamily: UILabel!
    @IBOutlet weak var uDescription: UILabel!
    //References
    @IBOutlet weak var urImage: UIImageView!
    @IBOutlet weak var urName: UILabel!
    //Team
    @IBOutlet weak var utImage: UIImageView!
    @IBOutlet weak var utName: UILabel!
    //Partners
    @IBOutlet weak var upImage: UIImageView!
    @IBOutlet weak var upName: UILabel!
    
    //recive
    var uImageS = ""
    var uNameS = ""
    var uFamilyS = ""
    var uDescriptionS = ""
    
    ///References
    var urImageS = ""
    var urNameS = ""
    
    //Team
    var utImageS = ""
    var utNameS = ""
    
    //Partners
    var upImageS = ""
    var upNameS = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        RappleActivityIndicatorView.startAnimating()
        //prodcuts
        self.uName.text = self.uNameS
        self.uFamily.text = self.uFamilyS
        self.uDescription.text = self.uDescriptionS
        self.uImage.image = self.urlToImage(self.uImageS)
        //References
        self.urName.text = self.urNameS
        self.urImage.image = self.urlToImage(self.urImageS)
        //Team
        self.utName.text = self.utNameS
        self.utImage.image = self.urlToImage(self.utImageS)
        //Partners
        self.upName.text = self.upNameS
        self.upImage.image = self.urlToImage(self.upImageS)
//        RappleActivityIndicatorView.stopAnimating()
    }
    override func viewDidAppear(animated: Bool) {
        
    }
    
    ///tansfer url to image
    func urlToImage(url:String) -> UIImage{
        let urlf = NSURL(string:url)
        let data = NSData(contentsOfURL:urlf!)
        return UIImage(data: data!)!
    }
}
