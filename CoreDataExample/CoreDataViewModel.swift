//
//  CoreDataRelationShipViewModel.swift
//  CoreDataExample
//
//  Created by Maarten Borsje on 10/08/2022.
//

import Foundation
import CoreData

class CoreDataViewModel: ObservableObject {
    
    let manager = CoreDataManager.instance
    @Published var businesses: [BusinessEntity] = []
    @Published var departments: [DepartmentEntity] = []
    @Published var employees: [EmployeeEntity] = []
    
    init() {
        getBusinesses()
        getDepartments()
        getEmployees()
    }
    
    func getBusinesses() {
        let request = NSFetchRequest<BusinessEntity>(entityName: "BusinessEntity")
        
        // Sorts the order it apears on the screen
        let sort = NSSortDescriptor(keyPath: \BusinessEntity.name, ascending: true)
        request.sortDescriptors = [sort]
        
        // filter what apears ont the screen
//        let filter = NSPredicate(format: "name == %@", "Apple")
//        request.predicate = filter
        
        do {
            businesses = try manager.context.fetch(request)
        } catch let error {
            print("Error fetching. \(error.localizedDescription)")
        }
    }
    
    func getBusinessName(index: Int) {
        let business = BusinessEntity(context: manager.context)
        business.addToEmployees(employees[index])
    }
    
    func getDepartments() {
        let request = NSFetchRequest<DepartmentEntity>(entityName: "DepartmentEntity")
        
        do {
            departments = try manager.context.fetch(request)
        } catch let error {
            print("Error fetching. \(error.localizedDescription)")
        }
    }
    
    func getEmployees() {
        let request = NSFetchRequest<EmployeeEntity>(entityName: "EmployeeEntity")
        
        do {
            employees = try manager.context.fetch(request)
        } catch let error {
            print("Error fetching. \(error.localizedDescription)")
        }
    }
    
    func getEmployees(forBusiness business: BusinessEntity) {
        let request = NSFetchRequest<EmployeeEntity>(entityName: "EmployeeEntity")
        
        let filter = NSPredicate(format: "business = %@", business) // this only works when the relation is to one
        request.predicate = filter
        
        do {
            employees = try manager.context.fetch(request)
        } catch let error {
            print("Error fetching. \(error.localizedDescription)")
        }
    }
    
    // TODO: add variable
    func updateBusiness() {
        
        let existingBusiness = businesses[2]
        existingBusiness.addToDepartments(departments[1])
        save()
    }
    
    func addBusiness(companyName: String) {
        let newBusiness = BusinessEntity(context: manager.context)
        newBusiness.name = companyName
        
        // add existing departments to the new business
//        newBusiness.departments = [departments[0], departments[1]]
        
        // add existing employees to the new business
//        newBusiness.employees = [employees[1]]
        
        // add new business to existing department
//        newBusiness.addToDepartments(<#T##value: DepartmentEntity##DepartmentEntity#>)
        
        // add new business to existing employee
//        newBusiness.addToEmployees(<#T##value: EmployeeEntity##EmployeeEntity#>)
        
        save()
    }
    
    func addDepartment(departmentName: String) {
        let newDepartment = DepartmentEntity(context: manager.context)
        newDepartment.name = departmentName
//        newDepartment.businesses = [businesses[0], businesses[1], businesses[2]]
        
//        newDepartment.addToEmployees(employees[1])
        
//        newDepartment.employees = [employees[1]]
//        newDepartment.addToEmployees(employees[1])
        save()
    }
    
    func addEmployee(employeeName: String, age: Int16) {
        let newEmployee = EmployeeEntity(context: manager.context)
        newEmployee.age = age
//        newEmployee.dateJoined = Date()
        newEmployee.name = employeeName
        
//        newEmployee.business = businesses[2]
//        newEmployee.department = departments[0]
        save()
    }
    
    // TODO: Update screen after running func
    func addEmployeeToBusiness(businessName: Int, employeeName: Int) {
        let currentBusiness = businesses[businessName]
        
        currentBusiness.addToEmployees(employees[employeeName])
        save()
    }
    
    // TODO: add variable
    func addEmployeeToDepartment() {
//        let newEmployee = EmployeeEntity(context: manager.context)
//        newEmployee.business = departments[0]
    }
    
    func deleteBusiness(at offsets: IndexSet) {
        for offset in offsets {
            let business = businesses[offset]
            
            manager.context.delete(business)
        }
        
//        try? manager.context.save()
        save()
    }
    
    func deleteDepartment(at offsets: IndexSet) {
        for offset in offsets {
            let department = departments[offset]
            
            manager.context.delete(department)
        }
        
//        try? manager.context.save()
        save()
    }
    
    func deleteEmployee(at offsets: IndexSet) {
        for offset in offsets {
            let employee = employees[offset]
            
            manager.context.delete(employee)
            
            save()
        }
    }
    
    func save() {
        businesses.removeAll()
        departments.removeAll()
        employees.removeAll()
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.manager.save()
            self.getBusinesses()
            self.getDepartments()
            self.getEmployees()
        }
    }
}
