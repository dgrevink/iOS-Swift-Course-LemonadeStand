//
//  Game.swift
//  LemonadeStand
//
//  Created by David Grevink on 2014-11-15.
//  Copyright (c) 2014 David Grevink. All rights reserved.
//

import Foundation
import UIKit

class Game {
    // Game Vars
    var money = 10
    var lemons = 1
    var ice = 1
    var currentWeather = "Mild" // Cold, Mild, Warm
    
    var boughtLemons = 0
    var boughtIceCubes = 0
    var priceLemons = 2
    var priceIceCubes = 1
    
    var mixLemons = 0
    var mixIceCubes = 0
    
    func buyLemons() -> Bool {
        if ( self.money < priceLemons) {
            return false
        }
        else {
            self.money -= priceLemons
            self.boughtLemons += 1
            return true
        }
    }
    
    func sellLemons() -> Bool {
        if ( self.boughtLemons < 1) {
            return false
        }
        else {
            self.money += priceLemons
            self.boughtLemons -= 1
            return true
        }
    }
    
    func buyIceCubes() -> Bool {
        if ( self.money < priceIceCubes) {
            return false
        }
        else {
            self.money -= priceIceCubes
            self.boughtIceCubes += 1
            return true
        }
    }
    
    func sellIceCubes() -> Bool {
        if ( self.boughtIceCubes < 1) {
            return false
        }
        else {
            self.money += priceIceCubes
            self.boughtIceCubes -= 1
            return true
        }
    }

    func addLemons() -> Bool {
        if ( self.lemons < 1) {
            return false
        }
        else {
            self.lemons--
            self.mixLemons++
            return true
        }
    }
    
    func removeLemons() -> Bool {
        if ( self.mixLemons < 1) {
            return false
        }
        else {
            self.lemons++
            self.mixLemons--
            return true
        }
    }
    
    func addIce() -> Bool {
        if ( self.ice < 1) {
            return false
        }
        else {
            self.ice--
            self.mixIceCubes++
            return true
        }
    }
    
    func removeIce() -> Bool {
        if ( self.mixIceCubes < 1) {
            return false
        }
        else {
            self.ice++
            self.mixIceCubes--
            return true
        }
    }
    
    func getNextWeather() -> String {
        var weather = Int(arc4random_uniform(UInt32(3)))
        var weathers: [String] = [ "Cold", "Mild", "Warm"]
        self.currentWeather = weathers[weather]
        return weathers[weather]
    }
    
    func startDay() -> String {
        if self.mixLemons == 0 || self.mixIceCubes == 0 {
            return "You need at least 1 lemon and ice cube"
        }
        let lemonadeRatio = CGFloat( self.mixLemons / self.mixIceCubes )
        var customersTotals = Int(arc4random_uniform(UInt32(11)))
        switch (self.currentWeather) {
            case "Cold":
                customersTotals -= 1
                if customersTotals < 0 { customersTotals = 0 }
                break;
            case "Warm":
                customersTotals += 4
                break;
            default:
                break;
        }
        println("Total customers: \(customersTotals)")
        for counter in 0...customersTotals {
            let preference = Double(arc4random_uniform(UInt32(101))) / 100
            
            print("# \(counter) Preference is: \(preference) and ratio = \(lemonadeRatio)")

            if preference < 0.4 && lemonadeRatio > 1 {
                self.money += 1
                println("...Paid")
            }
            else if preference > 0.6 && lemonadeRatio < 1 {
                self.money += 1
                println("...Paid")
            }
            else if preference <= 0.6 && preference >= 0.4 && lemonadeRatio == 1 {
                self.money += 1
                println("...Paid")
            }
            else {
                println("...else statement evaluating")
            }
        }
        
        self.lemons += self.boughtLemons
        self.ice += self.boughtIceCubes
        self.boughtLemons = 0
        self.boughtIceCubes = 0
        
        self.mixLemons = 0
        self.mixIceCubes = 0
        
        return "Day finished !"
    }
    
    func reset() {
        self.money = 10
        self.ice = 1
        self.lemons = 1
        
        self.boughtLemons = 0
        self.boughtIceCubes = 0

        self.mixLemons = 0
        self.mixIceCubes = 0
    }

    
}