//
//  LZSwiftDelegate.swift
//  LZSwiftDelegate
//
//  Created by Sun Moon on 2020/2/26.
//

import Foundation

public class LZSwiftDelegate<Input, Output> {
    
    public init() {}
    
    private var block: ((Input) -> Output?)?
    
    public func delegate<T: AnyObject>(on target: T, block: ((T, Input) -> Output)?) {
        self.block = { [weak target] input in
            guard let target = target else {
                return nil
            }
            return block?(target, input)
        }
    }
    
    public func call(_ input: Input) -> Output? {
        return block?(input)
    }
}

extension LZSwiftDelegate where Input == Void {
    public func call() -> Output? {
        return call(())
    }
}
