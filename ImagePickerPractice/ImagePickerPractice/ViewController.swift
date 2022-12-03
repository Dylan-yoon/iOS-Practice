//
//  ViewController.swift
//  ImagePickerPractice
//
//  Created by DylanY on 2022/12/02.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var buttonLabel: UIButton!
    @IBOutlet weak var imageview: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        imageview.image = UIImage(systemName: "applelogo")
        imageview.tintColor = .cyan
        imageview.layer.backgroundColor = UIColor.black.cgColor
        buttonLabel.tintColor = .cyan
    }
    
    @IBAction func tapButton(_ sender: Any) {
        let alert = UIAlertController(title: "선택", message: nil, preferredStyle: .actionSheet)
        
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        let camera = UIAlertAction(title: "카메라", style: .default) { [weak self] (_) in
            self?.presentCamera()
        }
        let album = UIAlertAction(title: "앨범", style: .default) { [weak self] (_) in
            self?.presentAlbum()
        }
        
        alert.addAction(cancel)
        alert.addAction(camera)
        alert.addAction(album)
        
        present(alert, animated: true, completion: nil)
    }
    
    //카메라사용 메서드
    func presentCamera() {
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.delegate = self
        vc.allowsEditing = true
        vc.cameraFlashMode = .on
        
        present(vc, animated: true, completion: nil)
    }
}


//MARK: -앨범 사용 메서드
extension ViewController: UINavigationControllerDelegate {
    func presentAlbum() {
        let vc = UIImagePickerController()
        
        // --> 영상도 사용이 가능하다!
        UIImagePickerController.availableMediaTypes(for: .photoLibrary)
        
        /*
         순서대로 SourceType 0, 1, 2
         photoLibrary가 기본값이다!
         
        photoLibrary
        camera
        savedPhotosAlbum
         */
        
        // 어떤 타입
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            // delegate 설정
            vc.delegate = self
            
            // 기본값 써도 그만 안써도 그만, defualt - .photoLibrary
            vc.sourceType = .photoLibrary
            
            // editing 모드를 설정
            vc.allowsEditing = true
            
            // 호출 시 앨범 View를 띄워줘야함! -> delegate dismiss 구현으로 뷰 내려준다.
            present(vc, animated: true, completion: nil)
        } else {
            print("앨범을 사용 할 수 없음")
        }
    }
}

//MARK: -UIImagePickerControllerDelegate
extension ViewController: UIImagePickerControllerDelegate {
    
    //MARK: didFinishPickingMediaWithInfo: media를 pick 했을 때 실행되는 메서드
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
    ) {
        dismiss(animated: true, completion: nil)
        guard let image = info[.editedImage] as? UIImage else { return }
        self.imageview.image = image
        print("선택 했썽")
    }
    
    //MARK: imagePickerControllerDidCancel: 취소 버튼 누를때 실행되는 메서드
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
        print("취소 했썽")
    }
}
