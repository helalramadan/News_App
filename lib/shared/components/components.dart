import 'package:flutter/material.dart';

Widget BuildArticalItem(artical, context) => Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Container(
            width: 150.0,
            height: 150.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage('${artical['urlToImage']}'))),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: SizedBox(
              height: 150.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${artical['title']}',
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '${artical['publishedAt']}',
                    style: const TextStyle(fontSize: 15.0, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
