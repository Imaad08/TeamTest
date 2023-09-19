---
layout: post
title: Calculator
description: A simple gui-based calculator I created using html css and javascript.
comments: True
categories: ['5.A', 'C4.1']
courses: {'compsci': {'week': 1}}
type: hacks
---

# Calculator:

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Imaad's Calculator</title>
  <style>
    button {
      cursor: pointer;
      font-size: 2rem;
      border: 1px solid grey;
      outline: none;
      background-color: rgba(255, 255, 255, .75);
    }
    button:hover {
      background-color: grey;
    }
    .operator {
      background-color: #f2a154;
      color: white;
    }
    .calculator {
      display: grid;
      justify-content: center;
      align-content: center;
      min-height: 50vh;
      grid-template-columns: repeat(4, 100px);
      grid-template-rows: minmax(120px, auto) repeat(5, 100px);
    }
    .two-spaces {
      grid-column: span 2;
    }
    .three-spaces {
      grid-column: span 3;
    }
    .display {
      grid-column: 1 / -1;
      background-color: rgba(0, 0, 0, .75);
      display: flex;
      align-items: flex-end;
      justify-content: space-around;
      flex-direction: column;
      padding: 10px;
      word-wrap: break-word;
      word-break: break-all;
    }
    input {
      width: 100%;
      border: none;
      font-size: 1.5rem;
      background-color: transparent;
      color: white;
    }
  </style>
</head>

<body>
  <div class="calculator">
    <div class="display">
      <input type="text" id="result" value="0" disabled>
    </div>
    <button id="clear" class="three-spaces" onclick="clearDisplay()">AC</button>
    <button class="operator" onclick="appendSymbol('/')">÷</button>
    <button onclick="appendSymbol('1')">1</button>
    <button onclick="appendSymbol('2')">2</button>
    <button onclick="appendSymbol('3')">3</button>
    <button class="operator" onclick="appendSymbol('*')">*</button>
    <button onclick="appendSymbol('4')">4</button>
    <button onclick="appendSymbol('5')">5</button>
    <button onclick="appendSymbol('6')">6</button>
    <button class="operator" onclick="appendSymbol('+')">+</button>
    <button onclick="appendSymbol('7')">7</button>
    <button onclick="appendSymbol('8')">8</button>
    <button onclick="appendSymbol('9')">9</button>
    <button class="operator" onclick="appendSymbol('-')">-</button>
    <button onclick="appendSymbol('.')">.</button>
    <button onclick="appendSymbol('0')">0</button>
    <button id="equals" class="two-spaces" onclick="calculate()">=</button>
  </div>
  <script>
    let currentInput = '';
    function appendSymbol(symbol) {
      currentInput += symbol;
      updateDisplay(currentInput);
    }
    function calculate() {
      try {
        const result = eval(currentInput);
        updateDisplay(result);
        currentInput = result.toString();
      } catch (error) {
        updateDisplay('Error');
        currentInput = '';
      }
    }
    function clearDisplay() {
      currentInput = '';
      updateDisplay('0');
    }
    function updateDisplay(content) {
      document.getElementById('result').value = content;
    }


  </script>
</body>

<script src="https://utteranc.es/client.js"
        repo="student2"
        issue-term="pathname"
        theme="github-light"
        crossorigin="anonymous"
        async>
</script> 
