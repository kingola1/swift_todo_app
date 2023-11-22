//
//  RealmManager.swift
//  Test Todo
//
//  Created by codingway on 22/11/2023.
//

import Foundation
import RealmSwift

class RealmManager: ObservableObject {
    private(set) var localRealm: Realm?
    @Published private(set) var tasks: [Task] = []
    
    init() {
        openRealm()
        getTasks()
    }
    
    func openRealm(){
        do{
            let config = Realm.Configuration(schemaVersion: 1)
            
            Realm.Configuration.defaultConfiguration = config
            
            localRealm = try Realm()
        } catch {
            print("Error occured:  \(error)")
        }
    }
    
    func addTask(taskTitle: String){
        if let localRealm = localRealm{
            do {
                try localRealm.write{
                    let newTask = Task(value: ["title": taskTitle, "completed": false])
                    localRealm.add(newTask)
                    getTasks()
                    print("Added a new task \(newTask)")
                }
            } catch {
                print("Error Occured while adding task \(error)")
            }
        }
    }
    
    func getTasks() {
        if let localRealm = localRealm {
            let allTasks = localRealm.objects(Task.self).sorted(byKeyPath: "completed")
            
            tasks = []
            
            allTasks.forEach{
                task in tasks.append(task)
            }
        }
    }
    
    func updateTask(id: ObjectId, completed: Bool) {
        if let localRealm = localRealm {
            do {
                let task = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                guard !task.isEmpty else {return}
                
                try localRealm.write{
                    task[0].completed = completed
                    getTasks()
                    print("Updated task \(id)")
                }
            } catch {
                print("Error Occured while updating task {\(id)} \(error)")
            }
        }
    }
    
    func deleteTask (id: ObjectId){
        if let localRealm = localRealm {
            do {
                let task = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                guard !task.isEmpty else {return}
                
                try localRealm.write{
                    localRealm.delete(task)
                    getTasks()
                    print("Task Deleted")
                }
            } catch {
                print("Error Occured while deleting task {\(id)} \(error)")
            }
        }
    }
}
