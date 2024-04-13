//
//  BMLoginViewController.swift
//  BeautyMakeup
//
//  Created by 刘冉 on 2024/4/12.
//

import UIKit
import HandyJSON

class BMLoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .orange
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        NetworkRequest(NetworkAPI.cityList, modelType: MovieCity.self) { res, res1 in
            CocoaLog.debug(res.avatar ?? "")
            CocoaLog.debug(res1.dataJSON ?? [:])
        }
    }
    
    deinit {
        deallocPrint()
    }
}

struct MovieCity: HandyJSON {
    
    var title: String?
    var fans_count: String?
    var avatar: String?
}
