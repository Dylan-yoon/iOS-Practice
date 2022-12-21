//
//  ViewController.swift
//  AutoLayoutCodeLab
//
//  Created by Dylan_Y on 2022/12/20.
//

import UIKit

class ViewController: UIViewController {
    var constant = CGFloat(100)
    
    let blueLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .blue
        return label
    }()
    
    let Orangebutton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .orange
        return button
    }()
    
    lazy var blueTop = blueLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
    lazy var blueLeading = blueLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
    lazy var blueTrailing = blueLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
//    lazy var blueBottom = blueLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    
    lazy var orangeTop = Orangebutton.topAnchor.constraint(equalTo: blueLabel.bottomAnchor)
    lazy var orangeLeading = Orangebutton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
    lazy var orangeTrailing = Orangebutton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
    lazy var orangeBottom = Orangebutton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    lazy var orangeHeight100 = Orangebutton.heightAnchor.constraint(equalToConstant: 100)
    lazy var orangeHeight200 = Orangebutton.heightAnchor.constraint(equalToConstant: 200)
    lazy var orangeHeight = Orangebutton.heightAnchor.constraint(equalToConstant: 50)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        
        [blueLabel, Orangebutton].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        autolayout()
        Orangebutton.addTarget(self, action: #selector(click), for: .touchUpInside)
    }
    
    func autolayout() {
        blueTop.isActive = true
        blueLeading.isActive = true
        blueTrailing.isActive = true
//        blueBottom.isActive = true
        
        orangeTop.isActive = true
        orangeLeading.isActive = true
        orangeTrailing.isActive = true
        orangeBottom.isActive = true
//        orangeHeight100.isActive = true
        orangeHeight.isActive = true
    }
    
    //MARK: true, false 로 할 때
//    @objc func click() {
//        if constant == CGFloat(100) {
//            constant = CGFloat(200)
//            print("change 200")
//            UIView.animate(withDuration: 1, delay: 0) {
//                self.orangeHeight100.isActive = false
//                self.orangeHeight200.isActive = true
//
////                self.view.layoutIfNeeded()
//                self.view.setNeedsLayout()
//            }
//        } else if constant == CGFloat(200) {
//            constant = CGFloat(100)
//            print("change 100")
//            UIView.animate(withDuration: 1, delay: 0) {
//                self.orangeHeight200.isActive = false
//                self.orangeHeight100.isActive = true
//
////                self.view.layoutIfNeeded()
//                self.view.setNeedsLayout()
//            }
//        }
////            self.view.layoutIfNeeded()
////            self.view.updateConstraints()
////            self.view.updateConstraintsIfNeeded()
////            self.view.setNeedsUpdateConstraints()
//    }
    //MARK: - 이렇게 되면
    @objc func click() {
        if constant == CGFloat(100) {
            constant = CGFloat(200)
            self.view.setNeedsLayout()
            print("change 200")
            orangeHeight.constant = 200
            print(orangeHeight.constant)
            
            UIView.animate(withDuration: 1, delay: 0) {
//                self.orangeHeight.isActive = false
//                self.orangeHeight.isActive = true

                self.view.layoutIfNeeded()
//                self.view.setNeedsLayout()
//                self.view.updateConstraints()
            }
        } else if constant == CGFloat(200) {
            constant = CGFloat(100)
            print("change 100")
            orangeHeight.constant = 100
            print(orangeHeight.constant)
            orangeHeight.constant = 100
            UIView.animate(withDuration: 1, delay: 0) {
//                self.orangeHeight.isActive = false
//                self.orangeHeight.isActive = true

                self.view.layoutIfNeeded()
//                self.view.setNeedsLayout()
//                self.view.updateConstraints()
//                self.view.setNeedsUpdateConstraints()
//                self.view.invalidateIntrinsicContentSize()
            }
        } else {
            print("nothing")
        }
    }
    
}
