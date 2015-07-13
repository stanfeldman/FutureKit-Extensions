//
//  Net.swift
//  whereabout
//
//  Created by Стас on 13/07/15.
//  Copyright (c) 2015 Limehat. All rights reserved.
//

import Foundation


extension Net {
    // GET -----
    func GET(url: String, params: NSDictionary?) -> Future<ResponseData> {
        return self.GET(.Primary, url: url, params: params)
    }
    
    func GET(executor:Executor, url: String, params: NSDictionary?) -> Future<ResponseData> {
        let promise = Promise<ResponseData>()
        executor.execute {
            self.GET(url, params: params, successHandler: { response in
                promise.completeWithSuccess(response)
            }, failureHandler: { error in
                promise.completeWithFail(error)
            })
        }
        return promise.future
    }
    
    func GET(# absoluteUrl: String, params: NSDictionary?) -> Future<ResponseData> {
        return self.GET(.Primary, absoluteUrl: absoluteUrl, params: params)
    }
    
    func GET(executor:Executor, absoluteUrl: String, params: NSDictionary?) -> Future<ResponseData> {
        let promise = Promise<ResponseData>()
        executor.execute {
            self.GET(absoluteUrl: absoluteUrl, params: params, successHandler: { response in
                promise.completeWithSuccess(response)
            }, failureHandler: { error in
                promise.completeWithFail(error)
            })
        }
        return promise.future
    }
    
    // POST --------
    func POST(url: String, params: NSDictionary?) -> Future<ResponseData> {
        return self.POST(.Primary, url: url, params: params)
    }
    
    func POST(executor:Executor, url: String, params: NSDictionary?) -> Future<ResponseData> {
        let promise = Promise<ResponseData>()
        executor.execute {
            self.POST(url, params: params, successHandler: { response in
                promise.completeWithSuccess(response)
            }, failureHandler: { error in
                promise.completeWithFail(error)
            })
        }
        return promise.future
    }
    
    func POST(# absoluteUrl: String, params: NSDictionary?) -> Future<ResponseData> {
        return self.POST(.Primary, absoluteUrl: absoluteUrl, params: params)
    }
    
    func POST(executor:Executor, absoluteUrl: String, params: NSDictionary?) -> Future<ResponseData> {
        let promise = Promise<ResponseData>()
        executor.execute {
            self.POST(absoluteUrl: absoluteUrl, params: params, successHandler: { response in
                promise.completeWithSuccess(response)
            }, failureHandler: { error in
                promise.completeWithFail(error)
            })
        }
        return promise.future
    }
    
    // PUT --------
    func PUT(url: String, params: NSDictionary?) -> Future<ResponseData> {
        return self.PUT(.Primary, url: url, params: params)
    }
    
    func PUT(executor:Executor, url: String, params: NSDictionary?) -> Future<ResponseData> {
        let promise = Promise<ResponseData>()
        executor.execute {
            self.PUT(url, params: params, successHandler: { response in
                promise.completeWithSuccess(response)
            }, failureHandler: { error in
                promise.completeWithFail(error)
            })
        }
        return promise.future
    }
    
    func PUT(# absoluteUrl: String, params: NSDictionary?) -> Future<ResponseData> {
        return self.PUT(.Primary, absoluteUrl: absoluteUrl, params: params)
    }
    
    func PUT(executor:Executor, absoluteUrl: String, params: NSDictionary?) -> Future<ResponseData> {
        let promise = Promise<ResponseData>()
        executor.execute {
            self.PUT(absoluteUrl: absoluteUrl, params: params, successHandler: { response in
                promise.completeWithSuccess(response)
            }, failureHandler: { error in
                promise.completeWithFail(error)
            })
        }
        return promise.future
    }
    
    // DELETE -----
    func DELETE(url: String, params: NSDictionary?) -> Future<ResponseData> {
        return self.DELETE(.Primary, url: url, params: params)
    }
    
    func DELETE(executor:Executor, url: String, params: NSDictionary?) -> Future<ResponseData> {
        let promise = Promise<ResponseData>()
        executor.execute {
            self.DELETE(url, params: params, successHandler: { response in
                promise.completeWithSuccess(response)
            }, failureHandler: { error in
                promise.completeWithFail(error)
            })
        }
        return promise.future
    }
    
    func DELETE(# absoluteUrl: String, params: NSDictionary?) -> Future<ResponseData> {
        return self.DELETE(.Primary, absoluteUrl: absoluteUrl, params: params)
    }
    
    func DELETE(executor:Executor, absoluteUrl: String, params: NSDictionary?) -> Future<ResponseData> {
        let promise = Promise<ResponseData>()
        executor.execute {
            self.DELETE(absoluteUrl: absoluteUrl, params: params, successHandler: { response in
                promise.completeWithSuccess(response)
            }, failureHandler: { error in
                promise.completeWithFail(error)
            })
        }
        return promise.future
    }
}
