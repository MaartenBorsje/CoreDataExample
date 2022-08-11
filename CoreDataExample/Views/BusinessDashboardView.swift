//
//  CompanyDashboard.swift
//  CoreDataExample
//
//  Created by Maarten Borsje on 09/08/2022.
//

import SwiftUI

struct BusinessDashboardView: View {
    
    @StateObject var vm = CoreDataViewModel()
    
    @State private var companyName = ""
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    VStack(spacing: 20) {
                        TextField("Company Name", text: $companyName)
                        Button(action: {
                            vm.addBusiness(companyName: companyName)
                        }, label: {
                            Text("Add Business")
                                .foregroundColor(.white)
                                .frame(height: 55)
                                .frame(maxWidth: .infinity)
                                .background(Color.blue.cornerRadius(10))
                        })
                    }
                    Section {
                        ForEach(vm.businesses) { business in
                            NavigationLink {
                                
                            } label: {
                                BusinessViewComponent(entity: business)
                            }
                        }
                        .onDelete(perform: vm.deleteBusiness)
                    }
                }
                .padding()
            }
            .navigationTitle("Business")
        }
    }
}

struct CompanyDashboard_Previews: PreviewProvider {
    static var previews: some View {
        BusinessDashboardView()
    }
}
