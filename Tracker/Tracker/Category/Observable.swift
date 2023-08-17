//
//  Observable.swift
//  Tracker
//
//  Created by Margarita Pitinova on 17.08.23.
//

@propertyWrapper
final class Observable<Value> {
    private (set) var onChange: ((Value) -> Void)? = nil
    
    var wrappedValue: Value {
        didSet {
            onChange?(wrappedValue)
        }
    }
    
    var projectedValue: Observable<Value> {
        return self
    }
    
    init(wrappedValue: Value) {
        self.wrappedValue = wrappedValue
    }
    
    func bind(action: @escaping (Value) -> Void) {
        self.onChange = action
    }
}
