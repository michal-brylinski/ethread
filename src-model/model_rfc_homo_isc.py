#!/usr/bin/env /var/scratch/michal/apps/anaconda3/bin/python

import pandas as pd
import pickle
from sklearn import cross_validation
from sklearn.metrics import roc_curve, auc
from sklearn.ensemble import RandomForestClassifier
from sklearn.externals import joblib

def load(ifn):
    return pd.read_csv(ifn, header=None, sep=" ")

def train(X, y):
    rfc = RandomForestClassifier(n_estimators=100)
    return rfc.fit(X, y)

dset = load("../dat/data_rfc_homo_isc.dat")

X = dset[[1, 2, 3]].values
y = dset[0].values

clf = train(X, y)

joblib.dump(clf, "../mod/ethread_rfc_homo_isc.pkl", compress=9)
