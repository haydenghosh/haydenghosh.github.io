---
layout: post
title: "Fourier Series Coefficients: Derivation"
date: 2024-11-10
---

To ensure that everyone is on the same page, we begin with the definition of Fourier Series:

If we have a signal $x(t)$ that is periodic with fundamental period $T_{0}$ (fundamental frequency <br> $f_{0} = 1/T_{0}$), then we can express $x(t)$ as a sum of sinusoids of frequencies that are integer multiples of $f_{0}$. Each sinusoid is weighted by some coefficient $a_{k}$; these $a_{k}$ are called the Fourier coefficients.

Mathematically, the Fourier series representation of $x(t)$ can be written as follows:

$$x(t) = \sum_{k=-\infty}^{\infty}a_{k}e^{jk2\pi f_{0}t}\tag{1}$$

To find the Fourier coefficients $a_{k}$, we must solve the following integral[^1]:

$$a_{k} = \frac{1}{T}\int_{T}x(t)e^{-jk2\pi f_{0}t}dt\tag{2}$$

We are going to derive the above equation (2).

[^1]: We note that $T$ can be any period (i.e. it can be the fundamental period $T_{0}$, or any integer multiple of $T_{0}$).
