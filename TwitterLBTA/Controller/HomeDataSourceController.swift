//
//  HomeDataSourceController.swift
//  TwitterLBTA
//
//  Created by 马头 on 2018/6/20.
//  Copyright © 2018年 马琪青. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class HomeDataSourceController: DatasourceController {
    
    let errorMessageLabel: UILabel = {
        let label = UILabel()
        label.text = "error.."
        label.isHidden = true
        label.textAlignment = .center
        return label
    }()
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBarItems()
        view.addSubview(errorMessageLabel)
        errorMessageLabel.fillSuperview()
        
        collectionView?.backgroundColor = UIColor(r: 232, g: 236, b: 242)
        
//        let homeDataSource = HomeDataSource()
//        self.datasource = homeDataSource
        
        Service.sharedInstance.fetchHomeFeed { (homeDataSource, error) in
            if let err = error {
                self.errorMessageLabel.isHidden = false
                
                if let apiError = err as? APIError<Service.JSONError> {
                    if apiError.response?.statusCode != 200 {
                        self.errorMessageLabel.text = "status was not 200"
                    }
                }
                return
            }
            self.datasource = homeDataSource
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            guard let user = self.datasource?.item(indexPath) as? User else {
                return .zero
            }
            
            let estimatedHeight = estimatedHeightForText(user.bioText)
            return CGSize(width: view.frame.width, height: estimatedHeight + 64)
            
        }else if indexPath.section == 1{
            guard let tweet = self.datasource?.item(indexPath) as? Tweet else {
                return .zero
            }
            
            let estimatedHeight = estimatedHeightForText(tweet.message)
            return CGSize(width: view.frame.width, height: estimatedHeight + 74)
        }
        return CGSize(width: view.frame.size.width, height: 200)
    }
    // caculate height
    private func estimatedHeightForText(_ text: String) -> CGFloat {
        let approximateWidthOfBioTextView = view.frame.width - 12 - 50 - 12 - 2
        let size = CGSize(width: approximateWidthOfBioTextView, height: 1000)
        let attributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)]
        let estimatedFrame = NSString(string: text).boundingRect(with: size, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attributes, context: nil)
        return estimatedFrame.height
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if (section == 1){
            return CGSize.zero
        }
        return CGSize(width: view.frame.size.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if (section == 1){
            return CGSize.zero
        }
        return CGSize(width: view.frame.size.width, height: 64)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    
}
