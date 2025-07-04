function p = pulse(t,f)
    T = 1/f;
    a = 1/((T/4)*(T/4-T/2));
    t_trunc = t.*(0 <= t & t < T/2);
    p = a*t_trunc.*(t_trunc-T/2);
end