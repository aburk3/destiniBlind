//
//  ViewController.swift
//  Destini
//
//  Created by Philipp Muellauer on 01/09/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Our strings
    let story1 = "You\'re curious if it is time to file a Complaint with a Court. \nHave you received a Notice of Dismissal and Suit Rights document from the EEOC?"
    let answer1a = "No, I haven\'t received a Notice of Dismissal or Suit Rights as of yet."
    let answer1b = "Yes, I have a stamped Notice of Dismissal and Suit Rights Document."
    
    
    let story2 = "Great! You are ready to sue then! \nHave you scanned in all documents received from the EEOC AND the envelope?"
    let answer2a = "I've scanned everything except the envelope. I will scan it as well though. What is next?"
    let answer2b = "Yes everything is all scanned in!"
    let story3 = "Well, since you have yet to receive the Notice of Suit Rights and made sure that it was not in Smokeball or Sharepoint, your only step left is to wait for the EEOC to issue it!"
    let story5 = "Is the Matter on Smokeball changed to Pre-Litigation status and assigned to Allen and Austin?"
    let answer5a = "Yes, I've assigned the Matter to Allen and Austin as well as changing it out of the EEOC and into the Pre-Litigation Stage."
    let answer5b = "No, I didn't know about that. Am I supposed to?"
    let story6 = "Awesome! Well you are on top of things. Go ahead and either hand the papers to Austin so that he can get them to Allen."
    let story7 = "Yes! Go ahead and change the Smokeball Matter to Pre-Litigation by pressing the top right Plus sign, and then assign it to AB and ADA."
    
    
    
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var bottomButton: UIButton!
    @IBOutlet weak var storyTextView: UILabel!
    @IBOutlet weak var restartButton: UIButton!
    
  
    var storyIndex:Int = 1
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Because the player is really bad, they have to restart right away
        restart()
    }

    
    // User presses one of the buttons
    @IBAction func buttonPressed(_ sender: UIButton) {
        if sender.tag == 1 && storyIndex == 1 {
            storyTextView.text = story3
            topButton.isHidden = true
            bottomButton.isHidden = true
            storyIndex = 3
        } else if sender.tag == 2 && storyIndex == 1 {
            storyTextView.text = story2
            topButton.setTitle(answer2a, for: .normal)
            bottomButton.setTitle(answer2b, for: .normal)
            storyIndex = 2
        } else if sender.tag == 1 && storyIndex == 2 {
            storyTextView.text = story5
            topButton.setTitle(answer5a, for: .normal)
            bottomButton.setTitle(answer5b, for: .normal)
            storyIndex = 5
        } else if (sender.tag == 2 || sender.tag == 1) && storyIndex == 2 {
            storyTextView.text = story5
            topButton.isHidden = true
            bottomButton.isHidden = true
            storyIndex = 4
        } else if sender.tag == 1 && storyIndex == 5 {
            storyTextView.text = story6
            topButton.isHidden = true
            bottomButton.isHidden = true
            storyIndex = 6
        } else if sender.tag == 2 && storyIndex == 5 {
            storyTextView.text = story7
            topButton.isHidden = true
            bottomButton.isHidden = true
            storyIndex = 7
        }

    
    if storyIndex == 3 || storyIndex == 4 || storyIndex == 6 || storyIndex == 7 {
        restartButton.isHidden = false
        }
    }
    
    @IBAction func restartPressed(_ sender: UIButton) {
        restart()
    }
    func restart() {
        restartButton.isHidden = true
        storyIndex = 1
        storyTextView.text = story1
        topButton.setTitle(answer1a, for: .normal)
        bottomButton.setTitle(answer1b, for: .normal)
        topButton.isHidden = false
        bottomButton.isHidden = false
    }

}

