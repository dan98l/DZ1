//
//  Console.swift
//  Pr1
//
//  Created by Daniil G on 02/04/2019.
//  Copyright © 2019 Daniil G. All rights reserved.
//

import Foundation

class Colsole {
    
    var outFlag = 1;
    
    func menu() -> Void {
        while outFlag != 0 {
            
            print("Сделайте ваш выбор, выбрав цифру: \n1.Вывести все автомобили \n2.Добавить автомобиль \n3.Удалить автомобиль \n4.Изменить автомобиль \n5.Выход")
            
            let string = readLine()
            if string == "1" {
                allCarsWrite()
                menu()
            } else if string == "2" {
                addCarsWrite()
            } else if string == "3" {
                dellCarsWrite()
            } else if string == "4" {
                changeCarsWrite()
            }else if string == "5" {
                outFlag = 0
            } else {
                print("Ошибка! Введите цифру от 1 до 5!\n")
            }
        }
    }
    
    func allCarsWrite(){
        
        let carsFromData = CarsStorage()
        var indexData = 0
        var indexCars = 0
        var indexAuto = indexCars + 1
        
        print("-------------------------------")
        while indexCars < carsFromData.cars.count {
            print("Авто №\(indexAuto)")
            for property in Car.Property.allValue {
                print("\(property.rawValue) = \(carsFromData.cars[indexCars].data[indexData])")
                if indexData < carsFromData.cars[0].data.count {
                    indexData += 1
                }
            }
            print("-------------------------------")
            if indexCars < carsFromData.cars.count {
                indexData = 0
                indexCars += 1
                indexAuto += 1
            }
        }
    }
    
    func addCarsWrite(){
        print("Введите параметры автомобиля:")
        
        let car = Car()
        
        for property in Car.Property.allValue {
            print("Введите параметр \(property) для автомобиля: ")
            let string = readLine()
            car[property] = string!
            print(car[property])
        }
        
        let tmp = CarsStorage()
        tmp.append(car: car)
        
        menu()
    }
    
    func dellCarsWrite(){
        print("Выберите номер автомобиля, который вы хотите удалить:")
        allCarsWrite();
        
        let chouse = readLine()
        
        let carsFromData = CarsStorage()
        carsFromData.remove(car: carsFromData.cars[Int(chouse!)!-1])
            
        allCarsWrite();
        
        menu()
    }
    
    func changeCarsWrite(){
     
        print("Выберите номер автомобиля, который вы хотите изменить:")
        allCarsWrite();
        
        let chouseAuto = readLine()

        print("Выберите номер поля, который вы хотите изменить:")
        
        let carsFromData = CarsStorage()
        var indexData = 0
        var indexPole = 1
        
        print("Авто №\(chouseAuto!)")
        for property in Car.Property.allValue {
            print("\(indexPole) = \(property.rawValue) = \(carsFromData.cars[Int(chouseAuto!)!-1].data[indexData])")
            if indexData < carsFromData.cars[0].data.count {
                indexData += 1
                indexPole += 1
            }
        }

        
        let chousePole = readLine()
        print("Введите новое значение: ")
        let newValuePole = readLine()
        var car = Car()
        
        car = carsFromData.cars[Int(chouseAuto!)!-1]
        car.data[Int(chousePole!)!-1] = newValuePole!
        
        //carsFromData.cars[Int(chouseAuto!)!-1].data[Int(chousePole!)!-1] = newValuePole!
        carsFromData.modify(from: carsFromData.cars[Int(chouseAuto!)!-1], to: car)
        allCarsWrite()
        
        menu()
    }
}
