//
//  Model.swift
//  AR Model Place
//
//  Created by uiskim on 2022/04/23.
//

import SwiftUI
import Foundation
import RealityKit
import Combine

class Model: Identifiable {
    var id = UUID()
    var modelName: String
    var image: Image {
        Image(modelName)
    }
    var modelEntity: Entity?
    var cancellabel: AnyCancellable? = nil //combine사용하려면 선언해줘야함
    
    init(modelName: String) {
        self.modelName = modelName
        cancellabel = Entity.loadAsync(named: modelName)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { (error) in
                print("error to load\(error)")
            }, receiveValue: { (modelEntity) in
                print("succes to load")
                self.modelEntity = modelEntity
                self.modelEntity?.name = modelName
            })
    }
}


class ModelData {
    var models: [Model] = {
        var file = FileManager()
        guard let path = Bundle.main.resourcePath, let files = try? file.contentsOfDirectory(atPath: path)
        else {return[]}
        var modelData: [Model] = [Model]()
        
        for item in files where item.hasSuffix("usdz") {
            let imageName = item.replacingOccurrences(of: ".usdz", with: "")
            let model = Model(modelName: imageName)
            modelData.append(model)
        }
        return modelData
    }()
}
