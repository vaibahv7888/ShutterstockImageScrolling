//
//  PictureViewController.swift
//  UpDay
//
//  Created by Vaibhav Bangde on 7/20/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import UIKit
import Swinject
import SwinjectAutoregistration

class ShutterPictureViewController: UIViewController {
    
    private let shutterPictureAssembler = Assembler([ShutterPictureAssembly()],
                                              parent: AppDelegate.applicationAssembler)
    private var shutterPictureViewModel : ShutterPictureViewModelContract!
    
    private var shutterPicture : Asset?
    private var pictureDescription: String?
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var loadingIndicator: UIActivityIndicatorView = {
        let loading = UIActivityIndicatorView(style: .gray)
        loading.translatesAutoresizingMaskIntoConstraints = false
        return loading
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let description = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 21))
        description.numberOfLines = 0
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()
    
    init(picture:Asset, description:String) {
        super.init(nibName: nil, bundle: nil)
        self.shutterPicture = picture
        self.pictureDescription = description
        self.view.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.shutterPictureViewModel = self.shutterPictureAssembler.resolver.resolve(ShutterPictureViewModelContract.self)
        setUpViews()
        loadImage()
        self.navigationController?.hidesBarsOnTap = true
    }
    
    private func setUpViews () {
        self.view.addSubview(loadingIndicator)
        loadingIndicator.centerXAnchor.constraint(equalToSystemSpacingAfter: self.view.centerXAnchor, multiplier: 0).isActive = true
        loadingIndicator.centerYAnchor.constraint(equalToSystemSpacingBelow: self.view.centerYAnchor, multiplier: 0).isActive = true
        loadingIndicator.widthAnchor.constraint(equalToConstant: 50).isActive = true
        loadingIndicator.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loadingIndicator.startAnimating()
        
        self.view.addSubview(imageView)
        imageView.leadingAnchor.constraint(equalToSystemSpacingAfter: self.view.leadingAnchor, multiplier: 0).isActive = true
        imageView.trailingAnchor.constraint(equalToSystemSpacingAfter: self.view.trailingAnchor, multiplier: 0).isActive = true
        imageView.topAnchor.constraint(equalToSystemSpacingBelow: self.view.safeAreaLayoutGuide.topAnchor, multiplier: 0).isActive = true
        imageView.bottomAnchor.constraint(equalToSystemSpacingBelow: self.view.safeAreaLayoutGuide.bottomAnchor, multiplier: 0).isActive = true
        imageView.contentMode = .scaleAspectFit
        let tapImageScrollView = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapImageScrollView)
        
        self.view.addSubview(descriptionLabel)
        descriptionLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50).isActive = true
        self.descriptionLabel.text = self.pictureDescription
    }
    
    @objc func imageTapped(_ sender: UIGestureRecognizer) {
        if self.navigationController?.navigationBar.isHidden == false {
            self.view.backgroundColor = .black
            self.descriptionLabel.textColor = .white
            self.navigationController?.navigationBar.isHidden = true
        } else {
            self.view.backgroundColor = .white
            self.descriptionLabel.textColor = .black
            self.navigationController?.navigationBar.isHidden = false
        }
    }
    
    private func loadImage() {
        guard let shutterPicture = self.shutterPicture else {
            return
        }
        var request = self.shutterPictureViewModel.fetchShutterPicture(url: shutterPicture.url) { (response) in
            guard let image = response else {
                return
            }
            self.loadingIndicator.stopAnimating()
            self.imageView.image = image
        }
    }
}
