//
//  CarsStorage.swift
//  Pr1
//
//  Created by Daniil G on 02/04/2019.
//  Copyright © 2019 Daniil G. All rights reserved.
//

import Foundation


class CarsStorage {
    internal private(set) var cars: [Car] = []
    // private let fileURL: URL
    
    private let fileURL: URL = {
        let directory = FileManager.default.homeDirectoryForCurrentUser
        return directory.appendingPathComponent("cars.data")
    }()
    
    init() {
        load()
    }
    
    func append(car: Car) -> Bool{
        assert(!cars.contains(where: {car === $0 }))
        cars.append(car)
        return save()
    }
    
    func remove(car: Car) -> Bool {
        assert(cars.contains(where: {car === $0 }))
        cars.removeAll(where: {
            $0 === car
        })
        return save()
    }
    
    func modify(from oldCar: Car, to newCar: Car) -> Bool {
        assert(cars.contains(where: {oldCar === $0 }))
        if let index = cars.firstIndex(where: {oldCar === $0 }) {
            cars[index] = newCar
            return save()
        }
        return false
    }
    
    private  func save() -> Bool {
        if let data: Data = try? JSONEncoder().encode(cars){
            return nil != (try? data.write(to: fileURL))
        }
        
        return false
    }
    
    @discardableResult
    private func load() -> Bool {
        do {
            let data = try Data.init(contentsOf: fileURL)
            cars =  try JSONDecoder().decode([Car].self, from: data)
            
           // print(cars[0].data)

            return true
        } catch {
            return false
        }
    }
}

