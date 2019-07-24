//
//  ViewController.swift
//  UpDay
//
//  Created by Vaibhav Bangde on 7/14/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import UIKit
import Alamofire
import Swinject
import SwinjectAutoregistration

class PicturesViewController: UIViewController {

    @IBOutlet weak var picturesCollectionView: UICollectionView!
    
    private let picturesAssembler = Assembler([PicturesCollectionAssembly()],
                                           parent: AppDelegate.applicationAssembler)
    private var picturesViewModel : PicturesViewModelContract!
    
    private var isRefreshing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.picturesViewModel = self.picturesAssembler.resolver.resolve(PicturesViewModelContract.self)
        self.getAuthenticationToken()
    }
    
    func getAuthenticationToken() {
        DispatchQueue.global(qos: .background).async {
            self.picturesViewModel.getAuthenticationToken(completion: { (response) in
                DispatchQueue.main.async {
                    if response {
                        self.refreshImages()
                    }
                }
            })
        }
    }
    
    func refreshImages() {
        isRefreshing = true
        DispatchQueue.global(qos: .background).async {
            self.picturesViewModel.beginBatchFetchPictures { (response) in
                self.isRefreshing = false
                guard let isDone = response else {
                    return
                }
                DispatchQueue.main.async {
                    if isDone {
                        self.picturesCollectionView.reloadData()
                    }
                }
            }
        }
    }
}

extension PicturesViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.picturesViewModel.getNumberOfItemsInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PicturesCell", for: indexPath) as? PicturesCollectionViewCell {
                if let asset = self.picturesViewModel.getLargeThumnailsPicture(for: indexPath.row) {
                    collectionCell.configure(pictureVM: self.picturesViewModel as! PicturesViewModel, picture: asset)
                    return collectionCell
            }
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath)
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if offsetY > contentHeight - scrollView.frame.height && !isRefreshing && self.picturesViewModel.pageIndex <= 50 {
            self.refreshImages()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let asset = self.picturesViewModel.getPreview1000(for: indexPath.row),
            let pictureDescription = self.picturesViewModel.getPictureDescription(for: indexPath.row) else {
            return
        }
        let vc = ShutterPictureViewController(picture: asset, description: pictureDescription)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - CollectionView Flow Layout
extension PicturesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let viewSize = view.bounds.size
        let spacing: CGFloat = 10
        let width = (viewSize.width / 2) - spacing
        let height = (viewSize.width / 3) - spacing
        return CGSize(width: width, height: height)
    }
    
}
