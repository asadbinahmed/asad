# A few challenges

This project consist of three challenges mostly on Cloud and programming. 


# [Challenge 1](https://github.com/senthilkm/challenges/tree/main/challenge1)

A 3 tier environment is a common setup. Use a tool of your choosing/familiarity create these resources. Please remember we will not be judged on the outcome but more focusing on the approach, style and reproducibility.

# [Challenge 2](https://github.com/senthilkm/challenges/tree/main/challenge2)

We need to write code that will query the **meta data** of an instance within **AWS/Azure/GCP** and provide a JSON formatted output. The choice of language and implementation is up to you.

Refer to the documentation of the respective public cloud providers 

# [Challenge 3](https://github.com/senthilkm/challenges/tree/main/challenge3)

We have a nested object, we would like a function that you pass in the object and a key and get back the value. How this is implemented is up to you. 

 >  Given an object 
```json
{"a":{"b":{"c":"d"}}}
```
 > and the  key =
 `` a/b/c `` 
 the function to return 
 ```json 
 d
 ```
 >  Given an object 
```json
{"x":{"y":{"z":"a"}}}
```
 > and the  key =
 `` x/y/z`` 
 the function to return 
 ```json 
 a
 ```

 Refer to  [get_in](https://hexdocs.pm/elixir/master/Kernel.html#get_in/2) function of Elixir for the implementation.

