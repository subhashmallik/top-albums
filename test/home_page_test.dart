import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:top_albums/domain/entities/top_albums_entity.dart';
import 'package:top_albums/presentation/bloc/album_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:top_albums/presentation/pages/home_page.dart';

class MockAlbumBloc extends MockBloc<AlbumEvent, AlbumState>
    implements AlbumBloc {}

class AlbumStateFake extends Fake implements AlbumState {}

class AlbumEventFake extends Fake implements AlbumEvent {}

void main() {
  group('Get top albums', () {
  setUpAll(() {
    registerFallbackValue(AlbumStateFake());
    registerFallbackValue(AlbumEventFake());
  });
  int page = 1;
  List<AlbumEntity> albums = [];
  albums.add(const AlbumEntity("test item 1", "https://lastfm.freetls.fastly.net/i/u/34s/5a9dd7a775e57db1cd8c2243dbbc2acb.png"));
  albums.add(const AlbumEntity("test item 2", "https://lastfm.freetls.fastly.net/i/u/34s/5a9dd7a775e57db1cd8c2243dbbc2acb.png"));
  albums.add(const AlbumEntity("test item 3", "https://lastfm.freetls.fastly.net/i/u/34s/5a9dd7a775e57db1cd8c2243dbbc2acb.png"));
  albums.add(const AlbumEntity("test item 4", "https://lastfm.freetls.fastly.net/i/u/34s/5a9dd7a775e57db1cd8c2243dbbc2acb.png"));
  TopAlbumEntity topAlbumEntity = TopAlbumEntity(totalPages: "10", total: "100", albums: albums);
  final Map<String, dynamic> param = {
    "method": "artist.gettopalbums",
    "artist": "cher",
    "api_key": "a35699f435445486aec22d7a19e652bf",
    "format": "json",
    "page": page,
    "limit": 5
  };
  testWidgets('should show home page', (WidgetTester tester) async {
    final mockAlbumBloc = MockAlbumBloc()
      ..add(GetTopAlbums(param));
    when(() => mockAlbumBloc.state as AlbumLoading).thenReturn(
      AlbumLoading(), // the desired state
    );
    // test
    await tester.pumpWidget(

      BlocProvider<AlbumBloc>(
        create: (context) => mockAlbumBloc,
        child:  const MaterialApp(
          title: 'Top album Test',
          home: HomePage(),
        ),
      ),
    );
    expect(find.byType(Scaffold), findsNWidgets(1));
    expect(find.byType(AppBar), findsNWidgets(1));
    expect(find.byType(Center), findsNWidgets(1));
    expect(find.byType(CircularProgressIndicator), findsNWidgets(1));
  });
  testWidgets('should show a album list', (WidgetTester tester) async {
    // arrange
    final mockAlbumBloc = MockAlbumBloc()
      ..add(GetTopAlbums(param));
    when(() => mockAlbumBloc.state as AlbumLoaded).thenReturn(
      AlbumLoaded(topAlbumEntity), // the desired state
    );

    // test
    await tester.pumpWidget(
      BlocProvider<AlbumBloc>(
        create: (context) => mockAlbumBloc,
        child:  MaterialApp(
          title: 'Top album Test',
          home: ListView(),
        ),
      ),
    );
    expect(find.byType(ListView), findsNWidgets(1));
  });
  });
}
