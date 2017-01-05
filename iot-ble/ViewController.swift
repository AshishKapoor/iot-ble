//
//  ViewController.swift
//  iot-ble
//
//  Created by Ashish Kapoor on 04/01/17.
//  Copyright © 2017 Kapoor.tech All rights reserved.
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
        print("State of the Bluetooth: \(central.state)\n")
        centralManager.scanForPeripherals(withServices:nil, options: nil)
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        print("peripheral's Name: \(peripheral.name!)")
        print("peripheral's Identifier: \(peripheral.identifier)")
        print("Advertisment Data: \(advertisementData)")
        print("RSSI Number: \(RSSI)\n")
        
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        centralManager.connect(peripheral, options: nil)
    }
    
    // Called when it succeeded
    func centralManager(central: CBCentralManager, didConnectPeripheral peripheral: CBPeripheral) {
        print("connected!")
    }
    
    // Called when it failed
    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        print("failed…")
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
    }
}

