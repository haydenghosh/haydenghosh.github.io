---
layout: post
title: Test Music Post
date: 2025-09-16
---

This is a short note on how to implement the "indicator function" in Matlab.

The indicator function is perhaps better known as the "rect" function, but I prefer the notation of the indicator function:

$$I_{[a,b)}(t) = \begin{cases}1, & a\leq t < b \\ 0, & \text{else}\end{cases}$$

In Matlab, we can implement this as follows:
```
function y = ind(a,b,t)
    y = (a <= t & t < b);
end
```
