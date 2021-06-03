# Trigger infrastructure

## Design pattern for triggger creation

To improve the management and development of Apex triggers, here we are using a
variation of a design pattern [Dynamic Dispatch](https://en.wikipedia.org/w/index.php?title=Dynamic_dispatch&oldid=932525185).
According to event fired, the basic idea is to delegate the trigger execution
sequence to a **code router** (the dispatcher) that will select the appropriate
**handler** according to the events fired (afterInsert, beforeDelete, etc.). The
developer will create the dispatcher, and it will inherit functionality from a
virtual class called `TriggerDispatcherBase`. We need to use a specific naming
convention because for dispatchers because they will be searched at runtime: 

```
    [SObjectName]TriggerDispatcher
```


For a custom object called `Foo__c`, we must create a class called:

```
    FooTriggerDispatcher
```
### Purpose

The naming conventions and the design pattern convert classes and their method
closely related entities. The intention is to homogenize the codebase. This way
we can read trigger's code from one object in the same way that one from others.
This methodology encourages us to establish a correct separation of concerns and
code modularization. In simple terms, the primary function of this module is to
prescribe the path to develop and maintain triggers.

### Author

The author of this module is Hari Krishnan, who offers a more detailed
explanation of the package structure on his site. These details can be found in
the following
[link](https://code.google.com/archive/p/apex-trigger-architecture-framework/).
Initially, this package was licensed under the terms of the Apache 2.0 license,
so I added the appropriate file. I have added unit test classes to the
repository and some settings to deploy it as an unlocked package. There will be
more changes upcoming.