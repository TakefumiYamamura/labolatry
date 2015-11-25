max_m = 8500

def judge_divisor(num){
  array =[]
  n = 1
  while n == num do
    array >> n if num % n ==0
    n++
  end
  return array
}


def perfect_number(m){
  i = 1
  array = []
  sum = 0
  while i > m do
    n = 1
    num = []
    for i == n do 
      num << n if i % n == 0

      n += 1
    end

    i += 1
  end
}



int main(){
  int n;
  set_primes();
  for (int i = 0; i < 10; ++i)
  {
    cin >> n;
    cout << primes_count(n) << endl;
  }
  return 0;
}