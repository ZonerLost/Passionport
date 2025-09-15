import 'package:flutter/material.dart';
import 'package:passion_port/config/constants/app_sizes.dart';
import 'package:passion_port/view/custom/common_image_view_widget.dart';
import 'package:passion_port/view/custom/custom_appbar.dart';
import 'package:passion_port/view/custom/my_text_widget.dart';
import 'package:passion_port/view/custom/my_textfeild.dart';
import 'package:passion_port/view/screens/fan/search/staggered_grid.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../generated/assets.dart';
import '../likes/likes_detail_screen.dart';
import 'compain_search_data.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  // RxDart Subjects
  final BehaviorSubject<bool> _showSuggestionsSubject =
      BehaviorSubject<bool>.seeded(false);
  final BehaviorSubject<String> _selectedTypeSubject =
      BehaviorSubject<String>.seeded('All');
  final BehaviorSubject<String> _searchQuerySubject =
      BehaviorSubject<String>.seeded('');

  // Streams
  late Stream<bool> showSuggestionsStream;
  late Stream<String> selectedTypeStream;
  late Stream<String> searchQueryStream;
  late Stream<List<SearchResult>> filteredResultsStream;

  // Sample data - replace with your actual data
  final List<String> _searchTypes = ['All', 'Brands', 'Hashtags', 'Tags'];

  final List<SearchResult> _allResults = [
    SearchResult(
      name: 'nike_official',
      type: 'Brands',
      image: Assets.imagesNike,
    ),
    SearchResult(
      name: 'nike_premium',
      type: 'Brands',
      image: Assets.imagesNike,
    ),
    SearchResult(
      name: 'nike_community',
      type: 'Brands',
      image: Assets.imagesNike,
    ),
    SearchResult(name: '#nike', type: 'Hashtags', image: Assets.imagesHashtag),
    SearchResult(
      name: '#nikeair',
      type: 'Hashtags',
      image: Assets.imagesHashtag,
    ),
    SearchResult(
      name: '#nikestyle',
      type: 'Hashtags',
      image: Assets.imagesHashtag,
    ),
    SearchResult(name: 'adidas', type: 'Tags', image: Assets.imagesTags),
    SearchResult(name: 'puma', type: 'Tags', image: Assets.imagesTags),
    SearchResult(name: 'reebok', type: 'Tags', image: Assets.imagesTags),
    SearchResult(name: 'nike_store', type: 'Brands', image: Assets.imagesFans),
    SearchResult(name: 'nikerunning', type: 'Brands', image: Assets.imagesFans),
    SearchResult(name: 'nikewomen', type: 'Brands', image: Assets.imagesFans),
    SearchResult(
      name: 'nikesportswear',
      type: 'Brands',
      image: Assets.imagesFans,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _searchController.clear();
    _searchQuerySubject.add('');
    _showSuggestionsSubject.add(false);
    _initializeStreams();
    _setupFocusListener();
    _setupSearchListener();
  }

  void _initializeStreams() {
    showSuggestionsStream = _showSuggestionsSubject.stream.asBroadcastStream();
    selectedTypeStream = _selectedTypeSubject.stream.asBroadcastStream();
    searchQueryStream =
        _searchQuerySubject.stream
            .debounceTime(const Duration(milliseconds: 300))
            .asBroadcastStream();

    filteredResultsStream =
        Rx.combineLatest2<String, String, List<SearchResult>>(
          searchQueryStream,
          selectedTypeStream,
          (String query, String selectedType) {
            return _filterResults(query, selectedType);
          },
        ).asBroadcastStream();
  }

  void _setupFocusListener() {
    _searchFocusNode.addListener(() {
      _showSuggestionsSubject.add(_searchFocusNode.hasFocus);
    });
  }

  void _setupSearchListener() {
    _searchController.addListener(() {
      _searchQuerySubject.add(_searchController.text);
    });
  }

  List<SearchResult> _filterResults(String query, String selectedType) {
    List<SearchResult> results = _allResults;

    // Filter by search query
    if (query.isNotEmpty) {
      results =
          results
              .where(
                (result) =>
                    result.name.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();
    }

    // Filter by selected type
    if (selectedType != 'All') {
      results = results.where((result) => result.type == selectedType).toList();
    }

    return results;
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    _showSuggestionsSubject.close();
    _selectedTypeSubject.close();
    _searchQuerySubject.close();
    super.dispose();
  }

  void _onTypeSelected(String type) {
    _selectedTypeSubject.add(type);
  }

  void _onResultTapped(SearchResult result) {
    _searchController.text = result.name;
    _searchFocusNode.unfocus();
    _showSuggestionsSubject.add(false);
    // Handle the selected result
    print('Selected: ${result.name}');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LikesDetailScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(
        showBackButton: false,
        actions: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: MyTextField(
                controller: _searchController,
                focusNode: _searchFocusNode,
                hint: "Nike",
                prefix: Padding(
                  padding: const EdgeInsets.all(10),
                  child: CommonImageView(svgPath: Assets.svgSearchNormal),
                ),
                marginBottom: 0,
              ),
            ),
          ),
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: StreamBuilder<bool>(
                  stream: showSuggestionsStream,
                  builder: (context, showSuggestionsSnapshot) {
                    final showSuggestions =
                        showSuggestionsSnapshot.data ?? false;
                    return showSuggestions
                        ? _buildSuggestionsView()
                        : Column(
                           mainAxisSize: MainAxisSize.min,
                          children: [
                            TabBar(
                              labelColor: kPrimaryColor,
                              unselectedLabelColor: kGreyTxColor,
                              indicatorColor: kPrimaryColor,
                              indicatorSize: TabBarIndicatorSize.tab,
                              padding: EdgeInsets.only(bottom: 10),
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                              tabs: [
                                Tab(text: "Posts"),
                                Tab(text: "Campaigns"),
                              ],
                            ),
                            Expanded(
                              child: TabBarView(

                                children: [
                                  StaggeredGridExample(),
                                  CompaignSearchData(),
                                ],
                              ),
                            ),
                          ],
                        );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDefaultView() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search, size: 80, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'Start typing to search',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestionsView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Filter Types
        Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: StreamBuilder<String>(
            stream: selectedTypeStream,
            builder: (context, selectedTypeSnapshot) {
              final selectedType = selectedTypeSnapshot.data ?? 'All';

              return ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: AppSizes.VERTICAL,
                itemCount: _searchTypes.length,
                itemBuilder: (context, index) {
                  final type = _searchTypes[index];
                  final isSelected = type == selectedType;

                  return Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: GestureDetector(
                      onTap: () => _onTypeSelected(type),
                      child: MyText(
                        text: type,
                        size: 18,
                        weight: FontWeight.w500,
                        color: isSelected ? kPrimaryColor : kBlack2Color,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),

        /// Results List with StreamBuilder
        Expanded(
          child: StreamBuilder<List<SearchResult>>(
            stream: filteredResultsStream,
            builder: (context, filteredResultsSnapshot) {
              final filteredResults = filteredResultsSnapshot.data ?? [];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Suggestions Header
                  if (filteredResults.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: MyText(
                        text: "Suggestions",
                        size: 15,
                        weight: FontWeight.w600,
                      ),
                    ),

                  // Results List
                  Expanded(
                    child:
                        filteredResults.isEmpty
                            ? Center(
                              child: StreamBuilder<String>(
                                stream: searchQueryStream,
                                builder: (context, querySnapshot) {
                                  final query = querySnapshot.data ?? '';
                                  return Text(
                                    query.isEmpty
                                        ? 'Start typing to search'
                                        : 'No results found',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[600],
                                    ),
                                  );
                                },
                              ),
                            )
                            : ListView.builder(
                              itemCount: filteredResults.length,
                              itemBuilder: (context, index) {
                                final result = filteredResults[index];
                                return _buildResultItem(result);
                              },
                            ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildResultItem(SearchResult result) {
    return ListTile(
      leading: CommonImageView(imagePath: result.image, height: 32),
      title: Text(
        result.name,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      trailing:
          _selectedTypeSubject.value == "All"
              ? CommonImageView(svgPath: Assets.svgClose)
              : null,
      onTap: () => _onResultTapped(result),
    );
  }
}

class SearchResult {
  final String name;
  final String type;
  final String image;

  SearchResult({required this.name, required this.type, required this.image});
}
