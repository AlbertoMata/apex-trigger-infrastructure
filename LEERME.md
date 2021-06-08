# Infraestructura para triggers

## Patrón de Diseño para Triggers

Para mejorar la gestión y el desarrollo de triggers, se utiliza una variación
del patrón de diseño llamado [Dynamic Dispatch](https://en.wikipedia.org/w/index.php?title=Dynamic_dispatch&oldid=932525185).
La idea básica es poder delegar la secuencia de ejecución de un trigger a un
**enrutador** (el dispatcher) que seleccionará el **handler** apropiado
dependiendo del objeto y del evento en cuestión (afterInsert, beforeDelete
etc.). Este enrutador debe ser provisto por el desarrollador y debe heredar
su funcionalidad de una clase virtual llamada `TriggerDispatcherBase`. Debido
a que la instancia del enrutador se determina en tiempo de ejecución, la
clase que sirva para este propósito tiene que llevar la siguiente
nomenclatura:

```
[SObjectName]TriggerDispatcher
```

Por ejemplo, para el objeto Account, el enrutador se llamará:

```
AccountTriggerDispatcher
```

Para un objeto personalizado Foo__c, se debera crear una clase llamada: 

```
FooTriggerDispatcher
```

El handler de cada evento, debe heredar la clase virtual `TriggerHandlerBase`.
Dicha clase define de forma tres métodos para controlar el ciclo de ejecución de
los triggers, al sobreescribirlos se controla el comportamiento de los triggers
a lo largo de la transacción.

### Propósito

La convención de nombres y el patrón de diseño en sí mismo, hacen que las clases
y sus métodos estén fuertemente ligados al módulo base de todos los triggers.
Esto se hace con el fin de homogenizar la base de código; así, la forma de leer
el trigger de un objeto es idéntica para todos los demás. Esto nos fuerza a
realizar una segmentación de intereses correcta y permite que podamos
reutilizar código. En términos simples, la función principal del módulo es
preescribir la ruta a seguir para el desarrollo y mantenimiento de triggers.

### Autor

El autor de esté módulo es Hari Krishnan, quien ofrece una explicación detallada
de la estructura de este paquete en el siguiente
[enlace](https://code.google.com/archive/p/apex-trigger-architecture-framework/).
Originalmente el paquete está licenciado bajo Apache License 2.0 por lo que
agregué la licencia al repositorio. Se han añadido modificaciones a este módulo
para hacerlo más simple de desplegar. He agregado las pruebas unitarias para el
paquete y he agregado algunas configuraciones para poder desplegar este paquete
como un paquete desbloqueado.


