# dotnet core AI/ML

[github link]()

## Entry level

f(x) to tell whether it's human face or not
with algorithms to use data to generate model

### ML.NET

1. Sentiment Analysis
2. Product recommendation
3. Price prediction
4. Customer segmentation
5. Object detection
6. Fraud detection
7. Sales spike detection
8. Image classification
9. ????

#### examples

```c#
// tensorflow.net
using (var session = new TFSession())
{
    var graph - session.Graph;
    Console.WriteLine(TFCore.Version);
    ...
}
```

#### ML.NET AutoML

can automatically choose best model via following existing domain

1. Regression
2. ???

> mlnet auto-train --task regression --dataset taxi-fare-train.csv --test-dataset taxi-fare-test.csv --label-column-name fare_amount --max-exploration-time 120

**from v1.4 support jupyter notebook**

### SciSharp

AI development suite and AI platform
[scisharp github](https://github.com/SciSharp)

ML.NET is using SciSharp technology

#### ICSharpCore

[github link](https://github.com/SciSharp/ICSharpCore)

via roslyn/nuget to import packages(ML.NET 1.4) or import local dll

### Tensorflow.net

[github link](https://github.com/SciSharp/TensorFlow.Net)
[example link](https://github.com/SciSharp/TensorFlow.Net-Examples)

### Karas.NET - python based

[github link](https://github.com/SciSharp/Keras.NET)


### Scenarios

#### Pure Binding

TensorFlow.NET/NumSharp

#### python binding

Keras.NET ... 

### Scenarios

#### Face Recognition

#### Image Resolution Raising