//
//  ViewController.swift
//  iOSKeyBoardSample
//
//  Created by GaoLianjing on 1/7/16.
//  Copyright © 2016 GaoLianjing. All rights reserved.
//

import UIKit
import SnapKit
import SDWebImage

class ViewController: UIViewController {
    
    var downloader:SDWebImageDownloader!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gifView = UIImageView(image: UIImage(named: "Next"))
        gifView.frame.size = self.view.frame.size
        self.view.addSubview(gifView)
    
        let url = NSURL(string: "https://49.media.tumblr.com/tumblr_md8vg1EiDu1rrx588o1_500.gif")
        
        gifView.sd_setImageWithURL(url)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

