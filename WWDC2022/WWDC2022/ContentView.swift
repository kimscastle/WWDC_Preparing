//
//  ContentView.swift
//  AR Image Tracking
//
//  Created by uiskim on 2022/04/24.
//

import SwiftUI
import RealityKit
import ARKit

struct ContentView : View {
    @State private var anchorEntity = AnchorEntity()
    var body: some View {
        return ARViewContainer(anchorEntity: $anchorEntity).edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    @Binding var anchorEntity: AnchorEntity
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        let config = ARImageTrackingConfiguration()
        
        if let images = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: Bundle.main) {
            config.trackingImages = images
            config.maximumNumberOfTrackedImages = images.count
        }
        
        arView.session.run(config)
        arView.session.delegate = context.coordinator
         
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        
        uiView.scene.anchors.append(anchorEntity)
        
    }
    
}



class Coordinator: NSObject, ARSessionDelegate {
    var arViewContainer: ARViewContainer!
    init(_ control: ARViewContainer) {
        self.arViewContainer = control
    }
    func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
        for anchor in anchors {
            if let imageAnchor = anchor as? ARImageAnchor {
                let imageName = imageAnchor.referenceImage.name
                //Experience Model load
                let model = loadExperience(name: imageName!)
                let anchorEntity = AnchorEntity(anchor: imageAnchor)
                anchorEntity.addChild(model)
                arViewContainer.anchorEntity.addChild(anchorEntity)
            }
        }
    }
    func loadExperience(name: String) -> ModelEntity {
        let modelEntity = ModelEntity()
        switch name {
        case "aa":
            let model = try? Experience.loadAa()
            modelEntity.addChild(model!)
        case "bb":
            let model = try? Experience.loadBb()
            modelEntity.addChild(model!)
        case "kk":
            let model = try? Experience.loadKk()
            modelEntity.addChild(model!)
        default:
            print("no image")
        }
        return modelEntity
    }

}
