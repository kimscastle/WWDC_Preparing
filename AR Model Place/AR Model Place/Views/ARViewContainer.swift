//
//  ARViewContainer.swift
//  AR Model Place
//
//  Created by uiskim on 2022/04/23.
//

import SwiftUI
import RealityKit
import ARKit

struct ARViewContainer: UIViewRepresentable {
    @Binding var selectedModel: Model?
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal, .vertical]
        arView.session.run(config)
        arView.addCoaching()
//        arView.setupTouch()
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        if let model = selectedModel?.modelEntity{
            let anchor = AnchorEntity(plane: .any)
            
            
            let modelEntity = ModelEntity()
            modelEntity.addChild(model)
            
            modelEntity.generateCollisionShapes(recursive: true)
            uiView.installGestures(.all, for: modelEntity)
            
            anchor.addChild(modelEntity)
            uiView.scene.anchors.append(anchor)
        }
    }
    
}

extension ARView: ARCoachingOverlayViewDelegate {
    func addCoaching(){
        let coachingOverLay = ARCoachingOverlayView()
        coachingOverLay.delegate = self
        coachingOverLay.session = self.session
        coachingOverLay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        coachingOverLay.goal = .anyPlane
        self.addSubview(coachingOverLay)
    }
    
//    func setupTouch() {
//        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapAction(_:)))
//        self.addGestureRecognizer(tap) //self는 ARView를 뜻함
//        let longTouch = UILongPressGestureRecognizer(target: self, action: #selector(self.longTouchAction(_:)))
//        self.addGestureRecognizer(longTouch)
    }
    
//    @objc
//    func longTouchAction(_ sender: UILongPressGestureRecognizer? = nil) {
//        guard let touchInView = sender?.location(in: self), let rayResult = self.ray(through: touchInView) else { return }
//        let results = self.scene.raycast(origin: rayResult.origin, direction: rayResult.direction)
//        if let firstResult = results.first {
//            let model = firstResult.entity
//
//            model.removeFromParent()
//        }
//
//    }
    
//    @objc
//    func tapAction(_ sender: UITapGestureRecognizer? = nil) {
//        guard let touchInView = sender?.location(in: self), let rayResult = self.ray(through: touchInView) else { return }
//        let results = self.scene.raycast(origin: rayResult.origin, direction: rayResult.direction)
//        if let firstResult = results.first {
//            let model = firstResult.entity
//
//            var trans = Transform()
//
//            trans.rotation = simd_quatf(angle: Float.pi, axis: SIMD3(x: 0, y: 1, z: 0))
//            model.move(to: trans, relativeTo: model, duration: 2)
//        }
//    }
//}

//
//struct ARViewContainer_Previews: PreviewProvider {
//    static var previews: some View {
//        ARViewContainer()
//    }
//}
