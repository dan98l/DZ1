//
//  Car.swift
//  Pr1
//
//  Created by Daniil G on 02/04/2019.
//  Copyright © 2019 Daniil G. All rights reserved.
//

import Foundation

class Car: Codable { // Decodable, Encodable
    enum Property : String {
        case year
        case model
        case manufactures
        case `class`
        case bodyType
        
        static let allValue: [Property] = [.year, .model, .manufactures, .class, .bodyType]
    }
   // private
    var data: [String] = []
    
    init() {
        data = [String](repeating: "", count: Property.allValue.count)
        
    }
    
    subscript(property: Property) -> String {
        get{
            if let index =  Property.allValue.firstIndex(of: property), index < data.count {
                return data[index]
            }
            return ""
        }
        
        set{
            if let index =  Property.allValue.firstIndex(of: property) {
                while data.count <= index {
                    data.append("")
                }
                data[index] = newValue
            }
        }
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        data = try container.decode([String].self)
        
    }
    
    func encode(to encoder: Encoder) throws {
        var container = try encoder.singleValueContainer()
        try container.encode(data)
    }
}




//extension Car: Hashable {
//    static func == (lns: Car, rhs: Car) -> Bool{
//        return lns.year == rhs.year
//        && lns.year == rhs.year
//        && lns.model == rhs.model
//        && lns.manufactures == rhs.manufactures
//        && lns.class == rhs.class
//        && lns.bodyType == rhs.bodyType
//    }
//
//    public func hash(into hasher: inout Hasher){
//        hasher.combine(year)
//        hasher.combine(model)
//        hasher.combine(manufactures)
//        hasher.combine(self.class)
//        hasher.combine(bodyType)
//    }
//}
