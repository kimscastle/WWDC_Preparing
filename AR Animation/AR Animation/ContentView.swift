//
//  ContentView.swift
//  AR Animation
//
//  Created by uiskim on 2022/04/22.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    @State private var model = try! Solarsystem.load_Solarsystem()
    var body: some View {
        ZStack {
            ARViewContainer(model: $model)
            VStack {
                Spacer()
                Button(action: {
                    model.notifications.anim.post()
                }, label: {
                    Text("Animation")
                        .foregroundColor(.white)
                        .font(.title)
                })
                .frame(width: 200, height: 50)
                .background(Color.red)
                .cornerRadius(15)
                .padding()
            }
            Image("Group")
                .resizable()
                .scaledToFit()
                .frame(width: 600, height: 600)
        }.edgesIgnoringSafeArea(.all)
    }
}
 

struct ARViewContainer: UIViewRepresentable {
    @Binding var model: Solarsystem._Solarsystem
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        _ = try! Solarsystem.load_Solarsystem()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(model)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
