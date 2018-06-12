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
    private var isRecording = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func imagePicked(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0: selectedImage.image = UIImage(named: "cat")!
        case 1: selectedImage.image = UIImage(named: "food")!
        case 2: selectedImage.image = UIImage(named: "skate")!
        case 3: selectedImage.image = UIImage(named: "nature")
        default:
            selectedImage.image = UIImage(named: "cat")!
        }
    }
    
    @IBAction func RecordButtonPressed(_ sender: Any) {
        
    
        if isRecording = false {
            startRecording()
        } else {
            //stop record
        }
    }
    
    func startRecording() {
        
        //recorder
        guard recorder.isAvailable else {return}
        
        //mic
        if micToogleSwitch.isOn {
            recorder.isMicrophoneEnabled = true
        } else {
            recorder.isMicrophoneEnabled = false
        }
        
        //
        recorder.startRecording { (error) in
            
             guard error = nil else {
                print("error recording")
                return
            }
            
            print("recording")
            
            DispatchQueue.main.async {
                
                self.micToogleSwitch.isEnabled = false
                self.recordButton.setTitleColor(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), for: .normal)
                self.recordButton.setTitle("Stop", for: .normal)
                self.statusLabel.text = "Recording..."
                self.statusLabel.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
                self.isRecording = true
            }

        }
    }
    

}

