//
//  FutureKit+Parse.swift
//  whereabout
//
//  Created by Стас on 13/07/15.
//  Copyright (c) 2015 Limehat. All rights reserved.
//

import Foundation
import Parse


extension PFQuery {
    func findObjectsInFuture() -> Future<[AnyObject]> {
        return self.findObjectsInFuture(.Primary)
    }
    
    func findObjectsInFuture(executor:Executor) -> Future<[AnyObject]> {
        let promise = Promise<[AnyObject]>()
        executor.execute {
            self.findObjectsInBackgroundWithBlock({ (results, error) in
                if error == nil && results != nil {
                    promise.completeWithSuccess(results!)
                }
                else if error != nil {
                    promise.completeWithFail(error!)
                }
                else {
                    promise.completeWithFail("Some error")
                }
            })
        }
        return promise.future
    }
    
    func getFirstObjectInFuture() -> Future<PFObject> {
        return self.getFirstObjectInFuture(.Primary)
    }
    
    func getFirstObjectInFuture(executor:Executor) -> Future<PFObject> {
        let promise = Promise<PFObject>()
        executor.execute {
            self.getFirstObjectInBackgroundWithBlock({ (result, error) in
                if error == nil && result != nil {
                    promise.completeWithSuccess(result!)
                }
                else if error != nil {
                    promise.completeWithFail(error!)
                }
                else {
                    promise.completeWithFail("Some error")
                }
            })
        }
        return promise.future
    }
    
    func getObjectWithIdInFuture(id:String) -> Future<AnyObject> {
        return self.getObjectWithIdInFuture(.Primary, id:id)
    }
    
    func getObjectWithIdInFuture(executor:Executor, id:String) -> Future<AnyObject> {
        let promise = Promise<AnyObject>()
        executor.execute {
            self.getObjectInBackgroundWithId(id, block: { (result, error) in
                if error == nil && result != nil {
                    promise.completeWithSuccess(result!)
                }
                else if error != nil {
                    promise.completeWithFail(error!)
                }
                else {
                    promise.completeWithFail("Some error")
                }
            })
        }
        return promise.future
    }
}

extension PFObject {
    func saveInFuture() -> Future<Bool> {
        return self.saveInFuture(.Primary)
    }
    
    func saveInFuture(executor:Executor) -> Future<Bool> {
        let promise = Promise<Bool>()
        executor.execute {
            self.saveInBackgroundWithBlock { (success, error) in
                if error == nil && success {
                    promise.completeWithSuccess(success)
                }
                else if error != nil {
                    promise.completeWithFail(error!)
                }
                else {
                    promise.completeWithFail("Some error")
                }
            }
        }
        return promise.future
    }
    
    func deleteInFuture() -> Future<Bool> {
        return self.deleteInFuture(.Primary)
    }
    
    func deleteInFuture(executor:Executor) -> Future<Bool> {
        let promise = Promise<Bool>()
        executor.execute {
            self.deleteInBackgroundWithBlock { (success, error) in
                if error == nil && success {
                    promise.completeWithSuccess(success)
                }
                else if error != nil {
                    promise.completeWithFail(error!)
                }
                else {
                    promise.completeWithFail("Some error")
                }
            }
        }
        return promise.future
    }
    
    func fetchIfNeededInFuture() -> Future<PFObject> {
        return self.fetchIfNeededInFuture(.Primary)
    }
    
    func fetchIfNeededInFuture(executor:Executor) -> Future<PFObject> {
        let promise = Promise<PFObject>()
        executor.execute {
            self.fetchIfNeededInBackgroundWithBlock({ (object, error) -> Void in
                if error == nil && object != nil {
                    promise.completeWithSuccess(object!)
                }
                else if error != nil {
                    promise.completeWithFail(error!)
                }
                else {
                    promise.completeWithFail("Some error")
                }
            })
        }
        return promise.future
    }
    
    class func saveAllInFuture(objects: [AnyObject]) -> Future<Bool> {
        return PFObject.saveAllInFuture(.Primary, objects:objects)
    }
    
    class func saveAllInFuture(executor:Executor, objects: [AnyObject]) -> Future<Bool> {
        let promise = Promise<Bool>()
        executor.execute {
            PFObject.saveAllInBackground(objects) { (success, error) in
                if error == nil && success {
                    promise.completeWithSuccess(success)
                }
                else if error != nil {
                    promise.completeWithFail(error!)
                }
                else {
                    promise.completeWithFail("Some error")
                }
            }
        }
        return promise.future
    }
    
    class func deleteAllInFuture(objects: [AnyObject]) -> Future<Bool> {
        return PFObject.deleteAllInFuture(.Primary, objects:objects)
    }
    
    class func deleteAllInFuture(executor:Executor, objects: [AnyObject]) -> Future<Bool> {
        let promise = Promise<Bool>()
        executor.execute {
            PFObject.deleteAllInBackground(objects) { (success, error) in
                if error == nil && success {
                    promise.completeWithSuccess(success)
                }
                else if error != nil {
                    promise.completeWithFail(error!)
                }
                else {
                    promise.completeWithFail("Some error")
                }
            }
        }
        return promise.future
    }
    
    class func pinAllInFuture(objects: [AnyObject]) -> Future<Bool> {
        return PFObject.pinAllInFuture(.Primary, objects:objects)
    }
    
    class func pinAllInFuture(executor:Executor, objects: [AnyObject]) -> Future<Bool> {
        let promise = Promise<Bool>()
        executor.execute {
            PFObject.pinAllInBackground(objects) { (success, error) in
                if error == nil && success {
                    promise.completeWithSuccess(success)
                }
                else if error != nil {
                    promise.completeWithFail(error!)
                }
                else {
                    promise.completeWithFail("Some error")
                }
            }
        }
        return promise.future
    }
}

extension PFCloud {
    class func callFunctionInFuture(function: String, parameters:[String:AnyObject]) -> Future<AnyObject> {
        return PFCloud.callFunctionInFuture(.Primary, function: function, parameters: parameters)
    }
    
    class func callFunctionInFuture(executor:Executor, function: String, parameters:[String:AnyObject]) -> Future<AnyObject> {
        let promise = Promise<AnyObject>()
        executor.execute {
            PFCloud.callFunctionInBackground(function, withParameters: parameters, block: { (result, error) -> Void in
                if error == nil && result != nil {
                    promise.completeWithSuccess(result!)
                }
                else if error != nil {
                    promise.completeWithFail(error!)
                }
                else {
                    promise.completeWithFail("Some error")
                }
            })
        }
        return promise.future
    }
}