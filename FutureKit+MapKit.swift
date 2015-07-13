//
//  MapKit.swift
//  whereabout
//
//  Created by Стас on 13/07/15.
//  Copyright (c) 2015 Limehat. All rights reserved.
//

import Foundation
import MapKit

extension MKDirections {
    func calculateDirections() -> Future<MKDirectionsResponse> {
        return self.calculateDirections(.Primary)
    }
    
    func calculateDirections(executor : Executor) -> Future<MKDirectionsResponse> {
        let promise = Promise<MKDirectionsResponse>()
        executor.execute {
            self.calculateDirectionsWithCompletionHandler { (response, error) in
                if error == nil || response != nil {
                    promise.completeWithSuccess(response)
                }
                else {
                    promise.completeWithFail(error)
                }
            }
        }
        return promise.future
    }
    
    func calculateETA() -> Future<MKETAResponse> {
        return self.calculateETA(.Primary)
    }
    
    func calculateETA(executor : Executor) -> Future<MKETAResponse> {
        let promise = Promise<MKETAResponse>()
        executor.execute {
            self.calculateETAWithCompletionHandler { (response, error) in
                if error == nil || response != nil {
                    promise.completeWithSuccess(response)
                }
                else {
                    promise.completeWithFail(error)
                }
            }
        }
        return promise.future
    }
}