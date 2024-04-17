//
//  MapyApp.swift
//  Mapy
//
//  Created by Amish on 17/04/2024.
//

import SwiftUI

@main
struct MapyApp: App {
   @StateObject private var vm = LocationsViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
        }
    }
}
