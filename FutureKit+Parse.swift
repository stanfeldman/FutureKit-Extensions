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
}

extension PFObject {
    func saveInBackgroundInFuture() -> Future<Bool> {
        return self.saveInBackgroundInFuture(.Primary)
    }
    
    func saveInBackgroundInFuture(executor:Executor) -> Future<Bool> {
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
    
    class func saveAllInBackgroundInFuture(objects: [AnyObject]) -> Future<Bool> {
        return PFObject.saveAllInBackgroundInFuture(.Primary, objects:objects)
    }
    
    class func saveAllInBackgroundInFuture(executor:Executor, objects: [AnyObject]) -> Future<Bool> {
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
}