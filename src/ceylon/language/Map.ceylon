shared interface Map<out Key,out Item> 
        satisfies Collection<Key->Item> &
                  Correspondence<Object, Item> & 
                  Cloneable<Map<Key,Item>>
        given Key satisfies Object 
        given Item satisfies Object {
    
    shared actual default Integer count(Object element) {
        if (is Key->Item element) {
            if (exists item = item(element.key)) {
                return item==element.item then 1 else 0;
            }
            else {
                return 0;
            }
        }
        else {
            return 0;
        }
    }
    
    shared actual default Boolean equals(Object that) {
        if (is Map<Object,Object> that) {
            if (that.size==size) {
                for (entry in this) {
                    if (exists item = that[entry.key]) {
                        if (item==entry.item) {
                            continue;
                        }
                    }
                    return false;
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
    
    actual shared default Set<Key> keys {
        object keySet satisfies Set<Key> {
            shared actual Set<Key> clone { 
                return this;
            }
            shared actual Boolean equals(Object that) {
                return false;
            }
            shared actual Integer hash {
                return outer.size;
            }
            shared actual Iterator<Key> iterator {
                return bottom;
            }
            shared actual Integer size {
                return outer.size;
            }
            shared actual String string {
                return "";
            }
            shared actual Set<Key> complement<Other>(Set<Other> set) 
                    given Other satisfies Object {
                return bottom;
            }
            shared actual Set<Key|Other> exclusiveUnion<Other>(Set<Other> set) 
                    given Other satisfies Object {
                return bottom;
            }
            shared actual Set<Key&Other> intersection<Other>(Set<Other> set) 
                    given Other satisfies Object {
                return bottom;
            }
            shared actual Set<Key|Other> union<Other>(Set<Other> set) 
                    given Other satisfies Object {
                return bottom;
            }
        }
        return keySet;
    }
    
    shared default Collection<Item> values {
        object valueCollection satisfies Collection<Item> {
            shared actual Collection<Item> clone {
                return this;
            }
            shared actual Boolean equals(Object that) {
                return false;
            }
            shared actual Integer hash { 
                return outer.size;
            }
            shared actual Iterator<Item> iterator {
                return bottom;
            }
            shared actual Integer size { 
                return outer.size;
            }
            shared actual String string { 
                return "";
            }
        
        }
        return valueCollection;
    }
    
    shared default Map<Item, Set<Key>> inverse {
        object inverse satisfies Map<Item, Set<Key>> {
            shared actual Map<Item,Set<Key>> clone {
                return this;
            }
            shared actual Boolean equals(Object that) {
                return false;
            }
            shared actual Integer hash { 
                return outer.size;
            }
            shared actual Set<Key>? item(Object key) {
                return bottom;
            }
            shared actual Iterator<Entry<Item,Set<Key>>> iterator {
                return bottom;
            }
            shared actual Integer size {
                return outer.size;
            }
            shared actual String string {
                return "";
            }
        }
        return inverse;
    }
}