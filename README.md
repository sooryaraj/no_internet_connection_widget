
# NoInternetConnectionWidget

A "No Internet Connection" widget is a graphical user interface (GUI) element or notification that appears on a device's screen to inform users that their device is currently not connected to the internet. This widget typically displays a distinctive icon or symbol along with a message indicating the absence of an internet connection. Its purpose is to alert users to the lack of network connectivity, helping them understand why certain online features or services may not be accessible. Users may encounter this widget in various devices, such as smartphones, tablets, or computers, where it serves as a visual prompt to troubleshoot network issues or seek a stable internet connection.


## Installation

Add the following line to pubspec.yaml:

```bash
  dependencies:
    no_internet_connection_widget: 1.0.1
```
    
## Usage/Examples

```dart
  @override
  void initState() {
    super.initState();
    // start listening the connectivity changes
    noInternetController.listen();
  }

  
  @override
  Widget build(BuildContext context) {
    return CheckInternetConnection(
      whenOffline: const Text("No Internet connection"),// optional
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

```

