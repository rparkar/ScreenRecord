//
//  MainViewController.swift
//  ScreenRecord
//
//  Created by Rehan Parkar on 2018-06-12.
//  Copyright © 2018 Rehan Parkar. All rights reserved.
//

import UIKit
import ReplayKit

class MainViewController: UIViewController {
    
    //outlets
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var selectedImage: UIImageView!
    @IBOutlet weak var imagePickerSegment: UISegmentedControl!
    @IBOutlet weak var micToogleSwitch: UISwitch!
    @IBOutlet weak var recordButton: UIButton!
    
    //variables
    var recorder = RPScreenRecorder.shared()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func imagePicked(_ sender: UISegmentedControl) {
        
        switch sender {
        case 0: selectedImage.image = UIImage(named: "cat")!
        case 1: selectedImage.image = UIImage(named: "food")!
        case 2: selectedImage.image = UIImage(named: "skate")!
        case 3: selectedImage.image = UIImage(named: "nature")
        default:
            selectedImage.image = UIImage(named: "cat")!
        }
    }
    
    @IBAction func RecordButtonPressed(_ sender: Any) {
    }
    
    

}

