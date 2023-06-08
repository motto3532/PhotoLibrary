//
//  ViewController.swift
//  PhotoGallery
//
//  Created by Atto Rari on 2023/06/08.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var pictureImage: UIImageView!
    
    @IBAction func cameraButtonAction(_ sender: Any) {
        let alertController = UIAlertController(title: "confirmation", message: "Please select.", preferredStyle: .actionSheet)
        
        //camera
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "camera", style: .default, handler: {(action) in
                let imagePickerController = UIImagePickerController()
                imagePickerController.sourceType = .camera
                imagePickerController.delegate = self
                self.present(imagePickerController, animated: true)
            })
            alertController.addAction(cameraAction)
        }
        
        //photoLibrary
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let photoLibraryAction = UIAlertAction(title: "photoLibrary", style: .default, handler: {(action) in
                let imagePickerController = UIImagePickerController()
                imagePickerController.sourceType = .photoLibrary
                imagePickerController.delegate = self
                self.present(imagePickerController, animated: true)
            })
            alertController.addAction(photoLibraryAction)
        }
        
        //cancel
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        pictureImage.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        dismiss(animated: true)
    }
    
}

