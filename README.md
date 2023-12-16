# widgets_app

A new Flutter project.

```CDM
    node 16.17.0
```

## Links

[Go router](https://pub.dev/packages/go_router)
[Material example widgets](https://m3.material.io/develop/flutter)

## Notes

- Diferencia entre Column() y Stack()

El widget Column() organiza sus elementos secundarios en una matriz vertical o columna en el eje horizontal del diseño. Esto significa que los elementos secundarios se apilan uno encima del otro en orden vertical. Es útil cuando se desea mostrar una lista de elementos o cuando se necesita una disposición vertical de widgets.

Por otro lado, el widget Stack() organiza sus elementos secundarios en una pila, donde los elementos se superponen unos sobre otros. Esto permite colocar elementos secundarios en capas y controlar su posición relativa. Es útil cuando se desea superponer elementos, como superponer un botón en la parte superior de una imagen de fondo.

En resumen, la diferencia principal entre Column() y Stack() es la forma en que organizan y muestran sus elementos secundarios. Column() los apila verticalmente, mientras que Stack() los superpone en capas. La elección entre ellos dependerá de la disposición y el diseño específico que se desee lograr en la interfaz de usuario de la aplicación Flutter.

Es importante tener en cuenta que esta explicación se basa en la documentación y ejemplos proporcionados por la comunidad de Flutter y puede haber otros detalles o casos de uso específicos que no se mencionen aquí.

- Configuración para usar Assets

Dentro de el archivo `pubspec.yaml` agrega:

``` yaml
    assets:
        - assets/images/
```

- Flutter_riverpod

Para consumir un provider de `flutter_riverpod` en un `stateLessWidget`
debes Reemplazar este por un `ConsumerWidget`

```Dart
    // Example 1 to modifier the state
    ref.read(counterProvider.notifier).state++;

    // Example 2 to modifier the state
    ref.read(counterProvider.notifier)
        .update((state) => state + 1);
```
