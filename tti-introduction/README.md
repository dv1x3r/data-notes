# [Introduction to Intelligence Systems (4 year / 2 semester)](https://github.com/dv1x3r/tti-computer-science/tree/master/IV.%20Fourth%20Year/python-intelligence-systems)

## Exercise 1 - Кластеризация методом 𝒌 средних
* /KMeans.ipynb
* [sklearn.cluster.KMeans](https://scikit-learn.org/stable/modules/generated/sklearn.cluster.KMeans.html#sklearn.cluster.KMeans)

Минимум:
* реализация, работающая на наборе данных «цветы ириса»
* подсчет доли верно определенных классов (accuracy)  

Улучшения:
* визуализация результатов (matplotlib.pyplot.scatter),
* сжатие изображений (нахождение «центров тяжести» в пространстве цветов),
* \*\*векторизованная реализация (и сравнение с циклической реализацией),
* инициализация 𝑘 средних++,
* \*векторизованная инициализация 𝑘 средних++.

## Exercise 2 - Перцептрон
* /Perceptron.ipynb
* [sklearn.linear_model.Perceptron](https://scikit-learn.org/stable/modules/generated/sklearn.linear_model.Perceptron.html)

Минимум:
* реализация, работающая на наборе данных «цветы ириса» (линейно разделимые классы: Iris-setosa, Iris-versicolor),
* подбор коэффициента обучения 𝛼,
* подсчет доли верно определенных классов (accuracy) на обучающей (80% данных) и валидационной (20% данных) выборках.  

Улучшения:
* векторизованная реализация,
* визуализация результатов.


## Exercise 3 - Адаптивный линейный нейрон (Adaline)
* /Adaline.ipynb

Минимум:
* реализация, работающая на наборе данных «цветы ириса» (линейно разделимые классы: Iris-setosa, Iris-versicolor; линейно неразделимые классы: Iris-versicolor, Iris-virginica),
* стандартизация данных,
* подбор коэффициента обучения 𝛼,
* подсчет доли верно определенных классов (accuracy) на обучающей и валидационной выборках (80:20).  

Улучшения:
* векторизованная реализация,
* визуализация результатов,
* стохастический градиентный спуск (сравнение с пакетным ГС),
* мини-пакетный градиентный спуск (сравнение с пакетным и стохастическим ГС).  

Примечание: Если реализовать мини-пакетный ГС, то стохастический программировать не нужно: это частный случай. Для примера решенного в классе, нужно выбрать коэффициент обучения a=0.01. Тогда delta_w = (-0.95, -1.35), delta_b = -0.1. С учётом обновленных параметров стоимость снизится до 70.22.  


## Exercise 4 - Линейная регрессия
* /LinearRegression.ipynb
* [sklearn.linear_model.LinearRegression](https://scikit-learn.org/stable/modules/generated/sklearn.linear_model.LinearRegression.html)

Минимум:
* восстановление прямой по нескольким известным точкам,
* визуализация восстановления прямой по точкам,
* модель, оценивающая производительность компьютеров по числовым признакам (https://archive.ics.uci.edu/ml/datasets/Computer+Hardware),
* оценка производительности построенной регрессионной модели.  

Дополнительно:
* модель, оценивающая производительность компьютеров по разнотипным (всем) признакам.  

Примечание:  
Целевой признак: 'PRP'; признак 'ERP' необходимо исключить (см. документацию).  


## Exercise 5 - Логистическая регрессия
* /LogisticRegression.ipynb
* [sklearn.linear_model.LogisticRegression](https://scikit-learn.org/stable/modules/generated/sklearn.linear_model.LogisticRegression.html)

Минимум:
* реализация метода,
* применение метода на наборе данных «Болезни сердца» (https://archive.ics.uci.edu/ml/datasets/Statlog+%28Heart%29),
* оценка производительности на обучающей и валидационной выборках (80:20).  

Дополнительно:
* векторизованная реализация метода,
* регуляризация L2,
* подбор гиперпараметров (коэффициент обучения 𝛼, коэффициент регуляризации 𝜆),
* мини-пакетный градиентный спуск.  


## Exercise 6 - Многослойые нейронные сети
* /Multilayer.ipynb

Минимум:
* векторизованная реализация метода,
* применение метода на наборе данных XOR,
* применение метода на наборе данных «кольца»,
* применение метода на наборе данных «месяцы».  

Дополнительно:
* мини-пакетный градиентный спуск,
* регуляризация L2,
* проверка градиента,
* применение метода на наборе данных «Болезни сердца»,
* подбор гиперпараметров на наборе данных «Болезни сердца».  

Примечание:  
Для создания шаблонных наборов данных рекомендуется пакет sklearn.datasets.  

## Notes

Libraries
```
# numpy - работа с матрицами
# scipy - научные вычисления
# pandas - надстройка над numpy: матрицы в виде таблиц
# scikit-learn - машинное обучение
# matplotlib - работа с графиками
# seaborn - надстройка над matplotlib: стандартные графики
# jupyter - сервер вычислений

pip3 install numpy scipy pandas scikit-learn matplotlib seaborn jupyter
jupyter notebook
```

* [Towards Data Science](https://towardsdatascience.com/)
* [dataquest.io](https://www.dataquest.io/)
* [datacamp.com](https://www.datacamp.com/)
* [python-course.eu](https://www.python-course.eu/numerical_programming_with_python.php)
* [Pandas_Cheat_Sheet.pdf](http://pandas.pydata.org/Pandas_Cheat_Sheet.pdf)
* [10 Minutes to pandas](https://pandas.pydata.org/pandas-docs/stable/getting_started/10min.html)
* [Pandas Tutorial: DataFrames in Python 'datacamp.com'](https://www.datacamp.com/community/tutorials/pandas-tutorial-dataframe-python)
* [List Comprehensions in Python](https://www.pythonforbeginners.com/basics/list-comprehensions-in-python)
* [Использование точечных диаграмм для визуализации данных 'habr.com'](https://habr.com/ru/post/440674/)
* [Data Science в Visual Studio Code с использованием Neuron 'habr.com'](https://habr.com/ru/company/microsoft/blog/428738/)
* [Loading A CSV Into pandas](https://chrisalbon.com/python/data_wrangling/pandas_dataframe_importing_csv/)
* [NumPy - Broadcasting](https://www.tutorialspoint.com/numpy/numpy_broadcasting.htm)
* [SciPy - Broadcasting](https://docs.scipy.org/doc/numpy/user/basics.broadcasting.html)
* [SciPy - Indexing](https://docs.scipy.org/doc/numpy-1.13.0/reference/arrays.indexing.html)
* [Векторизация](http://slemeshevsky.github.io/python-num-pde/term2/build/html/_fdm-for-wave/vectorization.html)
* [Single-Layer Neural Networks and Gradient Descent](https://sebastianraschka.com/Articles/2015_singlelayer_neurons.html)
* [What is the difference between a Perceptron, Adaline, and neural network model?](https://sebastianraschka.com/faq/docs/diff-perceptron-adaline-neuralnet.html)
* [Лекции по Big Data 'youtube.com'](https://www.youtube.com/playlist?list=PLDCK7Cej1W41qOk-XRRVNELkr_ouOxxzI)
* [Machine Learning — Andrew Ng, Stanford University [FULL COURSE] 'youtube.com'](https://www.youtube.com/watch?v=PPLop4L2eGk&list=PLLssT5z_DsK-h9vYZkQkYNWcItqhlRJLN)
* [playground.tensorflow.org](https://playground.tensorflow.org/)
* [Softmax function 'wikipedia.org'](https://en.wikipedia.org/wiki/Softmax_function)
* [Это нужно знать: Ключевые рекомендации по глубокому обучению (Часть 1)](http://datareview.info/article/eto-nuzhno-znat-klyuchevyie-rekomendatsii-po-glubokomu-obucheniyu-chast-1/)
* [Это нужно знать: Ключевые рекомендации по глубокому обучению (Часть 2)](http://datareview.info/article/eto-nuzhno-znat-klyuchevyie-rekomendatsii-po-glubokomu-obucheniyu-chast-2/)