
# Full Expandable FAB

Widget to show an animated floating action button which turns into a modal.

<img src="https://raw.githubusercontent.com/ajomuch92/expandable_fab/main/demo.gif" width="200" height="429"/>




## Instalation
Include `full_expandable_fab` in your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  full_expandable_fab: version
```
## API Reference

#### Props


| Name | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `child`      | `Widget` | **Required** Widget to wrap it. It's recommended to use a Scafold here. |
| `innerChild`      | `Widget` | **Required** Widget to show into the expanded modal. |
| `icon`      | `Icon` | **Required**. Icon to use into the initial floating button. |
| `closeIconColor`      | `Color` |  Color for the close icon. By default, it's white |
| `buttonBackgroundColor`      | `Color` | Color to use as background for floating action button. By default it's the primary color of the theme. |
| `backgroundColor`      | `Color` | Color to use as background of the expanded modal. By default is  Color.fromRGBO(0, 0, 0, 0.5) |
| `duration`      | `Duration` | Duration for the animation. By default is 250ms. |




## Example

```dart
import 'package:full_expandable_fab/full_expandable_fab.dart';

...

class MyHomePage extends StatelessWidget {
  final String title;
  final GlobalKey<ExpandableFabState> keyFab = GlobalKey<ExpandableFabState>();

  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandableFab(
      key: keyFab,
      backgroundColor: Colors.white,
      closeIconColor: Colors.black,
      duration: const Duration(milliseconds: 500),
      innerChild: Column(
        children: [
          const Text('Inner widget'),
          const TextField(),
          ElevatedButton(
            onPressed: () {
              keyFab.currentState?.close();
            }, 
            child: const Text('Close me')
          )
        ],
      ),
      icon: const Icon(Icons.plus_one, color: Colors.white,),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: const Center(
          child: Text(
            'Hello, World!',
          ),
        ),
      ),
    );
  }
}
```



## Author

- [@ajomuch92](https://www.github.com/ajomuch92)

Feel free to [open a PR](https://github.com/ajomuch92/expandable_fab/pulls) or [create an issue](https://github.com/ajomuch92/expandable_fab/issues) to contribute to this package.


## License

[MIT](https://github.com/ajomuch92/expandable_fab/blob/main/LICENSE)

