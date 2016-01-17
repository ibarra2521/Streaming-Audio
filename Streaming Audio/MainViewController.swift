//
//  MainViewController.swift
//  Streaming Audio
//
//  Created by Nivardo Ibarra on 1/7/16.
//  Copyright © 2016 Nivardo Ibarra. All rights reserved.
//

import UIKit
import AVFoundation


class MainViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
//    var BackgroundAudio = try? AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("BackgroundAudio", ofType: "mp3")!))
//    var BackgroundAudio: AVAudioPlayer?
    
    @IBAction func Pause(sender: AnyObject) {
        AudioPlayer.pause()
    }

    @IBAction func Play(sender: AnyObject) {
        AudioPlayer.play()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        BackgroundAudio = (AVAudioPlayer)AudioPlayer
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ChangeAudioTime(sender: AnyObject) {
        AudioPlayer.play()
//        BackgroundAudio!.currentTime = NSTimeInterval(slider.value)
//        BackgroundAudio!.currentTime = 0
        
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
