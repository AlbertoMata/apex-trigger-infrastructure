# Triggers

## Patrón de Diseño para Triggers

Para mejorar la gestión de triggers, se utiliza una variación del patrón de
diseño llamado [Dynamic Dispatch](https://en.wikipedia.org/w/index.php?title=Dynamic_dispatch&oldid=932525185).
La idea básica es poder delegar la secuencia de ejecución de un trigger a un
enrutador (el dispatcher) que seleccionará el handler apropiado dependiendo del objeto y del evento
en cuestión (after insert, beforeDelete etc.). Sólo debemos proporcionar la
clase que sirva de gestor para el trigger del objeto que nos interesa. Debido
a que la instancia del enrutador se determina en tiempo de ejecución, la
clase que sirva de gestor tiene que llevar la siguiente nomenclatura:

    [ nombreObjeto ]TriggerDispatcher

Por ejemplo, para el objeto Account, el enrutador (dispatcher) deberá llamarse:

    AccountTriggerDispatcher

Para un objeto personalizado, Foo__c, tendremos: 

    FooTriggerDispatcher


### Ventajas de este enfoque

* La gestión de triggers se vuelve uniforme en toda la organización. Al estar
  bien definido el ciclo de ejecución y la delegación de responsiabilidad de un
  componente a otro. Se evitan redundancias y problemas en la gestión de
  registros asociados al ciclo de ejecución.



    



