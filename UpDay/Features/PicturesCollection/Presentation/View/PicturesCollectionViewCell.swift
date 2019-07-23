//
//  PicturesCollectionViewCell.swift
//  UpDay
//
//  Created by Vaibhav Bangde on 7/17/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import UIKit

class PicturesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var PictureImageView: UIImageView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    weak var picturesViewModel : PicturesViewModel?
    
    var pictureAsset : Asset?
    var imageRequest : ImageRequest?
    
    func configure(pictureVM: PicturesViewModel, picture: Asset) {
        self.pictureAsset = picture
        self.picturesViewModel = pictureVM
        resetCell()
        downloadImage()
    }
    
    func resetCell() {
        self.PictureImageView.image = nil
        if let request = imageRequest {
            request.cancel()
        }
    }
    
    func downloadImage() {
        loadingIndicator.startAnimating()
        guard let pictureVM = self.picturesViewModel, let picAsset = self.pictureAsset else {
            return
        }
        imageRequest = pictureVM.fetchImageInteractor.fetchImage(for: picAsset.url) { (response) in
            guard let image = response else {
                return
            }
            self.populateImage(with: image)
        }
    }
    
    func populateImage(with image:UIImage) {
        loadingIndicator.stopAnimating()
        self.PictureImageView.image = image
    }
}
