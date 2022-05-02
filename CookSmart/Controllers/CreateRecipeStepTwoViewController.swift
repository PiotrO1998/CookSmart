//
//  CreateRecipeViewController.swift
//  CookSmart
//
//  Created by Piotr Obara on 01/05/2022.
//

import UIKit

class CreateRecipeStepTwoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var recipeName: String!
    var recipeCookTime: Int!
    var recipeLevel: String!
    var recipeServings: Int!
    
    var recipeImageString: String?
    
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var addImageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionTextView.layer.cornerRadius = 5
        descriptionTextView.layer.borderWidth = 1
        descriptionTextView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        recipeImage.contentMode = .scaleToFill
        recipeImage.layer.cornerRadius = 5
        
        addImageButton.menu = pickerMenu()
        addImageButton.showsMenuAsPrimaryAction = true
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        
        performSegue(withIdentifier: "segue-to-create-recipe-step-three", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segue-to-create-recipe-step-three" {
            
            let destination = segue.destination as! CreateRecipeStepThreeViewController
            destination.recipeDescription = descriptionTextView.text
            
            if recipeImageString != nil {
                
                destination.recipeImageString = self.recipeImageString
            }
        }
    }
    
    //Image Source Menu
    func pickerMenu() -> UIMenu {
        
        let cameraSource = UIAction(title: "Camera",
                                    image: UIImage(systemName: "camera.fill")) { _ in
            
            self.openPicker(type: .camera)
        }
        
        let librarySource = UIAction(title: "Photo Library",
                                     image: UIImage(systemName: "photo.fill")) { _ in
            
            self.openPicker(type: .photoLibrary)
        }
        
        return UIMenu(title: "Image Source", image: nil, identifier: nil,
                      options: [], children: [cameraSource, librarySource])
    }
    
    fileprivate func openPicker(type: UIImagePickerController.SourceType) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = type
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        
        if let image = info[.editedImage] {
            
            recipeImage.image = image as! UIImage
            recipeImageString = self.encodeImage(image: image as! UIImage)
            
            picker.dismiss(animated: true, completion: nil)
        }
    }
    
    
    func encodeImage(image: UIImage?) -> String? {
        
        let orginaalImage = image
        let imageDataa = orginaalImage?.jpegData(compressionQuality: 1)
        
        return imageDataa?.base64EncodedString()
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
