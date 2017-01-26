//
//  Settings.swift
//  greetAlpha2
//
//  Created by Raizel Lieberman on 12/22/16.
//  Copyright © 2016 MyTech. All rights reserved.
//

import UIKit

class Settings: UIViewController {

    @IBOutlet var SettingsToMainSwipe: UISwipeGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
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
