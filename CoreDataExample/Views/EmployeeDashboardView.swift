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
    
    @State private var currentSelectionCompany = 0
    @State private var currentSelectionEmployee = 0
    
    @State private var businessArray = BusinessEntity.self
    
    
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
                            Text("Add Employee")
                                .foregroundColor(.white)
                                .frame(height: 55)
                                .frame(maxWidth: .infinity)
                                .background(Color.blue.cornerRadius(10))
                        })
                    }
                }
                Section {
                    VStack(spacing: 20) {
                        Picker(selection: $currentSelectionCompany, label: Text("Select Company")) {
                            ForEach(0 ..< vm.businesses.count, id: \.self) { //business in
                                Text(self.vm.businesses[$0].name ?? "")
                            }
                        }.pickerStyle(MenuPickerStyle())
                        Text("You selected: \(vm.businesses[currentSelectionCompany].name ?? "")")
                        Spacer()
                        Picker(selection: $currentSelectionEmployee, label: Text("Select Employee")) {
                            ForEach(0 ..< vm.employees.count, id: \.self) { //employee in
                                Text(self.vm.employees[$0].name ?? "")
                            }
                        }.pickerStyle(MenuPickerStyle())
                        Text("You selected: \(vm.employees[currentSelectionEmployee].name ?? "")")
                        Button(action: {
                            print("Test\(currentSelectionCompany)")
                            vm.addEmployeeToBusiness(businessName: currentSelectionCompany, employeeName: currentSelectionEmployee)
                        }, label: {
                            Text("Add To Company")
                                .foregroundColor(.white)
                                .frame(height: 55)
                                .frame(maxWidth: .infinity)
                                .background(Color.blue.cornerRadius(10))
                        })
                        .buttonStyle(BorderedButtonStyle())
                    }
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
                .padding()
            }
            .navigationTitle("Employee")
        }
    }
}

//struct EmployeeDashboardView_Previews: PreviewProvider {
//    static var previews: some View {
//        EmployeeDashboardView()
//    }
//}
