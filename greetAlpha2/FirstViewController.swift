//
//  FirstViewController.swift
//  greetAlpha2
//
//  Created by Raizel Lieberman on 12/13/16.
//  Copyright © 2016 MyTech. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet var MainToProfileSwipe: UISwipeGestureRecognizer!
    @IBOutlet var MainToLoopsSwipe: UISwipeGestureRecognizer!
    
    @IBOutlet weak var MainToProfileButton: UIButton!
    @IBOutlet weak var MainToLoopsButton: UIButton!
    
    @IBOutlet weak var MainToSettingsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //teal: red: 33.0/255.0, green: 239.0/255.0, blue: 225.0/255.0, alpha: 1.0
        //purple: red: 198.0/255.0, green: 68.0/255.0, blue: 226.0/255.0, alpha: 1.0

        let background = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        background.image = UIImage(named: "Background");
        background.layer.zPosition = -20
        
        
        view.addSubview(background)
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }


}

