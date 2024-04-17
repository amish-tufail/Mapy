//
//  LocationsListView.swift
//  Mapy
//
//  Created by Amish on 17/04/2024.
//

import SwiftUI

struct LocationsListView: View {
    @EnvironmentObject var viewModel: LocationsViewModel
    var body: some View {
        List {
            ForEach(viewModel.locations) { location in
                Button {
                    viewModel.showNextLocation(location: location)
                } label: {
                    listRowView(location: location)
                        .padding(.vertical, 4.0)
                }
                .listRowBackground(Color.clear)
            }
        }
        .listStyle(.plain)
    }
}

extension LocationsListView {
    @ViewBuilder private func listRowView(location: Location) -> some View {
        HStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 45.0, height: 45.0)
                    .clipShape(.rect(cornerRadius: 10.0, style: .continuous))
            }
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
#Preview {
    LocationsListView()
        .environmentObject(LocationsViewModel())
}
