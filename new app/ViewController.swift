//
//  ViewController.swift
//  testty
//
//  Created by Shishir on 27/03/23.
//

import UIKit

class ViewController: UIViewController {
    private let imageView:UIImageView = {
        let imageView=UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    private let button : UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Random photos", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemPink
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0,y: 0,width: 300, height: 300)
        imageView.center = view.center
        getRandomphotos()
        view.addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    @objc func didTapButton(){
        getRandomphotos()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(x: 30, y: view.frame.size.height-40-view.safeAreaInsets.bottom, width: view.frame.width-40, height: 50)

    }
    func getRandomphotos(){
        let urlString="https://picsum.photos/300"
        let url=URL(string: urlString)!
        guard let data = try?Data(contentsOf: url)else {
            return
        }
        imageView.image = UIImage(data:data)
        
    }
    
}


