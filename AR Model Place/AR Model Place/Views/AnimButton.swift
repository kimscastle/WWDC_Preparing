//
//  AnimButton.swift
//  AR Model Place
//
//  Created by uiskim on 2022/04/24.
//

import SwiftUI

struct AnimButton: View {

    @Binding var selectedModel: Model?
    
    var body: some View {
        if let model = selectedModel?.modelEntity {
            HStack {
                Spacer()
                Button {
                    if !model.availableAnimations.isEmpty {
                        model.playAnimation(model.availableAnimations[0])
                        selectedModel = nil

                    }
                } label: {
                    Text("Animation")   
                        .foregroundColor(.white)
                        .font(.title)
                }
                .frame(width: 150, height: 50, alignment: .center)
                .background(Color.orange)
                .cornerRadius(20)
                .padding()
                
                Button {
                    model.removeFromParent()
                    selectedModel = nil
                } label: {
                    Text("Delete")
                        .foregroundColor(.white)
                        .font(.title)
                }
                .frame(width: 150, height: 50, alignment: .center)
                .background(Color.red)
                .cornerRadius(20)
                .padding()
                
                Spacer()
            }
        }
        

    }
}

