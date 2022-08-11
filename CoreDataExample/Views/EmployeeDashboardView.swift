//
//  EmployeeDashboardView.swift
//  CoreDataExample
//
//  Created by Maarten Borsje on 09/08/2022.
//

import SwiftUI

struct EmployeeDashboardView: View {
    
    @StateObject var vm = CoreDataViewModel()
    
    @State private var employeeName = ""
    @State private var age = Int16(1)
    //    @State private var dateJoined = Date()
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    VStack(spacing: 20) {
                        TextField("Employee Name", text: $employeeName)
                        TextField("Employee Age", value: $age, formatter: NumberFormatter())
                        Button(action: {
                            vm.addEmployee(employeeName: employeeName, age: Int16(age))
                        }, label: {
                            Text("Perform Action")
                                .foregroundColor(.white)
                                .frame(height: 55)
                                .frame(maxWidth: .infinity)
                                .background(Color.blue.cornerRadius(10))
                        })
                    }
                    Section {
                        ForEach(vm.employees) { employee in
                            NavigationLink {
                                
                            } label: {
                                EmployeeViewComponent(entity: employee)
                            }
                        }
                        .onDelete(perform: vm.deleteEmployee)
                    }
                }
                .padding()
            }
            .navigationTitle("Employee")
        }
        
    }
}

struct EmployeeDashboardView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeDashboardView()
    }
}
