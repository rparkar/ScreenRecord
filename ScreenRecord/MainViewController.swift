//
//  MainViewController.swift
//  ScreenRecord
//
//  Created by Rehan Parkar on 2018-06-12.
//  Copyright © 2018 Rehan Parkar. All rights reserved.
//

import UIKit
import ReplayKit

class MainViewController: UIViewController, RPPreviewViewControllerDelegate {
    
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
            
             guard error ==  nil else {
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
    
    func stopRecording () {
        
        recorder.stopRecording { (preview, error) in
            
            guard preview != nil else {
                print("preview controller not AV")
                return
            }
            
            let alert = UIAlertController(title: "Finished", message: "would you like to edit or delete your recording", preferredStyle: .alert)
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: { (action) in
                
                self.recorder.discardRecording {
                    print("Recording deleted succesfully")
                }
            })
            
            let editAction = UIAlertAction(title: "Edit", style: .default, handler: { (action) in
                
                preview?.previewControllerDelegate = self
                self.present(preview, animated: true, completion: nil)
            })
            
            alert.addAction(deleteAction)
            alert.addAction(editAction)
            
            self.present(alert, animated: true, completion: nil)
            self.isRecording = false
            self.viewReset()
        }
        
    }
    
    func viewReset () {
        statusLabel.text = "Ready to Record"
        statusLabel.textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        micToogleSwitch.isEnabled = true
        recordButton.setTitle("Record", for: .normal)
        recordButton.setTitleColor(#colorLiteral(red: 0.9896476865, green: 0.6665952206, blue: 0.3434123397, alpha: 1), for: .normal)
    }
    

}

