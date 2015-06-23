# coding: utf8
import random
import copy
import math
from scipy.stats import cauchy
random.seed(0)

def rand_normal(ave, var):
  ran = random.normalvariate(ave, math.sqrt(var))
  while ran <= 0:
    ran = random.normalvariate(ave, math.sqrt(var))
  if ran > 1:
    return 1
  else:
    return ran

def rand_cauthy(ave, var):
  pass

#親ベクトル、ベクトル集団(Pとアーカイブを合わせたもの), p current-to-p-best
def generate_trial_vector(x, P, A, p, N, CR, F):
  list = copy.deepcopy(P)
  list.append(copy.deepcopy(A))
  x2, x3 = random.sample(list, 2)
  # random.random.range(0, N)
  xp = x2 #応急処理
  v = x+F*(xp-x)+F*(x2-x3)#xpは最良個体にしないといけない（個体評価の関数を作る必要があり）
  #ミュータントベクター精製後CRをりようして生成
  if random.uniform(0, 1) <= CR :
    u = v
  else:
    u = x
    print u
  return u

def evaluation(x):
  #ベンチマーク関数にするんだお
  sum = 0
  for a in x:
    sum += (a*a)
  sum  -= 1400
  return sum

def meanwa(SCR, wk):
  sum = 0
  for j in range(0, len(SCR)):
    sum += wk*SCR

def meanwl(SF, wk):
  sum1 = 0
  sum2 = 0
  for j in range(0, len(SF)):
    sum1 += wk*SF*SF
  for j in range(0, len(SF)):
    sum1 += wk*SF

  return sum1/sum2




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
# print population

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
  alldeltaf = []
  deltaf = []
  for var1 in range(0, N):
    r = random.randrange(0, N)
    CR.append(rand_normal(MCR[var1], math.sqrt(0.1)))
    F.append(cauchy.rvs()) #コーシー乱数発生よく分かっておらず そもそもなんでコーシー乱数？
    p = random.uniform(2.0/NP, 0.2)
    # generate_trial_vector(x, P, A, p, N, CR, F)
    u.append(generate_trial_vector(population[var1], population, A, p, N, CR, F))#current to pbest/1/bin

  for i in range(0, N):
    print u[i]
    alldeltaf.append(math.fabs(evaluation(u[i]) - evaluation(population[i])))
    if evaluation(u[i]) <= evaluation(population[i]):
      population[i] = u[i]
      A.append(copy.deepcopy(population[ii]))
      SCR.append(copy.deepcopy(CR[i]))
      SF.append(copy.deepcopy(F[i]))
      deltaf.append(math.fabs(evaluation(u[i]) - evaluation(population[i])))
    else:
      population[i] = population[i]
    # if evaluation(u[i]) < evaluation(population[]):
  #whenever the size of the archive exceeds |A| randomly selected individuals are deleted so that
  num = len(popualtion) - len(A)
  if num < 0:
    random.shuffle(A)
    del A[0:num]

  if len(SCR) == 0 & len(SF) == 0:
    #updated mcr mf based on scr sf
    #ここwkの取り方がいまいちわからん
    sumdeltaf = 0
    for j in range(0, len(deltaf)):
      sumdeltaf += deltaf
    wk = alldeltaf[k-1]/sumdeltaf
    MCR[k-1] = meanwa(SCR, wk)
    MF[k-1] = meanwl(SF, wk)
    k += 1
    if k > 100 :
      k =1
