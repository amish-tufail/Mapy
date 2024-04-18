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
            mapLayer
            VStack(alignment: .center, spacing: 0.0) {
                header
                Spacer()
            }
        }
        .sheet(item: $viewModel.sheetLocation) { location in
            LocationDetailView(location: location)
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
    
    private var mapLayer: some View {
        Map(coordinateRegion: $viewModel.mapRegion,
            annotationItems: viewModel.locations, annotationContent: { location in
            MapAnnotation(coordinate: location.coordinates) {
                LocationMapAnnotationView()
                    .scaleEffect(viewModel.mapLocation == location ? 1.0 : 0.7)
                    .onTapGesture {
                        viewModel.showNextLocation(location: location)
                    }
            }
        })
        .ignoresSafeArea()
    }
    
    private var locationsPreviewStack: some View {
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
#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
