# simple Flex and Bison
Trên Linux
1, cài đặt flex và bison(thường có sẵn):
sudo apt-get update
sudo apt-get install bison
sudo apt-get íntall flex

2, biên dịch và chạy:
flex lexer.l
bison -d parser.y
gcc parser.tab.c
./a.out
3, chạy thử  :)))
