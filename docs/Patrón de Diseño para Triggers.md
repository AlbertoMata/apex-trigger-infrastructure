# Triggers

## Patrón de Diseño para Triggers

Para mejorar la gestión y el desarrollo de triggers, se utiliza una variación
del patrón de diseño llamado [Dynamic Dispatch](https://en.wikipedia.org/w/index.php?title=Dynamic_dispatch&oldid=932525185).
La idea básica es poder delegar la secuencia de ejecución de un trigger a un
**enrutador** (el dispatcher) que seleccionará el **handler** apropiado
dependiendo del objeto y del evento en cuestión (afterInsert, beforeDelete
etc.). Este enrutador debe ser provisto por el desarrollador y debe heredar
su funcionalidad de una clase virtual llamada *TriggerDispatcherBase*. Debido
a que la **instancia del enrutador se determina en tiempo de ejecución**, la
clase que sirva para este propósito tiene que llevar la siguiente
nomenclatura:

    [SObjectName]TriggerDispatcher

Por ejemplo, para el objeto Account, el enrutador se llamará:

    AccountTriggerDispatcher

Para un objeto personalizado Foo__c, se debera crear una clase llamada: 

    FooTriggerDispatcher

El handler de cada evento, debe heredar la clase virtual
*TriggerHandlerBase*. La clase como tal, define de forma tres
métodos para controlar el ciclo de ejecución de los triggers, al
sobreescribirlos se controla el comportamiento de los triggers a lo largo de
la transacción.

### Consideraciones

La convención de nombres y el patrón de diseño en sí mismo, hacen que las
clases y sus métodos estén **fuertemente ligados** al módulo base de todos
los triggers. No obstante, esto se hace con el fin de
**homologar la base de código**; así, la forma de leer el trigger de un
objeto es idéntica para todos los demás triggers. Además, nos fuerza a
realizar una **segmentación de intereses** correcta y permite que podamos reutilizar
código. En términos simples, la función principal del módulo es *preescribir
la ruta a seguir para el desarrollo de triggers*. Las setencias
condicionales que ahorra solamente reduce un poco la complejidad ciclomática
de nuestros triggers.


### Ventajas de este enfoque

* La gestión de triggers se vuelve uniforme en toda la organización. Al estar
bien definido el ciclo de ejecución y la delegación de responsiabilidad de un
componente a otro. Se evitan redundancias y problemas en la gestión de
registros asociados al ciclo de ejecución.



    



