import "../../../../paths.dart";

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  @override
  void initState() {
    context.read<Chatbloc>().getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        context.read<Chatbloc>().navigatortopage(context, const Chatroom());
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(55.h),
          child: const ContactsAppbar(),
        ),
        body: BlocBuilder<Chatbloc, Chatstate>(
          builder: (context, state) {
            if (state is Loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is Succes) {
              final data =
                  state.data
                      .where((element) => element.id != state.myUid)
                      .toList();
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final item = data[index];
                  return ContactsContainer(item: item);
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
