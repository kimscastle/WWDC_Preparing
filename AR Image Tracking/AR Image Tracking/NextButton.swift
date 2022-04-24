//
//  NextButton.swift
//  AR Image Tracking
//
//  Created by uiskim on 2022/04/24.
//

import SwiftUI

struct NextButton: View {
    @Binding var index: Int
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Button {
                    if index == 0 {
                        index = 0
                    }else {
                        index-=1
                    }
                    print(index)
                } label: {
                    Text("Back")
                        .font(.title)
                        .foregroundColor(Color.black)
                }
                .frame(width: 150, height: 100, alignment: .center)
                .background(Color.orange)
                .cornerRadius(20)
                .padding()
                Button {
                    if index == 3 {
                        index = 3
                    }else {
                        index+=1
                    }
                    print(index)
                } label: {
                    Text("Go")
                        .font(.title)
                        .foregroundColor(Color.black)
                }
                .frame(width: 150, height: 100, alignment: .center)
                .background(Color.red)
                .cornerRadius(20)
                .padding()
            }
        }
    }
}
