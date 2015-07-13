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