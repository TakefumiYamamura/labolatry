# coding: utf8
import random
import copy
import math
from scipy.stats import cauchy
import numpy as np

random.seed(0)
eva_count = 0
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
  li = copy.deepcopy(P)
  if len(A) != 0:
   li.extend(copy.deepcopy(A))
  two_vector = random.sample(li, 2)
  x2 = two_vector[0]
  x3 = two_vector[1]

  #RANDOMに選択した個体100*p個の中から最良個体を選ぶ
  # print int(p*100)
  ran_G = random.sample(li, int(p*100))
  # print ran_G
  xp = []
  mini_evaluation = 1001001001
  for i in ran_G :
    if mini_evaluation > evaluation(i):
      mini_evaluation = evaluation(i)
      xp = copy.deepcopy(i)
  # print xp
  v = list(np.array(x)+F*(np.array(xp)-np.array(x))+F*(np.array(x2)-np.array(x3)))#xpは最良個体にしないといけない（個体評価の関数を作る必要があり）
  #ミュータントベクター精製後CRをりようしてbinomial crossover
  # print len(v)
  # print len(x)
  u = []
  i = 0
  # print v[3]
  while i < len(v):
    # print v[i]
    if (random.uniform(0, 1) < CR):
      u.append(copy.deepcopy(v[i]))
    else:
      u.append(copy.deepcopy(x[i]))
    # print u
    i += 1
  # print u
  return u

def evaluation(x):
  #ベンチマーク関数にするんだお
  # print x
  su = 0
  global eva_count
  eva_count += 1
  # print eva_count
  for a in x :
    # print a
    su += (a*a)
  # su  -= 1400
  # print su
  return su

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

# print len(MCR)
A = []
# index counter
k = 1

bag_count = 0

#51は試行回数
estimated_count = 0
for var in range(0, 10000):
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
    cr = rand_normal(MCR[var1], math.sqrt(0.1))
    if cr > 1:
      cr = 1
    if cr < 0:
      cr = 0
    CR.append(copy.deepcopy(cr))
    f = cauchy.rvs()
    while True:
      if f > 1:
        f = 1.0
        break
      if f > 0:
        break
      f = cauchy.rvs()
    # print f
    F.append(copy.deepcopy(f)) #コーシー乱数発生よく分かっておらず そもそもなんでコーシー乱数？
    p = random.uniform(2.0/NP, 0.2)
    # generate_trial_vector(x, P, A, p, N, CR, F)
    u.append(generate_trial_vector(population[var1], population, A, p, N, CR[var1], F[var1]))#current to pbest/1/bin
  test_count = 0

  # print len(u)
  for i in range(0, len(population)):
    test_count += 1
    alldeltaf.append(math.fabs(evaluation(u[i]) - evaluation(population[i])))
    if evaluation(u[i]) <= evaluation(population[i]):
      population[i] = u[i]
      A.append(copy.deepcopy(population[i]))
      SCR.append(copy.deepcopy(CR[i]))
      SF.append(copy.deepcopy(F[i]))
      deltaf.append(math.fabs(evaluation(u[i]) - evaluation(population[i])))
    else:
      population[i] = population[i]
    # if evaluation(u[i]) < evaluation(population[]):
  #whenever the size of the archive exceeds |A| randomly selected individuals are deleted so that
  num = len(population) - len(A)
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

  print var
  mini_ev = 1010111111
  for x in population :
    if mini_ev > evaluation(x):
      mini_ev = evaluation(x)
      xp = copy.deepcopy(x)
  print mini_ev
