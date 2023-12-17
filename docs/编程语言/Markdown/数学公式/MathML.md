# MathML

数学置标语言

由万维网联盟（World Wide Web Consortium，简称 W3C）的数学工作组提出。

文档：<https://www.w3.org/TR/MathML3/mathml.html>

语言规格1.01版于1999年7月公布，2.0版于2001年2月出现。W3C的数学工作组在2003年10月发布了MathML 2.0的第二版, 之后又在2010年10月发布了MathML 3.0。

过于繁琐，不建议使用！

markdown使用方法：

```md
<math>
<!-- code -->
</math>

<math xmlns='http://www.w3.org/1998/Math/MathML'>
<!-- code -->
</math>
```

## 示例

<math>
<mrow>
  <mi>x</mi>
  <mo>=</mo>
  <mfrac>
    <mrow>
      <mrow>
        <mo>-</mo>
        <mi>b</mi>
      </mrow>
      <mo>&#xB1;<!--PLUS-MINUS SIGN--></mo>
      <msqrt>
        <mrow>
          <msup>
            <mi>b</mi>
            <mn>2</mn>
          </msup>
          <mo>-</mo>
          <mrow>
            <mn>4</mn>
            <mo>&#x2062;<!--INVISIBLE TIMES--></mo>
            <mi>a</mi>
            <mo>&#x2062;<!--INVISIBLE TIMES--></mo>
            <mi>c</mi>
          </mrow>
        </mrow>
      </msqrt>
    </mrow>
    <mrow>
      <mn>2</mn>
      <mo>&#x2062;<!--INVISIBLE TIMES--></mo>
      <mi>a</mi>
    </mrow>
  </mfrac>
</mrow>
</math>

```md
<math>
<mrow>
  <mi>x</mi>
  <mo>=</mo>
  <mfrac>
    <mrow>
      <mrow>
        <mo>-</mo>
        <mi>b</mi>
      </mrow>
      <mo>&#xB1;<!--PLUS-MINUS SIGN--></mo>
      <msqrt>
        <mrow>
          <msup>
            <mi>b</mi>
            <mn>2</mn>
          </msup>
          <mo>-</mo>
          <mrow>
            <mn>4</mn>
            <mo>&#x2062;<!--INVISIBLE TIMES--></mo>
            <mi>a</mi>
            <mo>&#x2062;<!--INVISIBLE TIMES--></mo>
            <mi>c</mi>
          </mrow>
        </mrow>
      </msqrt>
    </mrow>
    <mrow>
      <mn>2</mn>
      <mo>&#x2062;<!--INVISIBLE TIMES--></mo>
      <mi>a</mi>
    </mrow>
  </mfrac>
</mrow>
</math>
```

## HTML里使用

```html
<!doctype html>
<html lang="en-US">
  <head>
    <meta charset="UTF-8" />
    <title>MathML in HTML5</title>
  </head>
  <body>
    <h1>MathML in HTML5</h1>

    <p>
      One over square root of two (inline style):
      <math>
        <mfrac>
          <mn>1</mn>
          <msqrt>
            <mn>2</mn>
          </msqrt>
        </mfrac>
      </math>
    </p>

    <p>
      One over square root of two (display style):
      <math display="block">
        <mfrac>
          <mn>1</mn>
          <msqrt>
            <mn>2</mn>
          </msqrt>
        </mfrac>
      </math>
    </p>
  </body>
</html>
```
