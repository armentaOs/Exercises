
class StackNode<T> {
    var value: T
    var next: StackNode?
    
    init(value: T) {
        self.value = value
    }
}

class Stack<G> {
    typealias Node = StackNode<G>
    
    private var top: Node?
    
    var peakTop: G? {
        guard let peak = top else { return nil }
        print(peak.value)
        return peak.value
    }
    var peakBottom: G? {
        guard var peak = top else { return nil }
        while let next = peak.next {
            peak = next
        }
        print(peak.value)
        return peak.value
    }
    var count: Int {
        guard var node = top else { return 0 }
        var count = 1
        while let next = node.next {
            count += 1
            node = next
        }
        return count
    }
    
    func peakStack() -> Void {
        if var peak = top {
            print("This stack is conformed by:")
            print(peak.value)
            while let next = peak.next {
                peak = next
                print(peak.value)
            }
        } else {
            print("There are no elements in this stack.")
        }
    }
    func push(value: G) -> Void {
        let newNode = StackNode<G>(value: value)
        let temporalValue = top
        newNode.next = temporalValue
        top = newNode
    }
    func pop() -> G? {
        guard let temporalTop = top else { return nil }
        top = temporalTop.next
        temporalTop.next = nil
        print("The following element has been removed: \(temporalTop.value)")
        return temporalTop.value
    }
}




