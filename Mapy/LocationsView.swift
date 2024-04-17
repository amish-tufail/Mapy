//
//  LocationsView.swift
//  Mapy
//
//  Created by Amish on 17/04/2024.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    @EnvironmentObject var viewModel: LocationsViewModel
    var body: some View {
        ZStack {
            Map(coordinateRegion: $viewModel.mapRegion)
                .ignoresSafeArea()
            VStack(alignment: .center, spacing: 0.0) {
                header
                Spacer()
                ZStack {
                    ForEach(viewModel.locations) { location in
                        if location == viewModel.mapLocation {
                            LocationPreviewView(location: location)
                                .shadow(color: .black.opacity(0.3), radius: 20.0)
                                .padding()
                                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                        }
                    }
                }
            }
        }
    }
}

extension LocationsView {
    private var header: some View {
        VStack {
            Button {
                viewModel.toggleLocationsList()
            } label: {
                Text(viewModel.mapLocation.name + ", " + viewModel.mapLocation.cityName)
                    .animation(.none, value: viewModel.mapLocation)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundStyle(Color.primary)
                    .frame(height: 55.0)
                    .frame(maxWidth: .infinity)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .rotationEffect(.degrees( viewModel.showLocationsList ? 180.0 : 0.0))
                            .font(.headline)
                            .foregroundStyle(Color.primary)
                            .padding()
                    }
            }
            if viewModel.showLocationsList {
                LocationsListView()
            }
        }
        .background(.thinMaterial)
        .clipShape(.rect(cornerRadius: 10.0, style: .continuous))
        .shadow(color: .black.opacity(0.3), radius: 20.0, x: 0.0, y: 15.0)
        .padding()
    }
}
#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
