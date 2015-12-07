//
//  ViewController.swift
//  HigeCamera
//
//  Created by Ooguchi Taiga on 2015/12/05.
//  Copyright © 2015年 Ooguchi Taiga. All rights reserved.
//

import UIKit
import CoreImage

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    var cameraView : UIImageView!
    
    var buttonCameraStart : UIButton!
    var buttonSavePic : UIButton!
    var buttonAlbum : UIButton!
    
    var label : UILabel!
    var mySwicth: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UIImageViewを作成する.
        cameraView = UIImageView(frame: CGRectMake(0,0,(self.view.bounds.width/10)*9,(self.view.bounds.height/10)*7))
        // 画像の表示する座標を指定する.
        cameraView.layer.position = CGPoint(x: (self.view.bounds.width/10)*5, y: (self.view.bounds.height/10)*4)
        // UIImageViewをViewに追加する.
        self.view.addSubview(cameraView)
        
        
        // 撮影開始Buttonを生成する.
        buttonCameraStart = UIButton()
        // サイズを設定する.
        buttonCameraStart.frame = CGRectMake(0,0,100,40)
        // 背景色を設定する.
        buttonCameraStart.backgroundColor = UIColor.redColor()
        // 枠を丸くする.
        buttonCameraStart.layer.masksToBounds = true
        // タイトルを設定する(通常時).
        buttonCameraStart.setTitle("Start", forState: UIControlState.Normal)
        buttonCameraStart.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        // コーナーの半径を設定する.
        buttonCameraStart.layer.cornerRadius = 20.0
        // ボタンの位置を指定する.
        buttonCameraStart.layer.position = CGPoint(x: (self.view.frame.width/10)*2, y:(self.view.frame.height/10)*9)
        // タグを設定する.
        buttonCameraStart.tag = 1
        // イベントを追加する.
        buttonCameraStart.addTarget(self, action: "cameraStart:", forControlEvents: .TouchUpInside)
        // ボタンをViewに追加する.
        self.view.addSubview(buttonCameraStart)
        
        // 写真保存Buttonを生成する.
        buttonSavePic = UIButton()
        // サイズを設定する.
        buttonSavePic.frame = CGRectMake(0,0,100,40)
        // 背景色を設定する.
        buttonSavePic.backgroundColor = UIColor.redColor()
        // 枠を丸くする.
        buttonSavePic.layer.masksToBounds = true
        // タイトルを設定する(通常時).
        buttonSavePic.setTitle("Save", forState: UIControlState.Normal)
        buttonSavePic.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        // コーナーの半径を設定する.
        buttonSavePic.layer.cornerRadius = 20.0
        // ボタンの位置を指定する.
        buttonSavePic.layer.position = CGPoint(x: (self.view.frame.width/10)*5, y:(self.view.frame.height/10)*9)
        // タグを設定する.
        buttonSavePic.tag = 2
        // イベントを追加する.
        buttonSavePic.addTarget(self, action: "savePic:", forControlEvents: .TouchUpInside)
        // ボタンをViewに追加する.
        self.view.addSubview(buttonSavePic)
        
        
        // 撮影開始Buttonを生成する.
        buttonAlbum = UIButton()
        // サイズを設定する.
        buttonAlbum.frame = CGRectMake(0,0,100,40)
        // 背景色を設定する.
        buttonAlbum.backgroundColor = UIColor.redColor()
        // 枠を丸くする.
        buttonAlbum.layer.masksToBounds = true
        // タイトルを設定する(通常時).
        buttonAlbum.setTitle("Album", forState: UIControlState.Normal)
        buttonAlbum.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        // コーナーの半径を設定する.
        buttonAlbum.layer.cornerRadius = 20.0
        // ボタンの位置を指定する.
        buttonAlbum.layer.position = CGPoint(x: (self.view.frame.width/10)*8, y:(self.view.frame.height/10)*9)
        // タグを設定する.
        buttonAlbum.tag = 3
        // イベントを追加する.
        buttonAlbum.addTarget(self, action: "showAlbum:", forControlEvents: .TouchUpInside)
        // ボタンをViewに追加する.
        self.view.addSubview(buttonAlbum)
        
        
        // Labelを作成.
        label = UILabel(frame: CGRectMake(0,0,300,40))
        // 背景をオレンジ色にする.
        label.backgroundColor = UIColor.orangeColor()
        // 枠を丸くする.
        label.layer.masksToBounds = true
        // コーナーの半径.
        label.layer.cornerRadius = 20.0
        // Labelに文字を代入.
        label.text = "Tap the [Start] to take a picture"
        // 文字の色を白にする.
        label.textColor = UIColor.whiteColor()
        // Textを中央寄せにする.
        label.textAlignment = NSTextAlignment.Center
        // 配置する座標を設定する.
        label.layer.position = CGPoint(x: (self.view.bounds.width/10)*4,y: (self.view.bounds.height/10)*8)
        // Viewの背景色を青にする.
        self.view.backgroundColor = UIColor.cyanColor()
        // ViewにLabelを追加.
        self.view.addSubview(label)
        
        
        // Swicthを作成する.
        mySwicth = UISwitch()
        mySwicth.layer.position = CGPoint(x: (self.view.bounds.width/10)*9,y: (self.view.bounds.height/10)*8)
        // Swicthの枠線を表示する.
        mySwicth.tintColor = UIColor.blackColor()
        // SwitchをOnに設定する.
        mySwicth.on = true
        // SwitchをViewに追加する.
        self.view.addSubview(mySwicth)

        
    }
    
    // カメラの撮影開始
    internal func cameraStart(sender : UIButton) {
        
        let sourceType:UIImagePickerControllerSourceType = UIImagePickerControllerSourceType.Camera
        // カメラが利用可能かチェック
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
            // インスタンスの作成
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.presentViewController(cameraPicker, animated: true, completion: nil)
            
        }
        else{
            label.text = "error"
            
        }
    }
    
    //　撮影が完了時した時に呼ばれる
    func imagePickerController(imagePicker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            let ciImage  = CIImage(CGImage: pickedImage.CGImage!)
            let ciDetector = CIDetector(ofType:CIDetectorTypeFace
                ,context:nil
                ,options:[
                    CIDetectorAccuracy:CIDetectorAccuracyHigh,
                    CIDetectorSmile:true
                ]
            )
            let features = ciDetector.featuresInImage(ciImage)
            
            UIGraphicsBeginImageContext(CGSizeMake(pickedImage.size.width, pickedImage.size.height))
            pickedImage.drawInRect(CGRectMake(0,0,pickedImage.size.width,pickedImage.size.height))
            
            for feature in features{
                
                //context
                let drawCtxt = UIGraphicsGetCurrentContext()
                
                //face
                let face = feature as! CIFaceFeature
                var faceRect = face.bounds
                faceRect.origin.y = pickedImage.size.height - faceRect.origin.y - faceRect.size.height
                CGContextSetStrokeColorWithColor(drawCtxt, UIColor.redColor().CGColor)
                if mySwicth.on {
                    CGContextStrokeRect(drawCtxt,faceRect)
                }
                
                //leftEye
                if((face.hasLeftEyePosition)){
                    let leftEyeRectY = pickedImage.size.height - face.leftEyePosition.y
                    let leftEyeRect  = CGRectMake(face.leftEyePosition.x - 5,leftEyeRectY - 5,10,10)
                    CGContextSetStrokeColorWithColor(drawCtxt, UIColor.blueColor().CGColor)
                    if mySwicth.on {
                        CGContextStrokeRect(drawCtxt,leftEyeRect)
                        
                    }
                }
                
                //rightEye
                if((face.hasRightEyePosition)){
                    let rightEyeRectY = pickedImage.size.height - face.rightEyePosition.y
                    let rightEyeRect  = CGRectMake(face.rightEyePosition.x - 5,rightEyeRectY - 5,10,10)
                    CGContextSetStrokeColorWithColor(drawCtxt, UIColor.blueColor().CGColor)
                    if mySwicth.on {
                        CGContextStrokeRect(drawCtxt,rightEyeRect)
                    }
                }
                
                //mouse
                if(face.hasMouthPosition){
                    let mouseRectY = pickedImage.size.height - face.mouthPosition.y
                    let mouseRect  = CGRectMake(face.mouthPosition.x - 5,mouseRectY - 5,10,10)
                    CGContextSetStrokeColorWithColor(drawCtxt,UIColor.blueColor().CGColor)
                    if mySwicth.on {
                        CGContextStrokeRect(drawCtxt,mouseRect)
                    }
                }
                
                //hige
                let mouseRectY = pickedImage.size.height - face.mouthPosition.y
                //ヒゲの横幅は顔の4/5程度
                let higeWidth  = faceRect.size.width * 4/5
                let higeHeight = higeWidth * 0.4 // 元画像は100:50ぐらい
                let adjustValue = ((face.leftEyePosition.y + face.rightEyePosition.y)/2 - face.mouthPosition.y)/6 // ヒゲを口の少し上にするための調整値
                
                // ヒゲ画像を傾ける
//                let higeImg = UIImage(named:"hige.png")                
                print("faceAngle:\(face.faceAngle)")
                let myRotateHige = UIImageView()
                myRotateHige.image = UIImage(named:"hige.png")
                let angle: CGFloat = CGFloat((face.faceAngle * Float(M_PI)) / 180.0)
                let xt = (mouseRectY - higeHeight/2 - adjustValue) * sin(angle) + (face.mouthPosition.x - higeWidth/2) * cos(angle)
                let yt = (mouseRectY - higeHeight/2 - adjustValue) * cos(angle) - (face.mouthPosition.x - higeWidth/2) * sin(angle)

                print("angle : \(angle)")
                myRotateHige.transform = CGAffineTransformMakeRotation(angle)
                print(myRotateHige.transform)
                
                let higeRect = CGRectMake(xt, yt, higeWidth, higeHeight)
//
//                let higeRect  = CGRectMake(face.mouthPosition.x - higeWidth/2,mouseRectY - higeHeight/2 - adjustValue,higeWidth,higeHeight)

                CGContextConcatCTM(drawCtxt, myRotateHige.transform)
                CGContextDrawImage(drawCtxt,higeRect,myRotateHige.image!.CGImage)
                

            }
            let drawedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            cameraView.contentMode = .ScaleAspectFit
            cameraView.image = drawedImage
            
        }
        
        //閉じる処理
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        label.text = "Tap the [Save] to save a picture"
        
    }
    
    // 撮影がキャンセルされた時に呼ばれる
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
        label.text = "Canceled"
    }
    
    
    // 写真を保存
    internal func savePic(sender : UIButton) {
        let image:UIImage! = cameraView.image
        
        if image != nil {
            UIImageWriteToSavedPhotosAlbum(image, self, "image:didFinishSavingWithError:contextInfo:", nil)
        }
        else{
            label.text = "image Failed !"
        }
        
    }
    
    // 書き込み完了結果の受け取り
    func image(image: UIImage, didFinishSavingWithError error: NSError!, contextInfo: UnsafeMutablePointer<Void>) {
        print("1")
        
        if error != nil {
            print(error.code)
            label.text = "Save Failed !"
        }
        else{
            label.text = "Save Succeeded"
        }
    }
    
    // アルバムを表示
    internal func showAlbum(sender : UIButton) {
        let sourceType:UIImagePickerControllerSourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary){
            // インスタンスの作成
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.presentViewController(cameraPicker, animated: true, completion: nil)
            
            label.text = "Tap the [Start] to save a picture"
        }
        else{
            label.text = "error"
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
