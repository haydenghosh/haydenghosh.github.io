---
layout: post
title: Parabolic Approximation of a Sinusoid
---
## The Problem
Deviating from my usual style, I don't have much of a flowery introduction to give. I thought of this problem a long time ago, and I solved it back in May. I found the result interesting enough to be worth sharing here. Writing it up took forever.

**Sinusoids look awfully similar to a series of truncated parabolas of alternating vertical orientation. Can we quantify *how* similar?**
<figure>
    <img src="../../../assets/sinusoid_vs_parabola.svg"
         alt="">
</figure>
Indeed we can, but first we must define what "similar" really means.

## Fourier Series
A sinusoid consists purely of a single tone, called the fundamental frequency. Meanwhile, any arbitrary periodic signal can be written as a sum of sinusoids of various frequencies – this is known as a Fourier series. So if we find the Fourier-series representation of the parabolic approximation of a sinusoid, then we can identify all the different sinusoids that the approximation contains. One of them will be the original sinusoid that we intend to approximate.

With this information, we can determine how much the original sinusoid contributes to the Fourier series of the approximation. If the Fourier series is mostly composed of the original sinusoid, then the approximation will closely resemble the original. Otherwise, the approximation contains lots of sinusoids of different frequencies, and will look quite different. Thus, "similar" really means "contains similar frequency components".

Below is an (illustrative, not to scale) example of the Fourier series of a triangle wave. The triangle wave is approximated as a sum of three sinusoids of different frequencies. Observe how the approximation is imperfect: it is a little "wobbly," and the tips are not perfectly sharp. The approximation gets better as we increase the number of sinusoids in the sum. As the number of terms approaches infinity, the approximation becomes exactly equal to the true triangle wave.
<figure>
    <img src="../../../assets/fourier_series_illustration.svg"
         alt="">
</figure>
It turns out that identifying frequency components like this is an excellent way to analyze the behavior of signals in general, especially when we pass them through linear systems. This is why the Fourier transform – a generalized version of Fourier series – is used extensively in the analysis and design of circuits and control systems.

## Solution
Now that we have narrowed down the problem and found the path to a solution, it is time for the math. Broadly speaking, we will do the following:
1. Find an equation for $x(t)$, the parabolic approximation of a sine wave.
2. Determine the Fourier series coefficients of $x(t)$.
3. Compute the overall power of $x(t)$.
4. Compute the power of the fundamental frequency components of $x(t)$.
5. Calculate the ratio of the fundamental power to the total power. This is our final answer.
6. Interpret the results.

#### Parabolic Approximation
Our first step is to find an equation for $x(t)$, which represents the parabolic approximation of a reference sinusoid $r(t) = A\sin(2\pi f_{0}t)$. We take $A=1$. For now, let us consider only the first half-period of $x(t)$, which we denote as a parabolic half-pulse $p(t)$. This half-pulse must satisfy the following properties:
- $p(t) = 0$ outside the interval $[0,T_{0}/2]$.
- $p(t)$ is parabolic with roots at $t=0$ and $t=T_{0}/2$.
- The vertex of $p(t)$ is located at $(T_{0}/4,1)$.

A general equation for $p(t)$ is then

$$p(t) = at(t-T_{0}/2)I_{[0,T_{0}/2]}(t)$$

where $I_{[\alpha,\beta]}(t)$ is the *indicator function,* defined as

$$I_{[\alpha,\beta]}(t) = \begin{cases}1, & \alpha\leq t < \beta \\ 0, & \text{else}\end{cases}$$

Plugging the vertex point into $p(t)$ and solving for $a$ gives $a = -16/T_{0}^{2}$. We thus have

$$p(t) = -\frac{16}{T_{0}^{2}}t(t-T_{0}/2)I_{[0,T_{0}/2]}(t)\qquad\text{(parabolic half-pulse)}$$

All we need to do now is write $x(t)$ as a sum of flipped and shifted versions of $p(t)$. The second half-period of $x(t)$ would be $p(t)$ flipped and shifted to the right by $T_{0}/2$, so the entire first period of $x(t)$ is given by $p(t) - p(t-T_{0}/2)$. The pattern then repeats: the $n$th period of $x(t)$ is given by shifting the whole thing by $nT_{0}$. We can write this compactly using summation notation:
<div style="padding: 0.5em; border: 1px solid purple;color:purple;" markdown="1">
**Parabolic Approximation of a Sinusoid**

Consider a reference sinusoid $r(t) = A\sin(2\pi f_{0}t)$.
We can approximate $r(t)$ using scaled, shifted, and truncated parabolas as

$$x(t) = A\sum_{n=-\infty}^{\infty} p(t-nT_{0}) - p(t-T_{0}/2-nT_{0})$$

where

$$p(t) = -\frac{16}{T_{0}^{2}}t(t-T_{0}/2)I_{[0,T_{0}/2]}(t),\quad T_{0}=1/f_{0}$$

</div>
Although this notation is concise, it may be a little difficult to interpret. Below is a visualization of what the various terms represent. Note that we have chosen $T_{0}=1$ and $A=1$.
<figure>
    <img src="../../../assets/parabolic_approx.svg"
         alt="">
</figure>

#### Fourier Series Coefficients
Now that we have found $x(t)$, we can determine its Fourier series coefficients. It is worth mentioning that the requirements for convergence of a Fourier series are fairly lax – the signal just needs to be periodic, bounded, and piecewise continuous. $x(t)$ satisfies all of these properties.

In general, the Fourier series coefficients $a_{k}$ of some signal $x(t)$, periodic with period $T$, are given by

$$a_{k} = \frac{1}{T}\int_{T}x(t)e^{-jk2\pi f_{0}t}dt$$

where $T$ is any period of $x(t)$.

We evaluate for $x(t)$ as defined in the previous section, choosing $T$ as the interval $[0,T_{0}]$ and again taking $A=1$:

$$
\begin{aligned}
    a_{k} &= \frac{1}{T_{0}}\int_{0}^{T_{0}}x(t)e^{-jk2\pi f_{0}t}dt \\
    &= \frac{1}{T_{0}}\int_{0}^{T_{0}}(p(t)-p(t-T_{0}/2))e^{-jk2\pi f_{0}t}dt \\
    &= -\frac{16}{T_{0}^{3}}\int_{0}^{T_{0}/2}t(t-T_{0}/2)e^{-jk2\pi t/T_{0}}dt+\frac{16}{T_{0}^{3}}\int_{T_{0}/2}^{T_{0}}(t-T_{0}/2)(t-T_{0})e^{-jk2\pi t/T_{0}}dt
\end{aligned}
$$

These are tough integrals, but ChatGPT evaluates and simplifies them elegantly. We state the result below:
<div style="padding: 0.5em; border: 1px solid purple;color:purple;" markdown="1">
**Fourier Series of Parabolic Approximation of a Sinusoid**

Consider $x(t)$, the parabolic approximation of a sinusoid as defined in the previous section. The Fourier series coefficients
of $x(t)$ are given by

$$a_{k} = \begin{cases}-A\dfrac{16j}{\pi^{3}k^{3}}, & k\text{ odd}\\ 0, & k\text{ even or } k=0\end{cases}$$

</div>

It is unsurprising that $a_{k}$ is not a function of the fundamental period $T_{0}=1/f_{0}$. Recall that $k$ in a Fourier series really refers to the $k$th multiple of $f_{0}$. That is, the Fourier-series representation of $x(t)$ is a sum of complex exponentials of frequency $kf_{0}$, each scaled by $a_{k}$:

$$x(t) = \sum_{k=-\infty}^{\infty}a_{k}e^{jk2\pi f_{0}t}$$

So the period of $x(t)$ is only specified by $f_{0}$ in the complex exponential above.

Also, it is a good sign that the coefficients are purely imaginary. This should be true of any odd signal. As an exercise, convince yourself that $x(t)$ is odd, i.e. $x(t)=-x(-t)$.

#### Power Computations
Before we proceed, let us remind ourselves that the Fourier series coefficients of a sinusoid of amplitude $A$ (and any frequency) are $a_{-1}=j0.5A$, $a_{1}=-j0.5A$, else zero. This is easily verifiable, and makes sense because a sinusoid *is* a pure tone. It contains no other frequency components by definition.

On the other hand, since our approximation $x(t)$ is not a perfect sinusoid, it does contain other frequency components. This is obvious from the equation for $a_{k}$ that we derived in the previous section. We thus wish to determine how much of the power in $x(t)$ comes from its fundamental frequency components $a_{\pm 1}$. To do this, we first state some key results:

In general, we define the power $P$ of some signal $x(t)$, periodic with period $T$, as

$$P=\frac{1}{T}\int_{T}|x(t)|^{2}dt\qquad\text{(power of a periodic signal)}$$

where $T$ is any period of $x(t)$.

Remarkably, we can perform an equivalent computation using the Fourier series coefficients $a_{k}$ of $x(t)$:

$$P=\sum_{k=-\infty}^{\infty}|a_{k}|^{2}\qquad\text{(power of a periodic signal)}$$

This equivalence is known as Parseval's identity.

We can now continue. We temporarily assume that $x(t)$ is indeed a perfect approximation, i.e. $a_{k}=0$ for all $\|k\|\geq 2$. Then by Parseval's identity, the power $P_{\text{fund}}$ of the fundamental frequency components of $x(t)$ is

$$
\begin{aligned}
    P_{\text{fund}} &= |a_{-1}|^{2}+|a_{0}|^{2}+|a_{1}|^{2} \\
    &= \left(\frac{16A}{\pi^{3}}\right)^{2} + 0 + \left(-\frac{16A}{\pi^{3}}\right)^{2} \\
    P_{\text{fund}} &= \frac{512A^{2}}{\pi^{6}}
\end{aligned}
$$

We now wish to find the total power $P_{\text{tot}}$ of $x(t)$. This can be computed more easily in the time domain:

$$
\begin{aligned}
    P_{\text{tot}} &= \frac{1}{T_{0}}\int_{0}^{T_{0}}|x(t)|^{2}dt \\
    &= \frac{1}{T_{0}}\int_{0}^{T_{0}}|Ap(t)-Ap(t-T_{0}/2)|^{2}dt \\
    &= \frac{A^{2}}{T_{0}}\int_{0}^{T_{0}/2}|p(t)|^{2}dt + \frac{A^{2}}{T_{0}}\int_{T_{0}/2}^{T_{0}}|-p(t-T_{0}/2)|^{2}dt
\end{aligned}
$$

We let ChatGPT do the rest, arriving at

$$P_{\text{tot}} = \frac{8A^{2}}{15}$$

All we need to do now is divide the powers. Everything cancels out beautifully, leaving us with

$$\frac{P_{\text{fund}}}{P_{\text{tot}}} = \frac{960}{\pi^{6}}\approx 99.8555\%$$

Before putting this result in a big purple box, let's be real engineers and find the signal-to-noise ratio (SNR) of $x(t)$ in decibels. This is given by

$$\text{SNR} = 10\log_{10}\left(\frac{P_{\text{fund}}}{P_{\text{tot}}-P_{\text{fund}}}\right)\approx 28.4\,\text{dB}$$

where we used a preceding factor of 10 rather than 20 because we are working with power, not voltage or current.

We are ready to state our final result:
<div style="padding: 0.5em; border: 1px solid purple;color:purple;" markdown="1">
**Performance of Parabolic Approximation of a Sinusoid**

Consider $x(t)$, the parabolic approximation of a sinusoid $r(t) = A\sin(2\pi f_{0}t)$, as defined earlier. *Regardless* of the amplitude $A$ and frequency $f_{0}$, the ratio of power in the fundamental frequency components of $x(t)$ to the total power of $x(t)$ is

$$\frac{P_{\text{fund}}}{P_{\text{tot}}} = \frac{960}{\pi^{6}}\approx 99.8555\%$$

Alternatively, the signal-to-noise ratio of $x(t)$ is

$$\text{SNR}\approx 28.4\,\text{dB}$$

</div>

## Interpreting the Results
From our equation for $a_{k}$, we observe that the magnitude of the Fourier series coefficients of $x(t)$ falls off as $1/k^{3}$. This is shown below. Again, we have set $A=1$.
<figure>
    <img src="../../../assets/fourier_coeff_mag.svg"
         alt="">
</figure>
It is perhaps more useful to plot the power of the coefficients in decibels. The values are normalized such that the fundamental coefficients $a_{-1}$ and $a_{1}$ are at 0 dB. 
<figure>
    <img src="../../../assets/fourier_coeff_pwr_db.svg"
         alt="">
</figure>
The first harmonics $a_{-2}$ and $a_{2}$ are at around –28.6 dB, meaning that they contribute around 729 times less power than the fundamental components. The power of the higher harmonics decreases further. By this metric, the approximation is quite an excellent one.

The story changes if we consider the human ear, which is *quite* sensitive. Below are two audio clips: one is a pure sinusoid of frequency 440 Hz (the note "A"), and the other is the parabolic approximation. Listen to both – can you tell which is which?

<div style="padding: 0.5em; border: 1px solid purple; color:purple; display: inline-block; text-align: center;">
    <details> <summary>Clip #1 (click to reveal)</summary>Pure Sinusoid</details>
    <audio controls style="display: block; margin: 0 auto;">
        <source src="../../../assets/pure_sinusoid.wav" type="audio/wav">
    </audio>
</div>
<div style="padding: 0.5em; border: 1px solid purple; color:purple; display: inline-block; text-align: center;">
    <details> <summary>Clip #2 (click to reveal)</summary>Parabolic Approximation</details>
    <audio controls style="display: block; margin: 0 auto;">
        <source src="../../../assets/parabolic_approx.wav" type="audio/wav">
    </audio>
</div>

We calculated earlier that the signal-to-noise ratio of the parabolic approximation is around 28.4 dB. While this may be decent in an electrical system, it is quite unimpressive to the ear. Most music is recorded using gear that provides an SNR of at least 70 dB. Thus, if you listen to the clips in a quiet room (or with noise-canceling earphones), it should be fairly easy to tell them apart. If you listen in a noisy environment, it becomes nearly impossible to hear the difference.

## Concluding Thoughts
I always love tangible connections between mathematics and the physical world. I take comfort in the occasional reminder that the math *works* – that these integrals and sums and Fourier series really do mean something.

I also appreciate the power of mathematics as a means of satisfying my curiosity. What began as a simple graphical observation could be narrowed down to a specific problem with an exact, yet fairly intuitive solution. This would be unattainable without math.

If you are studying electrical engineering, you will encounter the math I used throughout this post in a signals and systems course. The subject is notoriously difficult and dry, and many (including me) struggle with it when they first learn it. But I urge you not to give up. The symbols and jargon may seem daunting, but it is all just a tool for expressing ideas that are quite intuitive. Eventually it will all make sense, and you will see the beauty in what you learned.

To those who disregarded the math, that's okay too! Ultimately, I think there is great value in not only being inquisitive, but having the confidence to at least attempt to answer your questions. That's really what I tried to do here.
