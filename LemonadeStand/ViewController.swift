//
//  ViewController.swift
//  LemonadeStand
//
//  Created by David Grevink on 2014-11-15.
//  Copyright (c) 2014 David Grevink. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Game Engine
    var g = Game()
    
    // UI Labels
    @IBOutlet weak var labelMoney: UILabel!
    @IBOutlet weak var labelAvailableLemons: UILabel!
    @IBOutlet weak var labelAvailableIceCubes: UILabel!
    @IBOutlet weak var labelBoughtLemons: UILabel!
    @IBOutlet weak var labelBoughtIceCubes: UILabel!
    @IBOutlet weak var labelMixLemons: UILabel!
    @IBOutlet weak var labelMixIceCubes: UILabel!
    @IBOutlet weak var imageViewWeather: UIImageView!

    // UI Buttons
    @IBAction func buttonAddBoughtLemons(sender: UIButton) {
        if ( !g.buyLemons() ) {
            showAlertWithText(message: "No more money !")
        }
        updateControls()
    }
    
    @IBAction func buttonRemoveBoughtLemons(sender: UIButton) {
        if ( !g.sellLemons() ) {
            showAlertWithText(message: "No more lemons in order !")
        }
        updateControls()
    }

    @IBAction func buttonAddBoughtIceCubes(sender: UIButton) {
        if ( !g.buyIceCubes() ) {
            showAlertWithText(message: "No more money !")
        }
        updateControls()
    }
    
    @IBAction func buttonRemoveBoughtIceCubes(sender: UIButton) {
        if ( !g.sellIceCubes() ) {
            showAlertWithText(message: "No more Ice Cubes in order !")
        }
        updateControls()
    }
    
    @IBAction func buttonAddMixLemons(sender: UIButton) {
        if ( !g.addLemons() ) {
            showAlertWithText(message: "No more lemons, buy some if you can !")
        }
        updateControls()
    }
    
    @IBAction func buttonRemoveMixLemons(sender: UIButton) {
        if ( !g.removeLemons() ) {
            showAlertWithText(message: "No more lemons for recipe !")
        }
        updateControls()
    }
    
    @IBAction func buttonAddMixIceCubes(sender: UIButton) {
        if ( !g.addIce() ) {
            showAlertWithText(message: "No more ice, buy some if you can !")
        }
        updateControls()
    }
    
    @IBAction func buttonRemoveMixIceCubes(sender: UIButton) {
        if ( !g.removeIce() ) {
            showAlertWithText(message: "No more for ice recipe !")
        }
        updateControls()
    }
    
    @IBAction func buttonStartDay(sender: UIButton) {
        var result = false
        var message = ""
        
        showAlertWithText(message: g.startDay())
        imageViewWeather.image = UIImage(named: g.getNextWeather())
        updateControls()
    }
    
    @IBAction func reset(sender: UIButton) {
        g.reset();
        imageViewWeather.image = UIImage(named: g.getNextWeather())
        updateControls()
    }
    
    
    func updateControls() {
        labelMoney.text = "$ \(g.money)"
        labelAvailableLemons.text = "\(g.lemons) Lemons"
        labelAvailableIceCubes.text = "\(g.ice) Ice Cubes"

        labelBoughtLemons.text = "\(g.boughtLemons)"
        labelBoughtIceCubes.text = "\(g.boughtIceCubes)"
        
        labelMixLemons.text = "\(g.mixLemons)"
        labelMixIceCubes.text = "\(g.mixIceCubes)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Helper Functions
    func showAlertWithText(header: String = "Warning", message: String) {
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    

}

