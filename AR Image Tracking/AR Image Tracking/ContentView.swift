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
    @State var index = 0
    private var backgroundColors = ["one", "two", "three", "four"]
    var body: some View {
        return ZStack {
            ARViewContainer(anchorEntity: $anchorEntity).edgesIgnoringSafeArea(.all)
            if index == 1 {
                Image("black")
            }else if index == 2 {
                Image("gray")
            }else if index == 3 {
                Image("Group")
            }
            NextButton(index: $index)
                .transition(.move(edge: .bottom))
        }

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
                let imageModel = createImage(anchor: imageAnchor, name: imageName!)
                let anchorEntity = AnchorEntity(anchor: imageAnchor)
                anchorEntity.addChild(imageModel)
                arViewContainer.anchorEntity.addChild(anchorEntity)
            }
        }
    }

    }
    func createImage(anchor: ARImageAnchor, name: String) -> ModelEntity {
        let size = anchor.referenceImage.physicalSize
        let mesh = MeshResource.generatePlane(width: Float(size.width), depth: Float(size.height))
        var imageMaterial = SimpleMaterial()
        switch name {
        case "aa":
            let texture = try! TextureResource.load(named: "talkWithAA")
            imageMaterial.baseColor = MaterialColorParameter.texture(texture)
        case "bb":
            let texture = try! TextureResource.load(named: "talkWithBB")
            imageMaterial.baseColor = MaterialColorParameter.texture(texture)
        case "kk":
            let texture = try! TextureResource.load(named: "talkWithKK")
            imageMaterial.baseColor = MaterialColorParameter.texture(texture)
        default:
            print("no image")
        }
        let imageEntity = ModelEntity(mesh: mesh, materials: [imageMaterial])
        imageEntity.transform.translation.z = -Float(size.height)
        return imageEntity
    }



