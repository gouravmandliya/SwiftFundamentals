
//MARK:- Class VS Struct

//Structs are much safer and bug-free, especially in a multithreaded environment. Swift value types are kept in the stack. In a process, each thread has its own stack space, so no other thread will be able to access your value type directly. Hence no race conditions, locks, deadlocks or any related thread synchronization complexity.

//Use classes if you want reference types. Use structs if you want value types.

//Even though struct and enum don’t support inheritance, they are great for protocol-oriented programming. A subclass inherits all the required and unwanted functionalities from the superclass and is a bad programming practice. Better to use a struct with protocol-oriented programming concept which fixes the above-said issue.

//Class does support Inheritance. Class is a reference type and is stored in the heap part of memory which makes a class comparatively slower than a struct in terms of performance. Unlike a class, a struct is created on the stack. So, it is faster to instantiate (and destroy) a struct than a class. Unless struct is a class member in which case it is allocated in heap, along with everything else.

//Value types do not need dynamic memory allocation or reference counting, both of which are expensive operations. At the same time methods on value types are dispatched statically. These create a huge advantage in favor of value types in terms of performance.
