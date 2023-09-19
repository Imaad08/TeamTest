---
layout: post
title: Stacker Game
description: Stacker game created with P5 library and help from a tutorial(linked in lab notebook)
comments: True
categories: ['5.A', 'C4.1']
courses: {'compsci': {'week': 3}}
type: hacks
---

# Stacker game

---

<head>
<meta charset="UTF-8" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/1.6.0/p5.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/1.6.0/addons/p5.sound.min.js"></script>
  <style>
    html,
    body {
      margin: 0;
      padding: 0;
      margin-top: 30px;
    }
    canvas {
      display: block;
    }
    button {
      padding: 10px 20px;
      margin-bottom: 30px;
      display: inline-flex;
      justify-content: space-between;
      gap: 20px;
      background-color: #007bff;
      color: #fff;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      transition: background-color 0.3s;
    }
    button:hover {
      background-color: #0056b3;
    }
  </style>
  

</head>

<body>
  <main>
    <button id="startButton">Start</button>
    <button id="stopButton">Stop</button>
  </main>
  <script>
const blockWidth = 300;
const blockHeight = 30;
// Variables to track game state and objects
let currentBlock;
let blockDir;
let blockSpeed;
let placedBlocks = [];
const statePlaying = "playing";
const stateLose = "lose";
const stateWin = "win";
let menuState = statePlaying;
// Event listener for the start button
document.getElementById("startButton").addEventListener("click", function () {
  if (menuState !== statePlaying) {
    newGame();
    menuState = statePlaying;
  }
});
// Event listener for the stop button
document.getElementById("stopButton").addEventListener("click", function () {
  if (menuState === statePlaying) {
    menuState = stateLose;
  }
});
// Function to set up the game canvas
function setup() {
  const canvas = createCanvas(600, 600);
  textAlign(CENTER, CENTER);
  canvas.mousePressed(placeBlock); // Add mouse click event listener
  newGame();
}
// Function to update and draw the game elements
function draw() {
  background(220);
  if (menuState === statePlaying) {
    textSize(blockHeight);
    updateBlock();
    drawBlocks();
  } else if (menuState === stateLose) {
    textSize(blockHeight * 2);
    fill(255, 0, 0);
    text("Press Start", width / 2, height / 2);
    textSize(blockHeight);
  } else if (menuState === stateWin) {
    textSize(blockHeight * 2);
    fill(0, 255, 0);
    text("You Win!", width / 2, height / 2);
    textSize(blockHeight);
    text("Press Start", width / 2, height * 3 / 4);
  }
}
// Function to start a new game
function newGame() {
  currentBlock = createVector(0, height - blockHeight, blockWidth);
  blockDir = 1;
  blockSpeed = 2;
  placedBlocks = [];
}
// Function to update the current block's position
function updateBlock() {
  currentBlock.x += blockDir * blockSpeed;
  if (currentBlock.x < 0) {
    blockDir = 1;
  }
  if (currentBlock.x + currentBlock.z > width) {
    blockDir = -1;
  }
}
// Function to draw the blocks on the canvas
function drawBlocks() {
  fill(255, 0, 0);
  rect(currentBlock.x, currentBlock.y, currentBlock.z, blockHeight);
  fill(50);
  for (let block of placedBlocks) {
    rect(block.x, block.y, block.z, blockHeight);
  }
  text(placedBlocks.length, blockHeight, blockHeight);
}
// Function to place the current block on top of the stack
function placeBlock() {
  const prevBlock = placedBlocks[placedBlocks.length - 1];
  let newWidth = blockWidth;
  if (prevBlock) {
    const leftEdge = max(prevBlock.x, currentBlock.x);
    const rightEdge = min(prevBlock.x + prevBlock.z, currentBlock.x + currentBlock.z);
    newWidth = rightEdge - leftEdge;
    currentBlock.x = leftEdge;
    currentBlock.z = newWidth;
  }
  if (newWidth < 0) {
    menuState = stateLose;
    return;
  }
  placedBlocks.push(currentBlock);
  blockSpeed *= 1.1;
  newBlock(newWidth);
}
// Function to create a new block with a specified width
function newBlock(newWidth) {
  const blockStackHeight = (placedBlocks.length + 1) * blockHeight;
  if (blockStackHeight > height) {
    menuState = stateWin;
    return;
  }
  currentBlock = createVector(0, height - blockStackHeight, newWidth);
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
