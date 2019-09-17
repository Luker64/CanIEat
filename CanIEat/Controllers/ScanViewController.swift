//
//  ScanViewController.swift
//  CanIEat
//
//  Created by Student on 17/09/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit
import AVFoundation

protocol TelaScan{
    func changeScanned()
}

class ScanViewController: UIViewController,  AVCaptureMetadataOutputObjectsDelegate {

    @IBOutlet weak var scanPreview: UIView!
    var resString = String()
    var scanned = false
    var scanTypes = [AVMetadataObject.ObjectType.qr, AVMetadataObject.ObjectType.aztec, AVMetadataObject.ObjectType.code128, AVMetadataObject.ObjectType.code39, AVMetadataObject.ObjectType.code39Mod43, AVMetadataObject.ObjectType.code93, AVMetadataObject.ObjectType.ean13, AVMetadataObject.ObjectType.ean8, AVMetadataObject.ObjectType.itf14]
    
    enum error: Error{
        case noCameraAvailable
        case videoInputInitFail
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do{
            try scanQR()
        }catch{
            print("Failed")
        }
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if metadataObjects.count > 0 {
            let machineReadableCode = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
            if scanTypes.contains( machineReadableCode.type) && !scanned {
                scanned = true
                resString = machineReadableCode.stringValue!
                performSegue(withIdentifier: "scanned", sender: self)
            }
        }
    }
    
    func scanQR() throws{
        scanned = false
        let avCaptureSession = AVCaptureSession()
        
        guard let avCaptureDevice = AVCaptureDevice.default(for: AVMediaType.video)else{
            print("no camera")
            throw error.noCameraAvailable
            
        }
        
        guard let avCaptureInput = try? AVCaptureDeviceInput(device: avCaptureDevice) else{
            print("Fail")
            throw error.videoInputInitFail
        }
        
        let avCaptureMetadataOutput = AVCaptureMetadataOutput()
        
        avCaptureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        
        avCaptureSession.addInput(avCaptureInput)
        avCaptureSession.addOutput(avCaptureMetadataOutput)
        
        avCaptureMetadataOutput.metadataObjectTypes = scanTypes
        
        let avCaptureVideoPreviewLayer = AVCaptureVideoPreviewLayer(session: avCaptureSession)
        
        avCaptureVideoPreviewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        
        avCaptureVideoPreviewLayer.frame = scanPreview.bounds
        
        self.scanPreview.layer.addSublayer(avCaptureVideoPreviewLayer)
        
        avCaptureSession.startRunning()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "scanned"{
            let destination = segue.destination as! ScanResultViewController
            destination.prod = ProductDAO.find(resString)
            destination.delegate = self
        }
        
    }
    
    
}

extension ScanViewController : TelaScan{
    func changeScanned() {
        scanned = false
    }
}
