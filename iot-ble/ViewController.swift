//
//  ViewController.swift
//  iot-ble
//
//  Created by Ashish Kapoor on 04/01/17.
//  Copyright © 2017 Ashish Kapoor. All rights reserved.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController, CBCentralManagerDelegate {

    var centralManager: CBCentralManager!
    
    var peripheral: CBPeripheral!

    override func viewDidLoad() {
        super.viewDidLoad()
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    // Scan Receive the update of central manager’s state. **Required**
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        print("state: \(central.state)")
        centralManager.scanForPeripherals(withServices:nil, options: nil)

    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        print("peripheral: \(peripheral)")
    }
    
    func centralManagerDidUpdateState(central: CBCentralManager!){
        print("CentralManager is initialized")
        
        switch central.state {
            
        case CBManagerState.unauthorized:
            print("The app is not authorized to use Bluetooth low energy.")
            
        case CBManagerState.poweredOff:
            print("Bluetooth is currently powered off.")
            
        case CBManagerState.poweredOn:
            print("Bluetooth is currently powered on and available to use.")

            centralManager.scanForPeripherals(withServices: nil, options: nil)

        default:break
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

