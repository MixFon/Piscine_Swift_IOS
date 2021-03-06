////
////  Article+CoreDataClass.swift
////  widraugr2020
////
////  Created by Михаил Фокин on 03.12.2020.
////
////
//
//import Foundation
//import CoreData
//
//// Данное расширение создалось автоматически XCode смотри конспект CoreData
//// objc для использовани в Objective-C
//@objc(Article)
//public class Article: NSManagedObject {
//    // NSManaged говорить, что инициализация и управление данным полем будет управляться во время выполнения
//    // NSManaged используется только с CoreData
//    @NSManaged public var content: String?
//    @NSManaged public var creation_date: Date?
//    @NSManaged public var image: Data?
//    @NSManaged public var language: String?
//    @NSManaged public var modification_date: Date?
//    @NSManaged public var title: String?
//    public override var description: String {return
//        "content \(String(describing: content))" +
//        "creation_date \(String(describing: creation_date))" +
//        "image \(String(describing: image))" +
//        "language \(String(describing: language))" +
//        "modification_date \(String(describing: modification_date))" +
//        "title \(String(describing: title))"
//    }
//    //let temp: Article
//    
//}
//
//extension Article {
//    // Данная функция возавращает все оббъекты.
//    @nonobjc public class func fetchRequest() -> NSFetchRequest<Article> {
//        return NSFetchRequest<Article>(entityName: "Article")
//    }
//}
