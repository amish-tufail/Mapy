//
//  LocationPreviewView.swift
//  Mapy
//
//  Created by Amish on 17/04/2024.
//

import SwiftUI

struct LocationPreviewView: View {
    @EnvironmentObject private var viewModel: LocationsViewModel
    let location: Location
    var body: some View {
        HStack(alignment: .bottom, spacing: 0.0) {
            VStack(alignment: .leading, spacing: 16.0) {
                imageSection
                titleSection
            }
            VStack(spacing: 8.0) {
                learnMore
                nextButton
            }
        }
        .padding(20.0)
        .background(
            RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                .fill(.ultraThinMaterial)
                .offset(y: 65))
        .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
    }
}

extension LocationPreviewView {
    private var imageSection: some View {
        ZStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100.0, height: 100.0)
                    .clipShape(.rect(cornerRadius: 10.0, style: .continuous))
            }
        }
        .padding(6.0)
        .background(.white)
        .clipShape(.rect(cornerRadius: 10.0, style: .continuous))
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading) {
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            Text(location.cityName)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var learnMore: some View {
        Button {
            
        } label: {
            Text("Learn more")
                .font(.headline)
                .frame(width: 125.0, height: 35.0)
        }
        .buttonStyle(BorderedButtonStyle())
    }
    
    private var nextButton: some View {
        Button {
            viewModel.nextButtonPressed()
        } label: {
            Text("Next")
                .font(.headline)
                .frame(width: 125.0, height: 35.0)
        }
        .buttonStyle(BorderedButtonStyle())
    }
}

#Preview {
    LocationPreviewView(location: LocationsDataService.locations.first!)
        .environmentObject(LocationsViewModel())
}
