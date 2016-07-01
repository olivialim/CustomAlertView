//
//  CustomAlertViewController.swift
//
//
//  Created by Olivia Lim on 6/28/16.
//  Copyright © 2016 Olivia Lim. All rights reserved.
//

import UIKit

// MARK: Init and Lifecycle -
final class CustomAlertViewController: UIViewController {
    struct Constants {
        static let ContainerWidth: CGFloat = UIScreen.mainScreen().bounds.width * 0.75
        static let EdgeMargin: CGFloat = 15.0
        static let Spacing: CGFloat = 7.0
        static let ButtonHeight: CGFloat = 40.0
    }
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLabel: SizeableLabel = {
        let view = SizeableLabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.systemFontOfSize(20)
        view.textColor = .blackColor()
        view.textAlignment = .Center
        view.numberOfLines = 0
        view.text = NSLocalizedString("Title Label", comment: "Title")
        view.backgroundColor = .yellowColor()
        return view
    }()
    
    private let aButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        let title = NSLocalizedString("I am a button", comment: "Button title")
        view.setTitle(title, forState: .Normal)
        view.titleLabel?.font = UIFont.systemFontOfSize(15)
        view.backgroundColor = .purpleColor()
        view.frame.size.height = Constants.ButtonHeight
        return view
    }()
    
    private var containerViewHeightConstraint: NSLayoutConstraint?
    
    private var layoutInitialized = false
    private var contentView: SizeableLabel? = nil
    private let contentTitle: String
    
    private var contentWidth: CGFloat {
        return Constants.ContainerWidth - Constants.EdgeMargin * 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        wire()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if !layoutInitialized {
            if let contentView = contentView {
                layoutContentView(contentView)
                layoutInitialized = true
            }
        }
    }
    
    init(title: String) {
        self.contentTitle = title
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Content View -
extension CustomAlertViewController {
    
    func addContentView(view: SizeableLabel) {
        guard layoutInitialized else {
            contentView = view
            return
        }
        
        contentView = view
        layoutContentView(view)
    }
    
    private func layoutContentView(view: SizeableLabel) {
        let contentViewSize = view.calculateHeight(contentWidth)
        view.backgroundColor = .magentaColor()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(view)
        self.view.addConstraint(NSLayoutConstraint(
            item: view,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: titleLabel,
            attribute: .Bottom,
            multiplier: 1.0,
            constant: Constants.EdgeMargin)
        )
        self.view.addConstraint(NSLayoutConstraint(
            item: view,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .Width,
            multiplier: 1.0,
            constant: contentWidth)
        )
        self.view.addConstraint(NSLayoutConstraint(
            item: view,
            attribute: .CenterX,
            relatedBy: .Equal,
            toItem: containerView,
            attribute: .CenterX,
            multiplier: 1.0,
            constant: 0)
        )
        
        self.view.addConstraint(NSLayoutConstraint(
            item: view,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: titleLabel,
            attribute: .Bottom,
            multiplier: 1.0,
            constant: Constants.Spacing)
        )
        
        self.view.addConstraint(NSLayoutConstraint(
            item: view,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: aButton,
            attribute: .Top,
            multiplier: 1.0,
            constant: -Constants.Spacing)
        )
        
        let titleLabelSize = titleLabel.calculateHeight(contentWidth)
        
        containerViewHeightConstraint?.constant =  contentViewSize.height + Constants.EdgeMargin * 2 + titleLabelSize.height + Constants.ButtonHeight + 10;
    }
}

//MARK: - Button Functionality -
extension CustomAlertViewController {
    
}

// MARK: - Layout -
extension CustomAlertViewController {
    
    private func layout() {
        containerView.backgroundColor = .orangeColor()
        
        view.addSubview(containerView)
        view.addConstraint(NSLayoutConstraint(
            item: containerView,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .Width,
            multiplier: 1.0,
            constant: Constants.ContainerWidth)
        )
        
        containerViewHeightConstraint = NSLayoutConstraint(
            item: containerView,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .Height,
            multiplier: 1.0,
            constant: 0
        )
        
        if let constraint = containerViewHeightConstraint {
            view.addConstraint(constraint)
        }
        
        view.addConstraint(NSLayoutConstraint(
            item: containerView,
            attribute: .CenterX,
            relatedBy: .Equal,
            toItem: view,
            attribute: .CenterX,
            multiplier: 1.0,
            constant: 0)
        )
        
        view.addConstraint(NSLayoutConstraint(
            item: containerView,
            attribute: .CenterY,
            relatedBy: .Equal,
            toItem: view,
            attribute: .CenterY,
            multiplier: 1.0,
            constant: 0)
        )
        
        
        
        
        
        containerView.addSubview(titleLabel)
        
        view.addConstraint(NSLayoutConstraint(
            item: titleLabel,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: containerView,
            attribute: .Top,
            multiplier: 1.0,
            constant: Constants.EdgeMargin)
        )
        
        view.addConstraint(NSLayoutConstraint(
            item: titleLabel,
            attribute: .CenterX,
            relatedBy: .Equal,
            toItem: containerView,
            attribute: .CenterX,
            multiplier: 1.0,
            constant: 0)
        )
        
        view.addConstraint(NSLayoutConstraint(
            item: titleLabel,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .Width,
            multiplier: 1.0,
            constant: contentWidth)
        )
        
        
        
        
        
        containerView.addSubview(aButton)
        
        view.addConstraint(NSLayoutConstraint(
            item: aButton,
            attribute: .CenterX,
            relatedBy: .Equal,
            toItem: containerView,
            attribute: .CenterX,
            multiplier: 1.0,
            constant: 0)
        )
        
        view.addConstraint(NSLayoutConstraint(
            item: aButton,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: containerView,
            attribute: .Bottom,
            multiplier: 1.0,
            constant: -Constants.EdgeMargin)
        )
        
        view.addConstraint(NSLayoutConstraint(
            item: aButton,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .Width,
            multiplier: 1.0,
            constant: contentWidth)
        )
        
    }
}

// MARK: - Wire -
extension CustomAlertViewController {
    
    private func wire() {
        
        //Wire up actions
        
    }
}

//MARK: - Label Height -
extension UILabel{
    
    func requiredHeight() -> CGFloat{
        
        let label:UILabel = UILabel(frame: CGRectMake(0, 0, self.frame.width, CGFloat.max))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.ByWordWrapping
        label.font = self.font
        label.text = self.text
        
        label.sizeToFit()
        
        return label.frame.height
    }
}