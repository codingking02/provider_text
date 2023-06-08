class Future_Provider {
  String txt;
  Future_Provider(this.txt);

  Future<void> dosomethings() async {
    await Future.delayed(
      Duration(seconds: 5),
      () {
        txt = "zeyad";
      },
    );
  }
}
