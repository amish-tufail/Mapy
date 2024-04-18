//
//  LocationMapAnnotationView.swift
//  Mapy
//
//  Created by Amish on 18/04/2024.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    let accentColor = Color(.accent)
    
    var body: some View {
        VStack(spacing: 0.0) {
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30.0, height: 30.0)
                .font(.headline)
                .foregroundStyle(.white)
                .padding(6.0)
                .background(Color.accentColor)
                .mask(Circle())
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.accent)
                .rotationEffect(.degrees(180.0))
                .frame(width: 10.0, height: 10.0)
                .offset(y: -3)
                .padding(.bottom, 40.0)
        }
    }
}

#Preview {
    LocationMapAnnotationView()
}
