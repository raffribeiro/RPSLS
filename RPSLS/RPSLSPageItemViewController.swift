//
//  RPSLSPageItemViewController.swift
//  RPSLS
//
//  Created by gustavo.freitas2 on 8/28/15.
//  Copyright (c) 2015 himynameisgustavo. All rights reserved.
//

import UIKit

class RPSLSPageItemViewController: UIViewController {

    
    var index: Int = 0
    struct Line {
        let leftImage: UIImage?
        let text: String?
        let rightImage: UIImage?
        
        init(leftImage: UIImage, text: String, rightImage: UIImage){
            self.leftImage = leftImage
            self.text = text
            self.rightImage = rightImage
        }
    }
    
    
    var lines: Array<Line> = []
    
    @IBOutlet weak var imageView1: UIImageView!
    
    @IBOutlet weak var imageView2: UIImageView!
    
    @IBOutlet weak var label1: UILabel!
    
    
    @IBOutlet weak var imageView3: UIImageView!
    
    @IBOutlet weak var imageView4: UIImageView!
    
    @IBOutlet weak var label2: UILabel!
    
    
    @IBOutlet weak var imageView5: UIImageView?
    
    @IBOutlet weak var imageView6: UIImageView?
    
    @IBOutlet weak var label3: UILabel?
    
    
    @IBOutlet weak var imageView7: UIImageView?
    
    @IBOutlet weak var imageView8: UIImageView?
    
    @IBOutlet weak var label4: UILabel?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        imageView1.image = lines[0].leftImage
        imageView2.image = lines[0].rightImage
        label1.text = lines[0].text
        
        imageView3.image = lines[1].leftImage
        imageView4.image = lines[1].rightImage
        label2.text = lines[1].text
        
        if lines.count > 2 {
            imageView5?.image = lines[2].leftImage
            imageView6?.image = lines[2].rightImage
            label3?.text = lines[2].text
        
            imageView7?.image = lines[3].leftImage
            imageView8?.image = lines[3].rightImage
            label4?.text = lines[3].text
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
