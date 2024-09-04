import 'package:app_pragma_catbreeds/blocs/blocs.dart';
import 'package:app_pragma_catbreeds/models/cats.dart';
import 'package:app_pragma_catbreeds/presentation/screens/home/widgets/cat_card_item.dart';
import 'package:app_pragma_catbreeds/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCats extends StatefulWidget {
  static String routeName = 'home';

  const HomeCats({super.key});

  @override
  State<HomeCats> createState() => _HomeCatsState();
}

class _HomeCatsState extends State<HomeCats> {
  List<CatModel> allCats = [];
  List<CatModel> filteredCats = [];
  TextEditingController searchController = TextEditingController();
  bool resultCats = false;

  @override
  void initState() {
    super.initState();
    context.read<CatsBloc>().add(GetAllCats());
    searchController.addListener(onSearchChanged);
  }

  @override
  void dispose() {
    searchController.removeListener(onSearchChanged);
    searchController.dispose();
    super.dispose();
  }

  void onSearchChanged() {
    String searchText = searchController.text.toUpperCase();
    List<CatModel> filteredNameCats = [];

    filteredNameCats = allCats.where((cat) {
      return cat.name!.toUpperCase().contains(searchText);
    }).toList();

    setState(() {
      resultCats = true;
      filteredCats = filteredNameCats;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatsBloc, CatsState>(
      builder: (context, state) {
        if (state.error != '') {
          Future.delayed(Duration.zero, () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.error),
              backgroundColor: Theme.of(context).primaryColor,
            ));
          });
        }
        if (!state.loading) {
          allCats = state.listCats;
          if (!resultCats) {
            filteredCats = allCats;
          }
        }
        return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'CatBreeds',
                style: UtilStylesText.appBarTitle,
              ),
            ),
            body: SingleChildScrollView(
                child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  width: MediaQuery.of(context).size.width * .85,
                  child: TextField(
                    controller: searchController,
                    decoration: const InputDecoration(
                      labelText: 'Search name',
                      suffixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      ),
                    ),
                  ),
                ),
                state.loading
                    ? const Center(
                        child: CircularProgressIndicator(
                            color: UtilColors.colorPrincipal),
                      )
                    : filteredCats.isNotEmpty
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height * 0.8,
                            child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount: filteredCats.length,
                                itemBuilder: (context, index) {
                                  final catItem = filteredCats[index];
                                  return CatCardItem(catModel: catItem);
                                }),
                          )
                        : Center(
                            child: Text(
                              'No se encontraron gatos con ese nombre.',
                              style: UtilStylesText.bodySubTitle,
                            ),
                          ),
              ],
            )));
      },
    );
  }
}
