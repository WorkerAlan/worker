//
//  ViewController.swift
//  Alex
//
//  Created by Alan on 2020/10/2.
//

import AVFoundation
import AVKit
import CryptoKit
import JavaScriptCore
import MediaPlayer
import RxSwift
import UIKit

class ViewController: BaseController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func touchesBegan(_: Set<UITouch>, with _: UIEvent?) {
        let vc = BaseWebController(url: "http://h5-al.scyamm.cn/#/short")
        navigationController?.pushViewController(vc, animated: true)
    }

//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let vc = AVPlayerViewController()
//        let url = "https://ptv-as.zbguanxin.cn/media/240/124957.m3u8?expire=1605962164&hash=3e49903b8c30c5b2fd5bd27c4282cc0e"
//        vc.player = AVPlayer(url: URL(string: url)!)
//        vc.player?.play()
//        present(vc, animated: true, completion: nil)
//    }
}
