//
//  LocationsView.swift
//  Mapy
//
//  Created by Amish on 17/04/2024.
//

import SwiftUI

struct LocationsView: View {
    @Environment(LocationsViewModel.self) var viewModel
    var body: some View {
        List {
            ForEach(viewModel.locations) { location in
                Text(location.name)
            }
        }
    }
}

#Preview {
    LocationsView()
        .environment(LocationsViewModel())
}
