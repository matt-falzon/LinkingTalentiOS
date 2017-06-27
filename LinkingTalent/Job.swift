//
//  Job.swift
//  LinkingTalent
//
//  Created by Matthew Falzon on 2017-06-26.
//  Copyright © 2017 Matthew Falzon. All rights reserved.
//

import Foundation

class Job: NSObject {
    var title: String?
    var location: String?
    var bounty: Int?
    var payMin: String?
    var payMax: String?
    var key: String?
    var company: String?
    var category: String?
    var imageUrl: String?
    var imageName: String?
    var employmentType: String?
    var postDate: String?
    var id: String?
    var desc: String?
    
    init(dictionary: [String: Any]) {
        self.title = dictionary["title"] as? String ?? ""
        self.location = dictionary["location"] as? String ?? ""
        self.bounty = dictionary["bounty"] as? Int ?? 0
        self.payMin = dictionary["payMin"] as? String ?? ""
        self.payMax = dictionary["payMax"] as? String ?? ""
        self.key = dictionary["key"] as? String ?? ""
        self.company = dictionary["company"] as? String ?? ""
        self.category = dictionary["category"] as? String ?? ""
        self.imageUrl = dictionary["imageUrl"] as? String ?? ""
        self.imageName = dictionary["imageName"] as? String ?? ""
        self.employmentType = dictionary["employmentType"] as? String ?? ""
        self.postDate = dictionary["postDate"] as? String ?? ""
        self.id = dictionary["id"] as? String ?? ""
        self.desc = dictionary["description"] as? String ?? ""
    }
}
