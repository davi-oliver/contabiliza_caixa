
abstract class SUsers{
  Future findUsersAll() async {
    // select all users show all data from users
  }

  // get users by id
  Future findUsersById(int id) async {
    // select users by id show all data from users
  }

  // get users by name
  Future findUsersByName(String name) async {
    // select users by name show all data from users
  }

  // get users by email
  Future findUsersByEmail(String email) async {
    // select users by email show all data from users
  }

  // get users by phone
  Future findUsersByPhone(String phone) async {
    // select users by phone show all data from users
  }

  // get users by address
  Future findUsersByAddress(String address) async {
    // select users by address show all data from users
  }

  // get users by date
  Future findUsersByDate(String date) async {
    // select users by date show all data from users
  }

  // get users by date range
  Future findUsersByRangeDate(int date1, int date2) async {
    // select users by date range show all data from users
  }

  // delete users by id
  Future deleteUsersById(int id) async {
    // delete users by id
  }

  // create users
  Future createUsers(Map<String, dynamic> data) async {
    // create users
  }

  // update users
  Future updateUsers(Map<String, dynamic> data) async {
    // update users
  }
 
}