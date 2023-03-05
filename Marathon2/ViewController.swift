//
//  ViewController.swift
//  Marathon2
//
//  Created by юра on 4.03.23.
//

import UIKit

class ViewController: UIViewController {
    
    let cornerRadius: CGFloat = 6
    let constraints = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
    var buttonAnimator: UIViewPropertyAnimator?
    let modalViewController = ModalViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var filled = UIButton.Configuration.filled()
        filled.image = UIImage(systemName: "arrow.right.circle.fill")
        filled.imagePlacement = .trailing
        filled.imagePadding = 8

        let firstButton = UIButton(configuration: filled, primaryAction: nil)
        firstButton.setTitle("First Button", for: .normal)
        firstButton.configuration?.contentInsets = constraints
        firstButton.layer.cornerRadius = cornerRadius
        view.addSubview(firstButton)
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
                ])
        firstButton.addTarget(self, action: #selector(scaleDownButton(_:)), for: .touchDown)
        firstButton.addTarget(self, action: #selector(scaleUpButton(_:)), for: .touchUpInside)
        
        let secondButton = UIButton(configuration: filled, primaryAction: nil)
        secondButton.setTitle("Second Medium Button", for: .normal)
        secondButton.configuration?.contentInsets = constraints
        secondButton.layer.cornerRadius = cornerRadius
        view.addSubview(secondButton)
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            secondButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 90),
            secondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
                ])
        secondButton.addTarget(self, action: #selector(scaleDownButton(_:)), for: .touchDown)
        secondButton.addTarget(self, action: #selector(scaleUpButton(_:)), for: .touchUpInside)

        
        let thirdButton = UIButton(configuration: filled, primaryAction: nil)
        thirdButton.setTitle("Third Button", for: .normal)
        thirdButton.configuration?.contentInsets = constraints
        thirdButton.layer.cornerRadius = cornerRadius
        view.addSubview(thirdButton)
        thirdButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            thirdButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
            thirdButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
                ])
        thirdButton.addTarget(self, action: #selector(scaleDownButton(_:)), for: .touchDown)
        thirdButton.addTarget(self, action: #selector(scaleUpButton(_:)), for: .touchUpInside)
        thirdButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
    }
  
    @objc func buttonPressed(_ sender: UIButton) {
        let secondVC = modalViewController
        secondVC.view.backgroundColor = .white
        present(secondVC, animated: true, completion: nil)
       }
    
    @objc func scaleDownButton(_ sender: UIButton) {
        buttonAnimator = UIViewPropertyAnimator(duration: 0.1, curve: .easeInOut, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        })
        buttonAnimator?.startAnimation()
        sender.isHighlighted = false
    }
    
    @objc func scaleUpButton(_ sender: UIButton) {
        buttonAnimator?.stopAnimation(true)
        buttonAnimator?.finishAnimation(at: .current)
        sender.transform = CGAffineTransform.identity
        sender.isHighlighted = false
    }
}



