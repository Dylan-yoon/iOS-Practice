//
//  ViewController.swift
//  PriorityLab
//
//  Created by Dylan_Y on 2022/12/20.
//

import UIKit

class ViewController: UIViewController {
    let firstLabel: UILabel = {
        let label = UILabel()
        label.text = "가만히 있는놈"
        label.backgroundColor = .brown
        
        return label
    }()
    
    let secondLabel: UILabel = {
        let label = UILabel()
        label.text = "이것은 찌그러지지 않지만 그래도 쭉쭉 뻗어나가서 없어지는 마법의 텍스트"
        label.backgroundColor = .blue
        
        return label
    }()
    
    let thirdLabel: UILabel = {
        let label = UILabel()
        label.text = "누르지마ㅠㅠ"
        label.backgroundColor = .systemPink
        
        return label
    }()
    
    let topLabel: UILabel = {
        let label = UILabel()
        label.text = "그냥 있지요 위에서"
        label.backgroundColor = .darkGray
        
        return label
    }()
    
    lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [firstLabel, secondLabel, thirdLabel])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        
        return stackView
    }()
    
    lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [topLabel, horizontalStackView])
        stackView.backgroundColor = .lightGray
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        autolayout()
        
        printHuggingPriority()
        print()
        printCompressionPriority()
    }
    
    func autolayout() {
        view.addSubview(verticalStackView)
        
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            verticalStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200)
        ])
    }
    
    func printHuggingPriority() {
        print("HUGGING---------------------------")
        print("firstLabel : ", firstLabel.contentHuggingPriority(for: .horizontal))
        print("secondLabel : ", secondLabel.contentHuggingPriority(for: .horizontal))
        print("thirdLabel : ", thirdLabel.contentHuggingPriority(for: .horizontal))
        print("topLabel : ", topLabel.contentHuggingPriority(for: .horizontal))
        print("verticalStackView : ", verticalStackView.contentHuggingPriority(for: .horizontal))
    }
    
    func printCompressionPriority() {
        print("COMPRESSION-----------------------")
        print("firstLabel : ", firstLabel.contentCompressionResistancePriority(for: .horizontal))
        print("secondLabel : ", secondLabel.contentCompressionResistancePriority(for: .horizontal))
        print("thirdLabel : ", thirdLabel.contentCompressionResistancePriority(for: .horizontal))
        print("topLabel : ", topLabel.contentCompressionResistancePriority(for: .horizontal))
        print("verticalStackView : ", verticalStackView.contentCompressionResistancePriority(for: .horizontal))
    }
}
