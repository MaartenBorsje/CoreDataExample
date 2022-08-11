//
//  DepartmentDashboardView.swift
//  CoreDataExample
//
//  Created by Maarten Borsje on 09/08/2022.
//

import SwiftUI

struct DepartmentDashboardView: View {
    
    @StateObject var vm = CoreDataViewModel()
    
    @State private var departmentName = ""
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    VStack(spacing: 20) {
                        TextField("Department Name", text: $departmentName)
                        Button(action: {
                            vm.addDepartment(departmentName: departmentName)
                        }, label: {
                            Text("Add Department")
                                .foregroundColor(.white)
                                .frame(height: 55)
                                .frame(maxWidth: .infinity)
                                .background(Color.blue.cornerRadius(10))
                        })
                    }
                        Section {
//                            HStack(alignment: .top) {
                                ForEach(vm.departments) { department in
                                    DepartmentViewComponent(entity: department)
                                }
//                            }
                            .onDelete(perform: vm.deleteDepartment)
                        }
                    }
                    .padding()
            }
            .navigationTitle("Department")
        }
    }
}

struct DepartmentDashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DepartmentDashboardView()
    }
}
