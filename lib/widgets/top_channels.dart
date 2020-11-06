import 'package:flutter/material.dart';
import 'package:news_app_bloc/bloc/get_source_bloc.dart';
import 'package:news_app_bloc/elements/error_element.dart';
import 'package:news_app_bloc/elements/loader_element.dart';
import 'package:news_app_bloc/model/source.dart';
import 'package:news_app_bloc/model/source_response.dart';

class TopChannels extends StatefulWidget {
  @override
  _TopChannelsState createState() => _TopChannelsState();
}

class _TopChannelsState extends State<TopChannels> {
  @override
  void initState() {
    super.initState();
    getSourcesBloc..getSources();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SourceResponse>(
      stream: getSourcesBloc.subject.stream,
      builder: (context, AsyncSnapshot<SourceResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return buildErrorWidget(snapshot.data.error);
          }
          return _buildTopChannels(snapshot.data);
        } else if (snapshot.hasError) {
          return buildErrorWidget(snapshot.error);
        } else {
          return buildLoadingWidget();
        }
      },
    );
  }

  Widget _buildTopChannels(SourceResponse data) {
    List<SourceModel> sources = data.sources;
    Size size = MediaQuery.of(context).size;
    if (sources.length == 0) {
      return Container(
        width: size.width,
        child: Column(
          children: [
            Text("No Sources"),
          ],
        ),
      );
    } else {
      return Container(
        height: 135.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: sources.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.only(
                top: 10.0,
              ),
              width: 80.0,
              child: GestureDetector(
                onTap: () {},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Hero(
                      tag: sources[index].id,
                      child: Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 5.0,
                                spreadRadius: 1.0,
                                offset: Offset(1.0, 1.0))
                          ],
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/logos/logo.png"),
                            // AssetImage("assets/logos/${sources[index].id}.png")
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      sources[index].name,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10.0,
                          height: 1.4,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    Text(
                      sources[index].category,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      );
    }
  }
}
