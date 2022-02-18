import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_treeview/flutter_treeview.dart';

class TreeViewWidget extends StatefulWidget {
  const TreeViewWidget({Key? key}) : super(key: key);

  @override
  _TreeViewWidgetState createState() => _TreeViewWidgetState();
}

class _TreeViewWidgetState extends State<TreeViewWidget> {
  List<Node> nodes = [];

  late TreeViewController _treeViewController;

  List<Map<String, dynamic>> lists = [
    {
      "label": "widgets test",
      "key": "widgets test",
      "children": [
        {
          "label": "widgets test",
          "key": "widgets test",
        },
        {
          "label": "widgets test",
          "key": "widgets test",
        },
        {
          "label": "widgets test",
          "key": "widgets test",
        },
        {
          "label": "widgets test",
          "key": "widgets test",
          "children": [
            {
              "label": "widgets test",
              "key": "widgets test",
            }
          ],
        },
        {
          "label": "widgets test",
          "key": "widgets test",
          "children": [
            {
              "label": "widgets test",
              "key": "widgets test",
            },
            {
              "label": "widgets test",
              "key": "widgets test",
            },
          ],
        },
      ]
    },
    {
      "label": "widgets test",
      "key": "widgets test",
    },
  ];

  List<Node> _geneTreeNodes(List list) {
    List treeNodes = <Node>[];
    String label;
    String key;
    List children;

    for (int i = 0; i < list.length; i++) {
      final Map<String, dynamic> item = list[i];
      label = item["label"];
      key = item["key"];
      children = item["children"] as List;

      treeNodes.add(Node(
        label: label,
        key: key,
        children: _geneTreeNodes(children),
      ));
    }

    return treeNodes as List<Node>;
  }

  @override
  void initState() {
    super.initState();
    // nodes = _geneTreeNodes(lists);
    nodes = [
      const Node<String>(
        label: 'widgets test',
        key: 'widgets test',
        icon: Icons.folder,
        children: [
          Node(
            label: 'attributes',
            key: 'attributes',
            icon: Icons.folder,
          ),
          Node(
            label: 'Ingredients',
            key: 'Ingredients',
            icon: Icons.file_copy,
          ),
          Node(
            label: 'New tag',
            key: 'New tag',
            icon: Icons.file_copy,
          ),
          Node(
            label: 'Rotated image',
            key: 'Rotated image',
            icon: Icons.file_copy,
            children: [
              Node(
                label: 'Default',
                key: 'Default',
                icon: Icons.menu_book,
              ),
            ],
          ),
          Node(
            label: 'Meal Detail',
            key: 'Meal Detail',
            icon: Icons.file_copy,
            children: [
              Node(
                label: 'Short Name',
                key: 'Short Name',
                icon: Icons.menu_book,
              ),
              Node(
                label: 'Long Name',
                key: 'Long Name',
                icon: Icons.menu_book,
              ),
            ],
          ),
        ],
      ),
      const Node(
        label: 'pages',
        key: 'pages',
        icon: Icons.folder,
      ),
    ];

    _treeViewController = TreeViewController(children: nodes);
  }

  /// sample theme
  TreeViewTheme treeViewTheme(BuildContext context) => TreeViewTheme(
        expanderTheme: ExpanderThemeData(
          type: ExpanderType.chevron,
          modifier: ExpanderModifier.none,
          position: ExpanderPosition.start,
          color: Theme.of(context).primaryColorDark,
          size: 20,
        ),
        labelStyle: const TextStyle(
          fontSize: 14,
          letterSpacing: 0.3,
          fontWeight: FontWeight.w300,
          color: Color(0xffF4F4F3),
        ),
        parentLabelStyle: const TextStyle(
          fontSize: 14,
          letterSpacing: 0.1,
          fontWeight: FontWeight.bold,
          color: Color(0xffF4F4F3),
        ),
        iconTheme: IconThemeData(
          size: 14,
          color: Colors.grey.shade800,
        ),
        colorScheme: ColorScheme.fromSwatch(),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff000000),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xff1D1B1D),
              borderRadius: BorderRadius.circular(5),
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: "search",
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Icon(
                Icons.keyboard_arrow_down,
                color: Color(0xffF4F4F3),
              ),
              Icon(
                Icons.keyboard_arrow_up,
                color: Color(0xffF4F4F3),
              )
            ],
          ),
          Flexible(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xff1D1B1D),
                borderRadius: BorderRadius.circular(5),
              ),
              child: TreeView(
                controller: _treeViewController,
                theme: treeViewTheme(context),
                onNodeTap: (key) {
                  Node selectedNode = _treeViewController.getNode(key)!;
                  var selectedModel = selectedNode.data;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
