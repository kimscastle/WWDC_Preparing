//
//  File.swift
//  please
//
//  Created by uiskim on 2022/04/24.
//
import SwiftUI

struct EndButton: View {
    @Binding var index: Int
    var body: some View {
        VStack {
            HStack {
                Button {
                    exit(0)
                } label: {
                    Text("Quit")
                        .font(.title)
                        .foregroundColor(Color.black)
                }
                .frame(width: 300, height: 100, alignment: .center)
                .background(Color.gray)
                .cornerRadius(20)
                .padding()
            }
        }
    }
}
