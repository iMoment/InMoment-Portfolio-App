//
//  DataService.swift
//  In Moment
//
//  Created by Stanley Pan on 2/16/16.
//  Copyright © 2016 Stanley Pan. All rights reserved.
//

import Foundation
import Firebase

class DataService {
    static let ds = DataService()
    
    private var _REF_BASE = Firebase(url: "https://in-moment.firebaseio.com")
    
    var REF_BASE: Firebase {
        return _REF_BASE
    }
}