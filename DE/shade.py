import random
import copy
import math
random.seed(0)

def rand_normal(ave, var):
  ran = normal(ave, math.sqrt(var))
  while ran <= 0:
    ran = normal(ave, math.sqrt(var))
  if ran > 1:
    return 1
  else:
    return ran

def rand_cauthy(ave, var):

#親ベクトル、ベクトル集団(Pとアーカイブを合わせたもの), p current-to-p-best
def generate_trial_vector(x, P, A, p, N, CR, F):
  list = copy.deepcopy(P)
  list.append(copy.deepcopy(A))
  x2, x3 = random.sample(list, 2)
  random.randomerange(0, N)
  xp = x2 #応急処理
  v = x+F*(xp-x)+F*(x2-x3)#xpは最良個体にしないといけない（個体評価の関数を作る必要があり）
  #ミュータントベクター精製後CRをりようして生成
  if random.uniform(0, 1) <= CR :
    u = v
  else:
    u = x
  return u

def evaluation(x):
  #ベンチマーク関数にするんだお
  sum = 0
  for xi in x:
    sum += (xi*xi)
  return sum


G = 0
population = []
N = 100
LP = 100
NP = 100
#Initialize population
for var1 in range(0, N):
  vector = []
  for var2 in range(0, 30):
    vector.append(random.uniform(-100, 100))
  population.append(copy.deepcopy(vector))
print population

# set all values in Mcr Mf to 0.5
MCR = []
MF =[]
for var in range(0, NP):
  MCR.append(0.5)
  MF.append(0.5)

A = []
# index counter
k = 1

#51は試行回数
for var in range(0, 51):
  SCR = []
  SF = []
  CR = []
  F = []
  p = []
  u = []
  for var1 in range(0, N):
    r = random.randrange(0, N)
    CR.append(rand_normal(MCR[var1],math.sqrt(0.1)))
    F.append(cauchy.rvs()) #コーシー乱数発生よく分かっておらず そもそもなんでコーシー乱数？
    p = random.uniform(2.0/NP, 0.2)
    u.append(generate_trial_vector)#current to pbest/1/bin

  for i in range(0, N):
    if evaluation(u[i]) <= evaluation(population[i]):
      population[i] = u[i]
      A.append(copy.deepcopy(population[ii]))
      SCR.append(copy.deepcopy(CR[i]))
      SF.append(copy.deepcopy(F[i]))
    else:
      population[i] = population[i]
    # if evaluation(u[i]) < evaluation(population[]):
  #whenever the size of the archive exceeds |A| randomly selected individuals are deleted so that
  num = len(popualtion) - len(A)
  if num < 0:
    random.shuffle(A)
    del A[0:num]





