//
//  ViewController.swift
//  SlideshowApp2
//
//  Created by 和泉淳子 on 2022/09/01.
//
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var slidebtn: UIButton!//再生・停止ボタン
    @IBOutlet weak var Backbtn: UIButton!//戻る
    @IBOutlet weak var Nextbtn: UIButton!//進む
    
    var timer:Timer!
    var index:Int=0
    var imgArray:[UIImage]=[UIImage(named: "item01")!,UIImage(named: "item02")!,UIImage(named: "item03")!,UIImage(named: "item04")!,UIImage(named: "item05")!,UIImage(named: "item06")!]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image=imgArray[0]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
            if timer != nil{
                timer.invalidate()
                timer=nil
                slidebtn.setTitle("再生", for: .normal)
                Nextbtn.isEnabled=true
                Backbtn.isEnabled=true
            }
        resultViewController.Myimg = imageView.image
    }
        
    @IBAction func tappedNext(_sender:Any){
        changeNextImage()
    }

    @IBAction func tappedBack(_ sender: Any) {
        index-=1
        if(index<0){
            index=5
        }
        imageView.image=imgArray[index]
    }
    
    @IBAction func slideshow(_ sender: Any) {
        if(timer==nil){
            timer=Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImg), userInfo: nil, repeats: true)
            slidebtn.setTitle("停止", for: .normal)
            Nextbtn.isEnabled=false
            Backbtn.isEnabled=false
        }else{
            timer.invalidate()
            timer=nil
            slidebtn.setTitle("再生", for: .normal)
            Nextbtn.isEnabled=true
            Backbtn.isEnabled=true
        }
    }
    
    @objc func changeImg(){
        changeNextImage()
    }
    
    func changeNextImage(){
        index+=1
        if(index==imgArray.count){
            index=0
        }
        imageView.image=imgArray[index]
    }
    
    @IBAction func tapAction(_ sender: Any) {
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
}

