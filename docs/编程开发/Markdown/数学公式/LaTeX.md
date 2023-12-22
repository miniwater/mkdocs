# LaTeX

LaTeX是在TeX基础上，规范化出了一种格式，一种编写风格。可以理解为LaTeX是由TeX写的。

符号文档：[按字母排序](https://katex.org/docs/support_table.html) [按类型排序](https://katex.org/docs/supported.html)

画符号显示符号名称：[Detexify](https://detexify.kirelabs.org/classify.html)

在线手写公式生成数学表达式代码：<https://webdemo.myscript.com/views/math/index.html#>

详细文档：<https://en.wikibooks.org/wiki/LaTeX/Mathematics>

> LaTeX存在大量第三方插件扩展，包括不限于：Amsmath、MathTools、mathrsfs、amsfonts、xcolor...
>
> 文档尽量不考虑扩展确保兼容

使用方法：

| 类型        | 内联公式 | 显示的方程   | 显示并自动编号的方程                                                     |
|-------------|---------|-------------|------------------------------------------------------------------------|
| Environment | math    | displaymath | equation                                                               |
| LaTeX       | `\(...\)` | `\[...\]` |                                                                        |
| TeX         | `$...$` | `$$...$$`   |                                                                        |
| Comment     |         |             | equation* (starred version) suppresses numbering, but requires amsmath |

```md
$$
E=mc^2
$$

\[ f(n) =
  \begin{cases}
    n/2       & \quad \text{if } n \text{ is even}\\
    -(n+1)/2  & \quad \text{if } n \text{ is odd}
  \end{cases}
\]

```

\[ f(n) =
  \begin{cases}
    n/2       & \quad \text{if } n \text{ is even}\\
    -(n+1)/2  & \quad \text{if } n \text{ is odd}
  \end{cases}
\]

## 符号

### 关系符号

 象征                | 脚本                |   | 象征               | 脚本
-------------------|-------------------|---|------------------|------------------
 $<$               | `<`               |   | $>$              | `>`
 $\leq$            | `\leq`            |   | $\geq$           | `\geq`
 $\ll$             | `\ll`             |   | $\gg$            | `\gg`
 $\subset$         | `\subset`         |   | $\supset$        | `\supset`
 $\subseteq$       | `\subseteq`       |   | $\supseteq$      | `\supseteq`
 $\nsubseteq$      | `\nsubseteq`      |   | $\nsupseteq$     | `\nsupseteq`
 $\sqsubset$       | `\sqsubset`       |   | $\sqsupset$      | `\sqsupset`
 $\sqsubseteq$     | `\sqsubseteq`     |   | $\sqsupseteq$    | `\sqsupseteq`
 $\preceq$         | `\preceq`         |   | $\succeq$        | `\succeq`
 $\therefore$      | `\therefore`      |   | $\because$       | `\because`
 $\parallel$       | `\parallel`       |   | $\nparallel$     | `\nparallel`
 $\asymp$          | `\asymp`          |   | $\bowtie$        | `\bowtie`
 $\vdash$          | `\vdash`          |   | $\dashv$         | `\dashv`
 $\in$             | `\in`             |   | $\ni$            | `\ni`
 $\smile$          | `\smile`          |   | $\frown$         | `\frown`
 $\models$         | `\models`         |   | $\notin$         | `\notin`
 $\perp$           | `\perp`           |   | $\mid$           | `\mid`
 $\prec$           | `\prec`           |   | $\succ$          | `\succ`
 $\sphericalangle$ | `\sphericalangle` |   | $\measuredangle$ | `\measuredangle`

象征        | 脚本        |   | 象征        | 脚本
-----------|-----------|---|-----------|-----------
 $=$       | `=`       |   | $\simeq$  | `\simeq`  
 $\doteq$  | `\doteq`  |   | $\sim$    | `\sim`
 $\equiv$  | `\equiv`  |   | $\propto$ | `\propto`
 $\approx$ | `\approx` |   | $\neq$    | `\neq`
 $\cong$   | `\cong`   |   |           |

### 二进制操作

 象征                 | 脚本                 |   | 象征          | 脚本
--------------------|--------------------|---|-------------|-------------
 $\pm$              | `\pm`              |   | $\cap$      | `\cap`
 $\mp$              | `\mp`              |   | $\cup$      | `\cup`
 $\times$           | `\times`           |   | $\uplus$    | `\uplus`
 $\div$             | `\div`             |   | $\sqcap$    | `\sqcap`
 $\ast$             | `\ast`             |   | $\sqcup$    | `\sqcup`
 $\star$            | `\star`            |   | $\vee$      | `\vee`
 $\dagger$          | `\dagger`          |   | $\wedge$    | `\wedge`
 $\ddagger$         | `\ddagger`         |   | $\cdot$     | `\cdot`
 $\diamond$         | `\diamond`         |   | $\oplus$    | `\oplus`
 $\bigtriangleup$   | `\bigtriangleup`   |   | $\ominus$   | `\ominus`
 $\bigtriangledown$ | `\bigtriangledown` |   | $\otimes$   | `\otimes`
 $\triangleleft$    | `\triangleleft`    |   | $\oslash$   | `\oslash`
 $\triangleright$   | `\triangleright`   |   | $\odot$     | `\odot`
 $\bigcirc$         | `\bigcirc`         |   | $\circ$     | `\circ`
 $\bullet$          | `\bullet`          |   | $\setminus$ | `\setminus`
 $\wr$              | `\wr`              |   | $\amalg$    | `\amalg`

### 设置和/或逻辑符号

  象征                   | 脚本                   |   | 象征                | 脚本
----------------------|----------------------|---|-------------------|----------------------------
 $\exists$            | `\exists`            |   | $\rightarrow$     | `\rightarrow` 或 `\to`
 $\nexists$           | `\nexists`           |   | $\leftarrow$      | `\leftarrow` 或 `\gets`
 $\forall$            | `\forall`            |   | $\mapsto$         | `\mapsto`
 $\neg$               | `\neg`               |   | $\implies$        | `\implies`
 $\impliedby$         | `\impliedby`         |   | $\Rightarrow$     | `\Rightarrow` 或 `\implies`
 $\leftrightarrow$    | `\leftrightarrow`    |   | $\Leftrightarrow$ | `\Leftrightarrow`
 $\iff$               | `\iff`               |   | $\angle$          | `\angle`
 $\land$              | `\land`              |   | $\lor$            | `\lor`
 $\top$               | `\top`               |   | $\bot$            | `\bot`
 $\emptyset$          | `\emptyset`          |   | $\varnothing$     | `\varnothing`
 $\rightleftharpoons$ | `\rightleftharpoons` |   |                   |

### 分隔符

 象征           | 脚本           |   | 象征           | 脚本
--------------|--------------|---|--------------|--------------
 $\mid$       | `\mid`       |   | $\|$         | `\|`
 $\{$         | `\{`         |   | $\}$         | `\}`
 $\uparrow$   | `\uparrow`   |   | $\Uparrow$   | `\Uparrow`
 $\downarrow$ | `\downarrow` |   | $\Downarrow$ | `\Downarrow`
 $/$          | `/`          |   | $\backslash$ | `\backslash`
 $\langle$    | `\langle`    |   | $\rangle$    | `\rangle`
 $\lceil$     | `\lceil`     |   | $\rceil$     | `\rceil`
 $\lfloor$    | `\lfloor`    |   | $\rfloor$    | `\rfloor`

### 希腊字母

 象征        | 脚本        |   | 象征                       | 脚本
-----------|-----------|---|--------------------------|--------------------------
 $A$       | `A`       |   | $\alpha$                 | `\alpha`
 $B$       | `B`       |   | $\beta$                  | `\beta`
 $\Gamma$  | `\Gamma`  |   | $\gamma$                 | `\gamma`
 $\Delta$  | `\Delta`  |   | $\delta$                 | `\delta`
 $E$       | `E`       |   | $\epsilon$ $\varepsilon$ | `\epsilon` `\varepsilon`
 $Z$       | `Z`       |   | $\zeta$                  | `\zeta`
 $H$       | `H`       |   | $\eta$                   | `\eta`
 $\Theta$  | `\Theta`  |   | $ heta$ $\vartheta$      | `\theta` `\vartheta`
 $I$       | `I`       |   | $\iota$                  | `\iota`
 $K$       | `K`       |   | $\kappa$ $\varkappa$     | `\kappa` `\varkappa`
 $\Lambda$ | `\Lambda` |   | $\lambda$                | `\lambda`
 $M$       | `M`       |   | $\mu$                    | `\mu`
 $N$       | `N`       |   | $\nu$                    | `\nu`
 $\Xi$     | `\Xi`     |   | $\xi$                    | `\xi`
 $O$       | `O`       |   | $o$                      | `o`
 $\Pi$     | `\Pi`     |   | $\pi$ $\varpi$           | `\pi` `\varpi`
 $P$       | `P`       |   | $\rho$ $\varrho$         | `\rho` `\varrho`
 $\Sigma$  | `\Sigma`  |   | $\sigma$ $\varsigma$     | `\sigma` `\varsigma`
 $T$       | `T`       |   | $\tau$                   | `\tau`
 $Y$       | `Y`       |   | $\Upsilon$ $\upsilon$    | `\Upsilon` `\upsilon`
 $\Phi$    | `\Phi`    |   | $\phi$ $\varphi$         | `\phi` `\varphi`
 $X$       | `X`       |   | $\chi$                   | `\chi`
 $\Psi$    | `\Psi`    |   | $\psi$                   | `\psi`
 $\Omega$  | `\Omega`  |   | $\omega$                 | `\omega`

### 其他符号

 象征         | 脚本         |   | 象征       | 脚本
------------|------------|---|----------|----------
 $\partial$ | `\partial` |   | $\imath$ | `\imath`
 $\eth$     | `\eth`     |   | $\jmath$ | `\jmath`
 $\hbar$    | `\hbar`    |   | $\ell$   | `\ell`
 $\Re$      | `\Re`      |   | $\nabla$ | `\nabla`
 $\Im$      | `\Im`      |   | $\Box$   | `\Box`
 $\wp$      | `\wp`      |   | $\infty$ | `\infty`
 $\aleph$   | `\aleph`   |   | $\beth$  | `\beth`  
 $\gimel$   | `\gimel`   |   |          |

### 三角函数

 象征    | 脚本     |   | 象征      | 脚本
---------|---------|---|-----------|-----------
 $\sin$  | `\sin`  |   | $\arcsin$ | `\arcsin`
 $\cos$  | `\cos`  |   | $\arccos$ | `\arccos`
 $\tan$  | `\tan`  |   | $\arctan$ | `\arctan`
 $\cot$  | `\cot`  |   | $\arccot$ | `\arccot`
 $\sinh$ | `\sinh` |   | $\sec$    | `\sec`
 $\cosh$ | `\cosh` |   | $\csc$    | `\csc`
 $\tanh$ | `\tanh` |   | $\coth$   | `\coth`

### 和与积分

| 象征        | 脚本        | 象征          | 脚本         | 象征         | 脚本        |
|-------------|-------------|--------------|--------------|-------------|-------------|
| $\sum$      | `\sum`      | $\prod$      | `\prod`      | $\coprod$   | `\coprod`   |
| $\bigoplus$ | `\bigoplus` | $\bigotimes$ | `\bigotimes` | $\bigodot$  | `\bigodot`  |
| $\bigcup$   | `\bigcup`   | $\bigcap$    | `\bigcap`    | $\biguplus$ | `\biguplus` |
| $\bigsqcup$ | `\bigsqcup` | $\bigvee$    | `\bigvee`    | $\bigwedge$ | `\bigwedge` |
| $\int$      | `\int`      | $\oint$      | `\oint`      | $\iint$     | `\iint`     |
| $\iiint$    | `\iiint`    | $\iiiint$    | `\iiiint`    | $\idotsint$ | `\idotsint` |

## 公式排版

行内公式： 使用`$`包裹公式 $E=mc^2$

```md
$E=mc^2$
```

独立公式： 使用`$$`包裹公式

```md
$$
E=mc^2
$$
```

## 特殊转义字符

`# $ & ~ _ ^ \ { } %`这些字符在MarkDown中有特殊的意义，在需要使用这些字符的时候，需要进行转义

## 公式

极限: $\lim\limits_{x \to \infty} \exp(-x) = 0$

```md
$\lim\limits_{x \to \infty} \exp(-x) = 0$
```

幂和指数: $k_{n+1} = n^2 + k_n^2 - k_{n-1}$

```md
$k_{n+1} = n^2 + k_n^2 - k_{n-1}$
```

分数和二项式: $\frac{n!}{k!(n-k)!} = \binom{n}{k} \neq ^3/_7$

```md
\frac{n!}{k!(n-k)!} = \binom{n}{k} \neq ^3/_7
```

### 连续分数

$$
\begin{equation}
  x = a_0 + \cfrac{1}{a_1
          + \cfrac{1}{a_2
          + \cfrac{1}{a_3 + \cfrac{1}{a_4} } } }
\end{equation}
$$

```md
\begin{equation}
  x = a_0 + \cfrac{1}{a_1 
          + \cfrac{1}{a_2 
          + \cfrac{1}{a_3 + \cfrac{1}{a_4} } } }
\end{equation}
```

### 两个数字的乘法

$$
\begin{equation}
\frac{
    \begin{array}[b]{r}
      \left( x_1 x_2 \right)\\
      \times \left( x'_1 x'_2 \right)
    \end{array}
  }{
    \left( y_1y_2y_3y_4 \right)
  }
\end{equation}
$$

```md
\begin{equation}
\frac{
    \begin{array}[b]{r}
      \left( x_1 x_2 \right)\\
      \times \left( x'_1 x'_2 \right)
    \end{array}
  }{
    \left( y_1y_2y_3y_4 \right)
  }
\end{equation}
```

### 根号

$\sqrt{\frac{a}{b}}$

$\sqrt[n]{1+x+x^2+x^3+\dots+x^n}$

```md
\sqrt{\frac{a}{b}}
\sqrt[n]{1+x+x^2+x^3+\dots+x^n}
```

### 和与积分

$\sum_{i=1}^{10} t_i$

$\displaystyle\sum_{i=1}^{10} t_i$

$\int_0^\infty \mathrm{e}^{-x}\,\mathrm{d}x$

```md
\sum_{i=1}^{10} t_i
\displaystyle\sum_{i=1}^{10} t_i
\int_0^\infty \mathrm{e}^{-x}\,\mathrm{d}x
```

$$
\sum_{\substack{
   0<i<m \\
   0<j<n
  }}
 P(i,j)
$$

```md
\sum_{\substack{
   0<i<m \\
   0<j<n
  }} 
 P(i,j)
```

$\int\limits_a^b$

```md
\int\limits_a^b
```

### 矩阵和数组

需要 Amsmath 软件包

\[
 \begin{matrix}
  a & b & c \\
  d & e & f \\
  g & h & i
 \end{matrix}
\]

```md
\[
 \begin{matrix}
  a & b & c \\
  d & e & f \\
  g & h & i
 \end{matrix}
\]
```

$$
A_{m,n} =
 \begin{pmatrix}
  a_{1,1} & a_{1,2} & \cdots & a_{1,n} \\
  a_{2,1} & a_{2,2} & \cdots & a_{2,n} \\
  \vdots  & \vdots  & \ddots & \vdots  \\
  a_{m,1} & a_{m,2} & \cdots & a_{m,n}
 \end{pmatrix}
$$

```md
A_{m,n} = 
 \begin{pmatrix}
  a_{1,1} & a_{1,2} & \cdots & a_{1,n} \\
  a_{2,1} & a_{2,2} & \cdots & a_{2,n} \\
  \vdots  & \vdots  & \ddots & \vdots  \\
  a_{m,1} & a_{m,2} & \cdots & a_{m,n} 
 \end{pmatrix}
```

\begin{array}{c|c}
  1 & 2 \\
  \hline
  3 & 4
 \end{array}

```md
\begin{array}{c|c}
  1 & 2 \\ 
  \hline
  3 & 4
 \end{array}
```

$$
M = \begin{bmatrix}
       \frac{5}{6} & \frac{1}{6} & 0           \\[0.3em]
       \frac{5}{6} & 0           & \frac{1}{6} \\[0.3em]
       0           & \frac{5}{6} & \frac{1}{6}
     \end{bmatrix}
$$

```md
M = \begin{bmatrix}
       \frac{5}{6} & \frac{1}{6} & 0           \\[0.3em]
       \frac{5}{6} & 0           & \frac{1}{6} \\[0.3em]
       0           & \frac{5}{6} & \frac{1}{6}
     \end{bmatrix}
```

### 分隔符大小

#### 自动调整

$\left(\frac{x^2}{y^3}\right) = (\frac{x^2}{y^3})$

$P\left(A=2\middle|\frac{A^2}{B}>4\right)$

$\left\{\frac{x^2}{y^3}\right\}$

$\left.\frac{x^3}{3}\right|_0^1$

```md
\left(\frac{x^2}{y^3}\right) = (\frac{x^2}{y^3})

P\left(A=2\middle|\frac{A^2}{B}>4\right)

\left\{\frac{x^2}{y^3}\right\}

\left.\frac{x^3}{3}\right|_0^1
```

#### 手动调整

$( \big( \Big( \bigg( \Bigg($

```md
( \big( \Big( \bigg( \Bigg(
```

$\frac{\mathrm d}{\mathrm d x} \left( k g(x) \right) = \frac{\mathrm d}{\mathrm d x} \big( k g(x) \big)$

```md
\frac{\mathrm d}{\mathrm d x} \left( k g(x) \right) = \frac{\mathrm d}{\mathrm d x} \big( k g(x) \big)
```

## 常用案例

$f(x)=a^2+b$

```md
$f(x)=a^2+b$
```

$$
\begin{Bmatrix}
   a & b \\
   c & d
\end{Bmatrix}
$$

```md
$$
\begin{Bmatrix}
   a & b \\
   c & d
\end{Bmatrix}
$$
```

加法符号：$x+y=z$  
减法符号：$x-y=z$  
加减符号：$x pm y=z$  
减加符号：$x mp y=z$  
叉乘符号：$x times y=z$  
点乘符号：$x cdot y=z$  
星乘符号：$x ast y=z$  
除法符号：$x div y=z$  
斜除符号：$x/y=z$  
分式1：$frac{x+y}{y+z}$
分式2：${x+y} over {y+z}$  
绝对值：$|x+y|$  

## 设置数学符号的格式

默认数学字体: $\mathnormal{ABCDEFabcdef123456}$

```md
\mathnormal{ABCDEFabcdef123456}
```

计量单位，一字函数: $\mathrm{ABCDEFabcdef123456}$

```md
\mathrm{ABCDEFabcdef123456}
```

多字母函数或变量名称: $\mathit{ABCDEFabcdef123456}$

```md
\mathit{ABCDEFabcdef123456}
```

向量: $\mathbf{ABCDEFabcdef123456}$

```md
\mathbf{ABCDEFabcdef123456}
```

类别: $\mathsf{ABCDEFabcdef123456}$

```md
\mathsf{ABCDEFabcdef123456}
```

无: $\mathtt{ABCDEFabcdef123456}$

```md
\mathtt{ABCDEFabcdef123456}
```

向量: $\mathcal{ABCDEF}$

```md
\mathcal{ABCDEF}
```

## 音标

| 象征                   | 脚本                    |   | 象征                 | 脚本                 |
|------------------------|------------------------|---|----------------------|----------------------|
| $a'$                   | `a'` 或 `a^{\prime}`   |   | $a''$                | `a''`                |
| $\hat{a}$              | `\hat{a}`              |   | $\bar{a}$            | `\bar{a}`            |
| $\grave{a}$            | `\grave{a}`            |   | $\acute{a}$          | `\acute{a}`          |
| $\dot{a}$              | `\dot{a}`              |   | $\ddot{a}$           | `\ddot{a}`           |
| $\not{a}$              | `\not{a}`              |   | $\mathring{a}$       | `\mathring{a}`       |
| $\overrightarrow{AB}$  | `\overrightarrow{AB}`  |   | $\overleftarrow{AB}$ | `\overleftarrow{AB}` |
| $a'''$                 | `a'''`                 |   | $a''''$              | `a''''`              |
| $\overline{aaa}$       | `\dot{a}`              |   | $\check{a}$          | `\check{a}`          |
| $\breve{a}$            | `\breve{a}`            |   | $\vec{a}$            | `\vec{a}`            |
| $\widehat{AAA}$        | `\widehat{AAA}`        |   | $\widetilde{AAA}$    | `\widetilde{AAA}`    |
| $\stackrel\frown{AAA}$ | `\stackrel\frown{AAA}` |   | $ ilde{a}$           | `\tilde{a}`          |
| $\underline{a}$        | `\underline{a}`        |   | $\ddot{a}$           | `\ddot{a}`           |

## 控制水平间距

\[ f(n) =
  \begin{cases}
    n/2       & \quad \text{if } n \text{ is even}\\
    -(n+1)/2  & \quad \text{if } n \text{ is odd}
  \end{cases}
\]

```md
\[ f(n) =
  \begin{cases}
    n/2       & \quad \text{if } n \text{ is even}\\
    -(n+1)/2  & \quad \text{if } n \text{ is odd}
  \end{cases}
\]
```
