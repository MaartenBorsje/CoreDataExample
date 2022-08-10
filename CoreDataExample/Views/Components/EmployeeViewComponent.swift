//
//  EmployeeViewComponent.swift
//  CoreDataExample
//
//  Created by Maarten Borsje on 10/08/2022.
//

import SwiftUI

struct EmployeeViewComponent: View {
    let entity: EmployeeEntity
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20, content: {
            Text("Name: \(entity.name ?? "")")
                .bold()
            
            Text("Age \(entity.age)")
            Text("DateJoined: \(entity.dateJoined ?? Date())")
            
            Text("Business ")
                .bold()
            
            Text(entity.business?.name ?? "")
            
            Text("Department")
                .bold()
            
            Text(entity.department?.name ?? "")
        })
        .padding()
        .frame(maxWidth: 300, alignment: .leading)
        .background(Color.blue.opacity(0.5))
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

//struct EmployeeViewComponent_Previews: PreviewProvider {
//    static var previews: some View {
//        EmployeeViewComponent()
//    }
//}
