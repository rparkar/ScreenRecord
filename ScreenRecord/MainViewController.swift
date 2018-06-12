//
//  MainViewController.swift
//  ScreenRecord
//
//  Created by Rehan Parkar on 2018-06-12.
//  Copyright © 2018 Rehan Parkar. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    //outlets
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var selectedImage: UIImageView!
    @IBOutlet weak var imagePickerSegment: UISegmentedControl!
    @IBOutlet weak var micToogleSwitch: UISwitch!
    @IBOutlet weak var recordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func imagePicked(_ sender: UISegmentedControl) {
    }
    
    @IBAction func RecordButtonPressed(_ sender: Any) {
    }
    
    

}

