
class Node {
    var value: Int
    var leftChildren: Node?
    var rightChildren: Node?
    
    init(value: Int) {
        self.value = value
    }
}

class BinarySearchTree {
    var root: Node?
    
    func append(value: Int, node: inout Node?) -> Void {
        let newNode = Node(value: value)
        if let nodeToCompare = node {
            if newNode.value > nodeToCompare.value {
                append(value: value, node: &nodeToCompare.rightChildren)
            } else {
                append(value: value, node: &nodeToCompare.leftChildren)
            }
        } else {
            node = newNode
        }
    }    
    func search(value: Int, node: Node?) -> Bool {
        if let nodeToCompare = node {
            if value == nodeToCompare.value {
                return true
            } else {
                if value > node!.value {
                    return search(value: value, node: node?.rightChildren)
                } else {
                    return search(value: value, node: node?.leftChildren)
                }
            }
        } else {
            return false
        }
    }
}



