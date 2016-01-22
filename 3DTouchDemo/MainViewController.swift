//
//  ViewController.swift
//  3DTouchDemo
//
//  Created by Broccoli on 16/1/22.
//  Copyright © 2016年 Broccoli. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        ensure3DTouch()
    }
}

// MARK: - private method
extension MainViewController {
    func ensure3DTouch(){
        guard #available(iOS 9.0, *) else {
            debugPrint("只支持 iOS 9.0 以上版本")
            return
        }
        guard traitCollection.forceTouchCapability == .Available else {
            debugPrint("不支持 3D Touch")
            return
        }
        registerForPreviewingWithDelegate(self, sourceView: view)
        debugPrint("支持 3D Touch")
    }
}

// MARK: - UITableViewDateSource
let CellIdentifier = "TableViewCell"
extension MainViewController {
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier, forIndexPath: indexPath)
        cell.textLabel!.text = "第 \(indexPath.row) 行 Cell"
        return cell
    }
}

// MARK: - UIViewControllerPreviewingDelegate
extension MainViewController: UIViewControllerPreviewingDelegate {
    // 轻按 预览界面
    func previewingContext(previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        guard #available(iOS 9.0, *) else {
            debugPrint("只支持 iOS 9.0 以上版本")
            return nil
        }
        
        guard let indexPath = tableView.indexPathForRowAtPoint(location) else {
                return nil
        }
        
        let originRect = tableView.cellForRowAtIndexPath(indexPath)!.frame
        previewingContext.sourceRect = view.convertRect(originRect, fromView: tableView)
        
        /// 这里不能直接获取到 控件 还未创建
        let previewVC = storyboard!.instantiateViewControllerWithIdentifier("PreviewViewController") as! PreviewViewController
        previewVC.previewText = "你点击了 \(indexPath.row) 行 Cell"
        
        return previewVC
    }
    
    // 重按 进入页面
    func previewingContext(previewingContext: UIViewControllerPreviewing, commitViewController viewControllerToCommit: UIViewController) {
//        可以选择跳转正常业务流程的界面
//        performSegueWithIdentifier("gotoDetailViewController", sender: nil)
        // 也可以选择直接使用 preview view controller 
        showViewController(viewControllerToCommit, sender: nil)
    }
}