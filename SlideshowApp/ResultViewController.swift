//
//  ResultViewController.swift
//  SlideshowApp2
//
//  Created by 和泉淳子 on 2022/09/01.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var ResultImgview: UIImageView!
    
    var Myimg:UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ResultImgview.image=Myimg
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
