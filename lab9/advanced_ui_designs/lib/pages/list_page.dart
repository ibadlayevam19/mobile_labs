import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState()=> _ListPageState();
}

class _ListPageState extends State<ListPage>{
  final GlobalKey<AnimatedListState> _listKey=GlobalKey<AnimatedListState>();
  final List<int> _items=[];

  void _addItem(){
    final int index=_items.length;
    _items.add(index);
    _listKey.currentState?.insertItem(index);
  }

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        ElevatedButton(
          onPressed: _addItem,
          child: const Text('Add Item'),
        ),
        Expanded(
          child: AnimatedList(
            key: _listKey,
            initialItemCount: _items.length,
            itemBuilder: (context, index, animation){
              return SizeTransition(
                sizeFactor: animation,
                child: ListTile(
                  leading: const Icon(Icons.star),
                  title: Text('Item ${_items[index]}'),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}