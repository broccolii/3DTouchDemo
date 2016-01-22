//
//  PreviewViewController.swift
//  3DTouchDemo
//
//  Created by Broccoli on 16/1/22.
//  Copyright © 2016年 Broccoli. All rights reserved.
//

import UIKit

class PreviewViewController: UIViewController {

    @IBOutlet var previewLabel: UILabel!
    var previewText: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        previewLabel.text = previewText
    }
}

extension PreviewViewController {
    @available(iOS 9.0, *)
    override func previewActionItems() -> [UIPreviewActionItem] {
  
        let action1 = UIPreviewAction(title: "action1", style: .Default) { (action, viewController) -> Void in
            debugPrint(action)
            debugPrint(viewController)
            debugPrint("taped action1")
        }
        
        /// 会多一个 小勾勾 😊
        let action2 = UIPreviewAction(title: "action2", style: .Selected) { _,_ in
            debugPrint("taped action2")
        }
        
        /// 会变红色
        let action3 = UIPreviewAction(title: "action3", style: .Destructive) { _,_ in
            debugPrint("taped action3")
        }

        return [action1, action2, action3]
    }
}
