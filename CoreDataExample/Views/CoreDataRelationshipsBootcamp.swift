//
//  CoreDataRelationshipsBootcamp.swift
//  CoreDataExample
//
//  Created by Maarten Borsje on 08/08/2022.
//

import SwiftUI
import CoreData



struct CoreDataRelationshipsBootcamp: View {
    
    @StateObject var vm = CoreDataViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Button(action: {
                        vm.deleteDepartment()
//                        vm.getEmployees(forBusiness: vm.businesses[0])
                    }, label: {
                        Text("Perform Action")
                            .foregroundColor(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.blue.cornerRadius(10))
                    })
                    ScrollView(.horizontal, showsIndicators: true, content: {
                        HStack(alignment: .top) {
                            ForEach(vm.businesses) { business in
                                BusinessViewComponent(entity: business)
                            }
                        }
                    })
                    ScrollView(.horizontal, showsIndicators: true, content: {
                        HStack(alignment: .top) {
                            ForEach(vm.departments) { department in
                                DepartmentViewComponent(entity: department)
                            }
                        }
                    })
                    ScrollView(.horizontal, showsIndicators: true, content: {
                        HStack(alignment: .top) {
                            ForEach(vm.employees) { employee in
                                EmployeeViewComponent(entity: employee)
                            }
                        }
                    })
                }
                .padding()
            }
            .navigationTitle("Relationships")
        }
    }
}

struct CoreDataRelationshipsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataRelationshipsBootcamp()
    }
}
