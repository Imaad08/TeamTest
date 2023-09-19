---
toc: false
comments: true
layout: post
title: Cube Catcher Js Game
description: A simple 2D game made with HTML, CSS, and JavsScript where you have to touch as many falling cubes as possible.
courses: { compsci: {week: 3} }
type: hacks
---

# Cube Catcher

## Catch as many cubes as possible using your mouse pointer

---



<head>
  <title>Simple 2D Game</title>
  <style>
    body {
      margin: 0;
      overflow: hidden;
    }
    #game-controls {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin: 10px 0;
      padding: 0 10px;
    }
    #game-container {
      width: 80%;
      height: 30vh;
      position: relative;
      margin: 10vh auto;
      border: 2px solid black;
      overflow: hidden; 
    }
    #player {
      width: 50px;
      height: 50px;
      background-color: blue;
      position: absolute;
      bottom: 0;
      left: 50%;
      transform: translateX(-50%);
    }
    .object {
      width: 20px;
      height: 20px;
      background-color: red;
      position: absolute;
    }
    #score {
      position: absolute;
      top: 10px;
      right: 10px;
      font-size: 24px;
    }
  </style>
</head>

<body>
  <div id="game-controls">
    <button id="start-button">Start</button>
    <button id="pause-button" disabled>Pause</button>
    <button id="restart-button">Restart</button>
  </div>
  <div id="game-container">
    <div id="player"></div>
    <div id="score">Score: 0</div>
  </div>

  <script>
// Get references to HTML elements using their IDs
const player = document.getElementById('player');
const scoreDisplay = document.getElementById('score');
const startButton = document.getElementById('start-button');
const pauseButton = document.getElementById('pause-button');
const restartButton = document.getElementById('restart-button');
const gameContainer = document.getElementById('game-container');

// Initialize game variables
let score = 0;
let gameInterval;
let gameRunning = false;

// Function to move the player based on mouse position
function movePlayer(event) {
  const x = event.clientX - player.clientWidth / 2;
  const maxX = gameContainer.clientWidth - player.clientWidth;
  player.style.left = `${Math.min(maxX, Math.max(0, x))}px`;
}

// Function to create falling objects
function createObject() {
  if (gameRunning) {
    const object = document.createElement('div');
    object.classList.add('object');
    object.style.left = `${Math.random() * (gameContainer.clientWidth - 20)}px`;
    gameContainer.appendChild(object);

    // Function to make objects fall and handle collisions
    function fall() {
      const y = parseInt(object.style.top) || 0;
      object.style.top = `${y + 5}px`;

      if (y > gameContainer.clientHeight) {
        object.remove();
      } else {
        requestAnimationFrame(fall);

        const playerRect = player.getBoundingClientRect();
        const objectRect = object.getBoundingClientRect();

        // Check for collision between player and object
        if (
          playerRect.left < objectRect.right &&
          playerRect.right > objectRect.left &&
          playerRect.top < objectRect.bottom &&
          playerRect.bottom > objectRect.top
        ) {
          object.remove();
          score++;
          scoreDisplay.textContent = `Score: ${score}`;
        }
      }
    }

    requestAnimationFrame(fall);
  }
}

// Add a mousemove event listener to move the player with the mouse
document.addEventListener('mousemove', movePlayer);

// Add a click event listener to start the game
startButton.addEventListener('click', () => {
  if (!gameRunning) {
    gameInterval = setInterval(createObject, 1000);
    gameRunning = true;
    startButton.disabled = true;
    pauseButton.disabled = false;
    restartButton.disabled = false;
  }
});

// Add a click event listener to pause the game
pauseButton.addEventListener('click', () => {
  if (gameRunning) {
    clearInterval(gameInterval);
    gameRunning = false;
    startButton.disabled = false;
    pauseButton.disabled = true;
    restartButton.disabled = false;
  }
});

// Add a click event listener to restart the game
restartButton.addEventListener('click', () => {
  clearInterval(gameInterval);
  gameRunning = false;
  score = 0;
  scoreDisplay.textContent = 'Score: 0';
  startButton.disabled = false;
  pauseButton.disabled = true;
  restartButton.disabled = true;

  // Remove all falling objects from the game container
  const objects = document.querySelectorAll('.object');
  objects.forEach((object) => object.remove());
});

  </script>
</body>

<script src="https://utteranc.es/client.js"
        repo="student2"
        issue-term="pathname"
        theme="github-light"
        crossorigin="anonymous"
        async>
</script> 
