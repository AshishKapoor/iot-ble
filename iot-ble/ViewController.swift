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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var centralManager: CBCentralManager!
//        var peripheral: CBPeripheral
        
        centralManager = CBCentralManager(delegate: self, queue: nil)

        // Start scanning.
        centralManager.scanForPeripherals(withServices: nil, options: nil)
        
        // Stop scan
        // centralManager.stopScan()
        
        // Start connecting
//        centralManager.connect(peripheral, options: nil)
        
    }
    
    // Scan Receive the update of central manager’s state. **Required**
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        print("state: \(central.state)")
    }
    
    func centralManager(central: CBCentralManager,
                        didDiscoverPeripheral peripheral: CBPeripheral,
                        advertisementData: [String : AnyObject],
                        RSSI: NSNumber!) {
        print("peripheral: \(peripheral)")
    }
    
    func centralManagerDidUpdateState(central: CBCentralManager!){
        print("CentralManager is initialized")
        
        switch central.state{
        case CBManagerState.unauthorized:
            print("The app is not authorized to use Bluetooth low energy.")
        case CBManagerState.poweredOff:
            print("Bluetooth is currently powered off.")
        case CBManagerState.poweredOn:
            print("Bluetooth is currently powered on and available to use.")
        default:break
        }
    }
    
    
//    func peripheralManagerDidUpdateState(peripheral: CBPeripheralManager!) {
//        
//        var statusMessage = ""
//        
//        switch peripheral.state {
//            case CBManagerState.poweredOn:
//                statusMessage = "Bluetooth Status: Turned On"
//                
//            case CBManagerState.poweredOff:
//                statusMessage = "Bluetooth Status: Turned Off"
//                
//            case CBManagerState.resetting:
//                statusMessage = "Bluetooth Status: Resetting"
//                
//            case CBManagerState.unauthorized:
//                statusMessage = "Bluetooth Status: Not Authorized"
//                
//            case CBManagerState.unsupported:
//                statusMessage = "Bluetooth Status: Not Supported"
//
//            default:
//                statusMessage = "Bluetooth Status: Unknown"
//        }
//        
//        print(statusMessage)
//        
//        if peripheral.state == CBManagerState.poweredOff {
//            //TODO: Update this property in an App Manager class
//        }
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

