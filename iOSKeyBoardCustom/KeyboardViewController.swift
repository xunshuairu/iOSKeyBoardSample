//
//  KeyboardViewController.swift
//  iOSKeyBoardCustom
//
//  Created by GaoLianjing on 1/7/16.
//  Copyright © 2016 GaoLianjing. All rights reserved.
//

import UIKit
import SnapKit
import SDWebImage

class KeyboardViewController: UIInputViewController {
    
    @IBOutlet weak var nextKeyboard: UIButton!
    
    var keyView:UIView!
    
    var downloader:SDWebImageDownloader!

    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }
    
    func loadInterface() {
        // load the nib file
        let viewNib = UINib(nibName: "KeyboardView", bundle: nil)
        
        // instantiate the view
        keyView = viewNib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        keyView.translatesAutoresizingMaskIntoConstraints = false

        // add the interface to the main view
        view.addSubview(keyView)
        
        // copy the background color
        keyView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(self.view).inset(UIEdgeInsetsMake(0, 0, 0, 0))
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadInterface()
        self.nextKeyboard.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)
        
        downloader =  SDWebImageDownloader.sharedDownloader()
        
        let url = NSURL(string: "https://49.media.tumblr.com/tumblr_md8vg1EiDu1rrx588o1_500.gif")
        
        
        let gifView = UIImageView(image: UIImage(named: "Next"))
        gifView.frame.size = self.keyView.frame.size
        self.keyView.addSubview(gifView)
//        gifView.snp_makeConstraints { (make) -> Void in
//            make.edges.equalTo(self.keyView).inset(UIEdgeInsetsMake(10, 10, 10, 10))
//        }
         gifView.sd_setImageWithURL(url)

        
        
//        downloader.downloadImageWithURL(url, options: .AllowInvalidSSLCertificates, progress: { (receivedSize, expectedSize) -> Void in
//            }) { (image, data, error, finished) -> Void in
//                if finished == true  {
//                    
//                   
//                }
//        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
            textColor = UIColor.whiteColor()
        } else {
            textColor = UIColor.blackColor()
        }
        self.nextKeyboard.setTitleColor(textColor, forState: .Normal)
    }

}
