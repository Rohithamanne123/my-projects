#!/usr/bin/env python
# coding: utf-8

# In[437]:


import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns


# In[390]:


df = pd.read_csv('titanic.csv')


# In[391]:


df


# In[392]:


df.isnull().sum()


# In[393]:


df = df.fillna(df.Age.mean())
df = df.fillna(0)


# In[394]:


df.isnull().sum()


# In[395]:


df.nunique()


# In[396]:


df.info()


# In[397]:


df


# In[398]:


x = df.iloc[:,[2,4,5,6,7]].values
y = df.iloc[:,1].values


# In[399]:


x


# In[400]:


y


# In[401]:


sns.heatmap(df.corr(), annot = True)


# In[402]:


from sklearn.preprocessing import LabelEncoder

# Assuming 'Sex' is a column in your DataFrame
label_encoder = LabelEncoder()
x[:,1] = label_encoder.fit_transform(x[:,1])


# In[403]:


label_encoder


# In[404]:


x


# In[417]:


from sklearn.model_selection import train_test_split
x_train, x_test, y_train, y_test = train_test_split(x,y, test_size= 0.90, random_state = 500)

from sklearn.preprocessing import StandardScaler
sc = StandardScaler()
x_train = sc.fit_transform(x_train)
x_test = sc.fit_transform(x_test)


# In[418]:


from sklearn.linear_model import LogisticRegression
classifier = LogisticRegression()
classifier.fit(x_train, y_train)


# In[419]:


y_pred = classifier.predict(x_test)


# In[420]:


from sklearn.metrics import confusion_matrix
confusion_matrix(y_test, y_pred)


# In[421]:


from sklearn.metrics import accuracy_score 
accuracy_score(y_test, y_pred)


# In[422]:


classifier.score(x_test, y_test)


# In[428]:


from sklearn.model_selection import train_test_split
x_train, x_test, y_train, y_test = train_test_split(x,y, test_size = 0.95, random_state = 500)
from sklearn.linear_model import LinearRegression
regr = LinearRegression()
regr.fit(x_train, y_train)
y_train_pred = regr.predict(x_train)
y_test_pred = regr.predict(x_test)
from sklearn.metrics import mean_squared_error, r2_score
print(mean_squared_error(y_train, y_train_pred), mean_squared_error(y_test, y_test_pred))
print(r2_score(y_train,y_train_pred), r2_score(y_test, y_test_pred))


# In[383]:


from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_squared_error
from sklearn.preprocessing import StandardScaler

# Assuming x_train, x_test, y_train, y_test are properly defined and preprocessed
# For simplicity, using a subset of features for demonstration purposes
selected_features = ['Pclass', 'Age', 'SibSp', 'Parch', 'Fare']

x = df[selected_features]
y = df['Survived']

# Split the data into training and test sets
x_train, x_test, y_train, y_test = train_test_split(x, y, test_size=0.97, random_state=0)

# Standardize the features
scaler = StandardScaler()
x_train_scaled = scaler.fit_transform(x_train)
x_test_scaled = scaler.transform(x_test)

# Create a linear regression model
regression_model = LinearRegression()

# Fit the model to the training data
regression_model.fit(x_train_scaled, y_train)

# Make predictions on the test set
y_pred = regression_model.predict(x_test_scaled)

# Evaluate the model
mse = mean_squared_error(y_test, y_pred)
print(f'Mean Squared Error: {mse}')

# Optionally, you can print the coefficients and intercept
coefficients = regression_model.coef_
intercept = regression_model.intercept_

print(f'Coefficients: {coefficients}')
print(f'Intercept: {intercept}')


# In[441]:


df = pd.read_csv('Classified_Data')


# In[442]:


df


# In[443]:


df.head()


# In[444]:


df.shape


# In[450]:


df=pd.read_csv('Classified_Data',index_col=0)


# In[451]:


df


# In[452]:


x=df.iloc[:,0:10]


# In[453]:


x


# In[458]:


y=df.iloc[:,-1]


# In[459]:


y


# In[460]:


x = df.iloc[:,0:10].values
y = df.iloc[:,-1].values


# In[462]:


from sklearn.neighbors import KNeighborsClassifier
knn=KNeighborsClassifier(n_neighbors=1)   #n_neighbors is the k value
knn.fit(x_train,y_train)


# In[463]:


pred=knn.predict(x_test)


# In[464]:


from sklearn.metrics import classification_report, confusion_matrix
print(confusion_matrix(y_test,pred))


# In[465]:


print(classification_report(y_test,pred))


# In[ ]:




