
class DLLNode<T> {
    var value: T
    var next: DLLNode?
    var previous: DLLNode?
    
    init(value: T) {
        self.value = value
    }
}

class DoubleLinkedList<G> {
    typealias Node = DLLNode<G>
    
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
        let newNode = DLLNode(value: value)
        if let lastNode = last {
            newNode.previous = lastNode
            lastNode.next = newNode
        } else {
            head = newNode
        }
    }
    func items() -> Void {
        if var node = head {
            print("This double linked list is defined by:")
            print("\(node.value)")
            while let next = node.next {
                node = next
                print("\(node.value)")
            }
        } else {
            print("There are no items in this double linked list.")
        }
    }
    func insert(value: G, at index: Int) -> Void {
        let newNode = DLLNode<G>(value: value)
        if index == 0 {
            newNode.next = head
            head?.previous = newNode
            head = newNode
        } else {
            let previousNode = getNode(at: index - 1)
            let nextNode = previousNode?.next
            
            newNode.previous = previousNode
            newNode.next = nextNode
            previousNode?.next = newNode
            nextNode?.previous = newNode
        }
    }
    func remove(at index: Int) -> G? {
        let nodeToRemove = getNode(at: index)
        guard nodeToRemove != nil else { return nil }
        let value = remove(node: nodeToRemove!)
        print("The following element has been eliminated from this double linked list: \(value.value)")
        return value.value
    }
    private func remove(node: Node) -> Node {
        let previousNode = node.previous
        let nextNode = node.next
        if let previous = previousNode {
            previous.next = nextNode
        } else {
            head = nextNode
        }
        nextNode?.previous = previousNode
        
        node.previous = nil
        node.next = nil
        
        return node
    }
    private func getNode(at index: Int) -> Node? {
        if index == 0 && head != nil {
            return head!
        } else {
            if count <= index {
                print("Index out of range.")
                return nil
            } else {
                var node = head?.next
                for _ in 1..<index {
                    node = node?.next
                    if node == nil { break }
                }
                return node!
            }
        }
    }
}





