
class QNode<T> {
    var next: QNode?
    var value: T
    
    init(value: T) {
        self.value = value
    }
}

class Queue<G> {
    typealias Node = QNode<G>
    
    private var top: Node?
    
    var first: G? {
        guard let node = top else { return nil }
        return node.value
    }
    var bottom: Node? {
        guard var node = top else { return nil }
        while let next = node.next {
            node = next
        }
        return node
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
    
    func enQueue(value: G) -> Void {
        let newNode = QNode<G>(value: value)
        let node = top
        newNode.next = node
        top = newNode
    }
    func deQueue() -> G? {
        guard bottom != nil else { return nil }
        if count == 1 {
            top = nil
        } else {
            let previousNodeIndex = count
            let previousNode = getNode(index: previousNodeIndex - 2)
            previousNode?.next = nil
            return bottom?.value
        }
        return nil
    }
    func peakQueue() -> Void {
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
    private func getNode(index: Int) -> Node? {
        if index == 0 && top != nil {
            return top
        } else {
            var secondItem = top?.next
            for _ in 1..<index {
                secondItem = secondItem?.next
            }
            return secondItem
        }
    }
}

