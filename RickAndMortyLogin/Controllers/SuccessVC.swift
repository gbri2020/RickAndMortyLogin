//
//  SuccessVC.swift
//  RickAndMortyLogin
//
//  Created by Gustavs Brigmanis on 18/04/2018.
//  Copyright © 2018 Gustavs Brigmanis. All rights reserved.
//

import UIKit
import Firebase


class SuccessVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        //dataBasePlaya()
        displayImageFromDB()

    }

    
    func dataBasePlaya() {
        
        let storageRef = Storage.storage().reference()
        // right now is not dynamic. only available for uno image. Should be given a specific id
        
        let tempImage = storageRef.child("images/myimage.jpeg")
        
        let imageId = UIImage(named: "myimage.jpeg")
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        tempImage.putData(UIImageJPEGRepresentation(imageId!, 0.2)!, metadata: metadata) { (data, error) in
            if error != nil {
                print("there is an error in put data \(error?.localizedDescription)")
            } else {
                print("upload is done")
            }
        }
        
    }
    
    func displayImageFromDB() {
        
        let storageRef = Storage.storage().reference()
        let tempImageDisplay = storageRef.child("images/myimage.jpeg")
        tempImageDisplay.getData(maxSize: 1 * 1024 * 1024) { (data, error) in
            if error != nil {
                print(error?.localizedDescription)
            } else {
                self.imageView.image = UIImage(data: data!)
            }
        }
        
        
    }
   

}
