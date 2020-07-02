
class LLNode<T> {
    var next: LLNode?
    var value: T
    
    init(value: T) {
        self.value = value
    }
}

class LListed<G> {
    typealias Node = LLNode<G>
    
    private var head: Node?
    
    var first: Node? {
        return head
    }
    var last: Node? {
        guard var node = head else { return nil }
        while let next = node.next {
            node = next
        }
        return node
    }
    var count: Int {
        guard var node = head else { return 0 }
        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        return count
    }
    
    func append(value: G) -> Void {
        let newNode = LLNode<G>(value: value)
        if let lastElement = last {
            lastElement.next = newNode
        } else {
            head = newNode
        }
    }
    func insert(value: G, at index: Int) -> Void {
        let newNode = LLNode<G>(value: value)
        if index == 0 {
            newNode.next = head
            head = newNode
        } else {
            let previousNode = getNode(atIndex: index - 1)
            let nextNode = previousNode?.next
            
            previousNode?.next = newNode
            newNode.next = nextNode
        }
    }
    func items() -> Void {
        if var node = head {
            print("This singly linked list has:")
            print(node.value)
            while let next = node.next {
                node = next
                print(node.value)
            }
        } else {
            print("There are no values in this singly linked list.")
        }
    }
    func remove(at index: Int) -> G? {
        let nodeToDelete = getNode(atIndex: index)
        guard nodeToDelete != nil else { return nil }
        let nextNode = nodeToDelete?.next
        if index == 0 {
            head = nextNode
        } else {
            let previousNode = getNode(atIndex: index - 1)
            previousNode?.next = nextNode
        }
        nodeToDelete?.next = nil
        
        return nodeToDelete?.value
    }
    private func getNode(atIndex: Int) -> Node? {
        if atIndex == 0, let firstPosition = head {
            return firstPosition
        } else {
            if count <= atIndex {
                print("Index out of range.")
                return nil
            } else {
                var node = head?.next
                for _ in 1..<atIndex {
                    node = node?.next
                }
                return node!
            }
        }
    }
}


