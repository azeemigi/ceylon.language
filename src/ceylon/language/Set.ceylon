shared interface Set<out Element> 
        satisfies Collection<Element> &
                  Cloneable<Set<Element>>
        given Element satisfies Object {
    
    shared actual default Integer count(Object element) {
        return contains(element) then 1 else 0;
    }
    
    shared default Boolean superset(Set<Object> set) {
        for (element in set) {
            if (!contains(element)) {
                return false;
            }
        }
        else {
            return true;
        }
    }
    
    shared default Boolean subset(Set<Object> set) {
        for (element in this) {
            if (!set.contains(element)) {
                return false;
            }
        }
        else {
            return true;
        }
    }
    
    shared actual default Boolean equals(Object that) {
        if (is Set<Object> that) {
            if (that.size==size) {
                for (element in this) {
                    if (!element in that) {
                        return false;
                    }
                }
                else {
                    return true;
                }
            }
        }
        return false;
    }
    
    shared actual default Integer hash {
        return size;
    } 
    
    shared formal Set<Element|Other> union<Other>(Set<Other> set) 
            given Other satisfies Object;
    
    shared formal Set<Element&Other> intersection<Other>(Set<Other> set) 
            given Other satisfies Object;
    
    shared formal Set<Element|Other> exclusiveUnion<Other>(Set<Other> set) 
            given Other satisfies Object;
    
    shared formal Set<Element> complement<Other>(Set<Other> set) 
            given Other satisfies Object;

}
