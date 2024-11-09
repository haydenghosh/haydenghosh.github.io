---
layout: post
title: Indicator Function in Matlab
date: 2024-11-08
---

This is a short note on how to implement the "indicator function" in Matlab.

The indicator function is perhaps better known as the "rect" function, but I prefer the notation of the indicator function (as defined by Prof. Madhow at UCSB):

$$I_{[a,b]}(t) = \begin{cases}1, & a\leq t\leq b \\ 0, & \text{else}\end{cases}$$

In Matlab, we can implement this as follows:
```
function y = ind(a,b,t)
    y = (a <= t & t <= b);
end
```
