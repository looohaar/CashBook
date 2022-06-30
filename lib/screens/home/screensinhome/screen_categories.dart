import 'package:cash_book/main.dart';
import 'package:cash_book/models/model_class.dart';
import 'package:cash_book/screens/home/widgets/addCategory.dart';
import 'package:cash_book/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

int indexController = 0;

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories>
    with TickerProviderStateMixin {
  Color? tabColor = incomeColor;
  TabController? tabController;
  @override
  void initState() {
    // TODO: implement initState
    indexController = 0;
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add Item',
          style: GoogleFonts.signika(
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Builder(builder: (context) {
              tabController = DefaultTabController.of(context)!;
              tabController!.addListener(() {
                setState(() {
                  indexController = tabController!.index;
                  if (tabController!.index == 0) {
                    tabColor = incomeColor;
                  } else {
                    tabColor = expenseColor;
                  }
                  // tabColor= Color.fromARGB(255, 20, 2, 46);
                });
              });
              // nthelum issues vannal TabBar Column il wrap chydo
              return TabBar(
                  padding: EdgeInsets.all(30),
                  indicator: BoxDecoration(
                    color: tabColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  labelColor: Colors.black87,
                  unselectedLabelColor: Colors.black45,
                  tabs: [
                    Tab(
                      child: Text(
                        'Income',
                        style: GoogleFonts.signika(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Expense',
                        style: GoogleFonts.signika(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  
                  ]);
            }),
            ValueListenableBuilder(
                valueListenable: categoryVariable.listenable(),
                builder: (BuildContext context, Box<Category> newBox,
                    Widget? child) {
                  List<Category> incomeList = checkIncome(newBox);
                  List<Category> expenseList = checkExpense(newBox);
                  return Expanded(
                    child: (tabController!.index == 0
                            ? incomeList.isEmpty
                            : expenseList.isEmpty)
                        ? Center(
                            child: Text(
                              'No Categories Found',
                              style: GoogleFonts.signika(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey),
                            ),
                          )
                        : ListView.separated(
                            itemBuilder: (context, index) {
                              return SizedBox(
                                height: 75,
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Container(
                                    color: Colors.transparent,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 220,
                                          height: 50,

                                          child: Text(
                                            tabController!.index == 0
                                                ? incomeList[index].categoryName
                                                : expenseList[index]
                                                    .categoryName,
                                            style: GoogleFonts.signika(
                                              fontSize: 27,
                                            ),
                                            maxLines: 1,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                                padding: EdgeInsets.zero,
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.edit,
                                                  color: buttonColor,
                                                )),
                                                IconButton(
                                                padding: EdgeInsets.zero,
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.delete,
                                                  color: Colors.redAccent,
                                                )
                                              ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 2,
                                child: Container(
                                  color: Colors.grey,
                                ),
                              );
                            },
                            itemCount: tabController!.index == 0
                                ? incomeList.length
                                : expenseList.length,
                          ),
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
      onPressed: (){
        // Navigator.push(context, MaterialPageRoute(builder: (context)=>Categories()));
        showDialog(context: context, builder: (context)=>AddCategory());
      },
      child: Icon(Icons.add,),
      backgroundColor: buttonColor,
      elevation: 0,
      
      ),
    );
  }
}

List<Category> checkIncome(Box<Category> box) {
  List<Category> list = box.values.toList();
  List<Category> incomeList = [];
  for (int i = 0; i < list.length; i++) {
    if (list[i].transactionType == true) {
      incomeList.add(list[i]);
    }
  }
  return incomeList;
}

List<Category> checkExpense(Box<Category> box) {
  List<Category> list = box.values.toList();
  List<Category> expenseList = [];
  for (int i = 0; i < list.length; i++) {
    if (list[i].transactionType == false) {
      expenseList.add(list[i]);
    }
  }
  return expenseList;
}
