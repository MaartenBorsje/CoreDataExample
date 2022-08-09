//
//  ContentView.swift
//  CoreDataExample
//
//  Created by Maarten Borsje on 09/08/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CoreDataRelationshipsBootcamp()
                .tabItem {
                    Image(systemName: "house")
                }
            CompanyDashboardView()
                .tabItem {
                    Image(systemName: "building.2")
                }
            DepartmentDashboardView()
                .tabItem {
                    Image(systemName: "circle.grid.2x2.fill")
                }
            EmployeeDashboardView()
                .tabItem {
                    Image(systemName: "person.2")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
