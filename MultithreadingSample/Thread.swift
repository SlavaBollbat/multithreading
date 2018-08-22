//
//  Thread.swift
//  MultithreadingSample
//
//  Created by Слава on 20.08.2018.
//  Copyright © 2018 Слава. All rights reserved.
//

import Foundation


class ThreadCreate{
    
    
    var thread = Thread (block: {
        print("test")
    })
    
    func runThread(){
        thread.start()
    }
}

