//
//  DataBaseHelper.swift
//  CameraApp
//
//  Created by 
//

import UIKit
import CoreData

//class DataBaseHelper: UIViewController {
//
//    static let shareInstance = DataBaseHelper()
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//    func saveImage(data: Data){
//        let imageInstance = Photo(context: context)
//        imageInstance.storedImage = data
//        do {
//            try context.save()
//        } catch {
//            print(error)
//        }
//    }
//
//    func fetchImage() -> [Photo] {
//        var fetchingImage = [Photo]()
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Image")
//        do {
//            fetchingImage = try context.fetch(fetchRequest) as! [Photo]
//        } catch {
//            print("Error while fetching the image")
//        }
//        return fetchingImage
//    }
//}
