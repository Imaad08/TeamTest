---
toc: true
comments: true
layout: post
title: Unity Game Embed
description: My game I created using Unity 2D.
type: hacks
courses: { compsci: {week: 1} }
---


<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Imaad's Game</title>
</head>
<body>
  <div id="unityContainer"></div>
  <iframe src="../../../FlippyMazeGame/index.html" width="1000" height="650"></iframe>
  <div id="unityContainer"></div>
  <script src="../../../FlippyMazeGame/TemplateData/UnityProgress.js"></script>
  <script src="../../../FlippyMazeGame/Build/UnityLoader.js"></script>
  <script>
    var container = document.getElementById("unityContainer");
    var gameInstance = UnityLoader.instantiate(container, "../../../FlippyMazeGame/Build/YourGame.json");
  </script>
</body>
</html> 

## Tutorial for the game:
<iframe width="560" height="315" src="https://www.youtube.com/embed/l5y0hlhtjbY" frameborder="0" allowfullscreen></iframe>

<script src="https://utteranc.es/client.js"
        repo="student2"
        issue-term="pathname"
        theme="github-light"
        crossorigin="anonymous"
        async>
</script> 