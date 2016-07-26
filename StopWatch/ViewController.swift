//
//  ViewController.swift
//  StopWatch
//
//  Created by apple on 16/7/6.
//  Copyright © 2016年 xiaoWu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var playBtn: UIButton!
    var pauseBtn: UIButton!
    var timerLabel: UILabel!
    var reSetBtn: UIButton!
    let screenBounds:CGRect = UIScreen.mainScreen().bounds
    
    var Counter = 0.0
    var Timer = NSTimer()
    var IsPlaying = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createViews()
    }
    
    func createViews() {
        playBtn = UIButton(type:.Custom)
        playBtn.setImage(UIImage(named: "play"), forState: UIControlState.Normal)
        playBtn.frame = CGRect(x: 0,y: screenBounds.size.height/2,width: screenBounds.size.width/2,height: screenBounds.size.height/2)
        playBtn.backgroundColor = UIColor.redColor()
        playBtn.addTarget(self, action: Selector("playBtnDidTouch"), forControlEvents: UIControlEvents.TouchUpInside);
        self.view.addSubview(playBtn!)
        
        
        pauseBtn = UIButton(type:.Custom)
        pauseBtn.frame = CGRect(x: screenBounds.size.width/2, y: screenBounds.size.height/2,width: screenBounds.size.width/2,height: screenBounds.size.height/2)
        pauseBtn.setImage(UIImage(named: "pause"), forState: UIControlState.Normal)
        pauseBtn.backgroundColor = UIColor.blueColor()
        pauseBtn.addTarget(self, action: Selector("pauseBtnDidTouch"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(pauseBtn!)
        
        timerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: screenBounds.size.width, height: screenBounds.size.height/2))
        timerLabel.font = UIFont.systemFontOfSize(100, weight: 0.1)
        timerLabel.textAlignment = NSTextAlignment.Center
        timerLabel.text = String(Counter)
        timerLabel.backgroundColor = UIColor.purpleColor()
        self.view.addSubview(timerLabel)
        
        reSetBtn = UIButton(type: .Custom)
        reSetBtn.frame = CGRect(x: screenBounds.size.width - 100, y: 50, width: 60, height: 30)
        reSetBtn.setTitle("reset", forState: UIControlState.Normal)
        reSetBtn.addTarget(self, action: Selector("resetBtnDidTouch"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(reSetBtn)
        
        
    }
    
    func resetBtnDidTouch() {
        Timer.invalidate()
        IsPlaying = false
        Counter = 0
        timerLabel.text = String(Counter)
        playBtn.enabled = true
        pauseBtn.enabled = true
        
    }
    
    func playBtnDidTouch(){
        if(IsPlaying){
            return
        }
        playBtn.enabled = false
        pauseBtn.enabled = true
        Timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("UpdateTimer"), userInfo: nil, repeats: true)
        IsPlaying = true
    }
    
    func pauseBtnDidTouch() {
        playBtn.enabled = true
        pauseBtn.enabled = false
        Timer.invalidate()
        IsPlaying = false
    }
    
    func UpdateTimer() {
        Counter = Counter + 0.1
        timerLabel.text = String(format: "%.1f", Counter)
    }


}

