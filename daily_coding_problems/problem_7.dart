Map<String, String> map = {
  "1": "a",
  "2": "b",
  "3": "c",
  "4": "d",
  "5": "e",
  "6": "f",
  "7": "g",
  "8": "h",
  "9": "i",
  "10": "j",
  "11": "k",
  "12": "l",
  "13": "m",
  "14": "n",
  "15": "o",
  "16": "p",
  "17": "q",
  "18": "r",
  "19": "s",
  "20": "t",
  "21": "u",
  "22": "v",
  "23": "w",
  "24": "x",
  "25": "y",
  "26": "z",
};

Map<int, int> memo = {};

int numOfWays(String msg, int startIndex) {
  if (memo[startIndex] != null) {
    return memo[startIndex];
  }

  if (startIndex >= msg.length) {
    memo[startIndex] = 1;
    return 1;
  }

  // if start element = "0". No way
  if (msg[startIndex] == "0") {
    memo[startIndex] = 0;
    return 0;
  }

  // if last element reached
  if (startIndex == msg.length - 1) {
    memo[startIndex] = 1;
    return 1;
  }

  int ans = numOfWays(msg, startIndex + 1);

  if (int.parse(msg.substring(startIndex, startIndex + 2)) <= 26) {
    ans += numOfWays(msg, startIndex + 2);
  }

  memo[startIndex] = ans;
  return ans;
}

main(List<String> args) {
  String msg =
      "12345121213123123123123121231231231231231241231233132132131231231231312312312";
  print(numOfWays(msg, 0));
}
