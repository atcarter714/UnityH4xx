<img src="https://github.com/atcarter714/UnityH4xx/blob/main/files/UHBanner01.png?raw=true" width=640><br><br>


# **About Unity H4xx Project**

## A project to share ways of bending the rules and maximizing performance ...
--------------------------------------------------------------------------------------------------------------
This all began as an "academic" sort of project, and it actually worked well enough (and intrigued enough people) to
make me decide to put it up here and make it available.
<br>



<br>
<img src="https://github.com/atcarter714/UnityH4xx/blob/main/files/flameBanner_01a.png" width=256> 

## [CollectionMarshal.AsSpan<T>](https://learn.microsoft.com/en-us/dotnet/api/system.runtime.interopservices.collectionsmarshal.asspan?view=net-7.0) for Unity (and [older .NET versions](https://learn.microsoft.com/en-us/previous-versions/dotnet/)):


The awesome [CollectionMarshal](https://learn.microsoft.com/en-us/dotnet/api/system.runtime.interopservices.collectionsmarshal?view=net-7.0) class introduced in .NET 5 hasn't ever been available for Unity developers, at
least not until now. I have sort of back-ported the feature so that I would be able to use it in Unity and
make better use of List collections. Lists are really convenient and intuitive to use, and have good add
and remove functionality which makes them better than arrays much of the time. However, in older versions of
the .NET Framework 4 or Standard 2 runtimes that Unity provides us, there was no CollectionMarshal, which
meant no Span from your list. 

**Span\<T\>** also allows us to obtain a pointer to the underlying array of a **List\<T\>** when compiling with the
`/unsafe` switch. This gives us the all-around fastest way one can iterate a List of value types in .NET/Mono!
This means that suddenly a big List of values such as transformation data or vertex positions is suddenly much
cheaper to use ...
<br><br>

## ***How much faster is it?***
<div>
<img src="https://github.com/atcarter714/UnityH4xx/blob/main/files/benchmark results/benchmark_chart01a_1024.png" width=417>
<img src="https://github.com/atcarter714/UnityH4xx/blob/main/files/benchmark results/benchmark_chart01b_1024.png" width=417>
</div>

<br><br>
--------------------------------------------------------------------------------------------------------------
### [Benchmark.NET Log File Info:](http://github.com/atcarter714/UnityH4xx/blob/main/files/benchmark results/ListIterationTests-20221130-222926.log)




### Final Benchmark Times by iteration style:<br>
##### (μs = nanoseconds)
--------------------------------------------------------------
|          Method |     Mean |   Error |  StdDev | Allocated |
|---------------- |---------:|--------:|--------:|----------:|
| 'foreach loop:' | 804.1 μs | 6.69 μs | 6.26 μs |         - |
|     'for loop:' | 473.7 μs | 7.29 μs | 6.82 μs |         - |
|      AsSpan<T>: | 369.9 μs | 3.94 μs | 3.68 μs |         - |
|     'Span* Ptr' | 204.0 μs | 0.31 μs | 0.28 μs |         - |
--------------------------------------------------------------
```
Benchmark.NET v0.13.2, OS=Windows 11 (10.0.22621.819)
12th Gen Intel Core i9-12900K CPU, 24 logical & 16 phys. cores
.NET Framework 4.8.1, X64 RyuJIT VectorSize=256
```
