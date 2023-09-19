---
layout: post
title: Week 1 Lab Notebook
description: Lab notebook covering week 1
comments: false
categories: ["5.A", "C4.1"]
courses: { "compsci": { "week": 1 } }
type: tangibles
---

# Week 1 Lab Notebook

---

## Python quiz description:

While exploring `Jupyter Notebook`, I was able to go through the python code for the quiz and see how it worked. I saw that a function needed to be defined in order for the quiz to function, so I defined it and the quiz worked properly. I then used Jupyter Notebook to put that python code into my website

### Problems:

<style>
  .bullet-points {
    list-style-type: disc; 
    margin-left: 40px; 
  }
  .bullet-points li {
    margin-bottom: 20px; 
  }
</style>

<ul class = "bullet-points">
  <li>I learned the HTML language a little better because I understood how different lines could be made to make a table using just a few lines of code</li>
  <li>The quiz questions were quite easy and didn't take any real thought to answer</li>
</ul>

### Solution:

<style>
  .bullet-points {
    list-style-type: disc; 
    margin-left: 40px; 
  }
</style>

<ul class = "bullet-points">
  <li>I brainstormed new quiz problems and edited the list of questions that already existed</li>
  <li>I used elif to add the different variations of capital letters for the answers</li>
</ul>

### Skills used/learned:

<style>
  .bullet-points {
    list-style-type: disc; 
    margin-left: 40px; 
  }
</style>

<ul class = "bullet-points">
  <li>I learned how to use Jupyter Notebook to add and run python code on the website with cells</li>
  <li>I used the elif function in python to add variations of the correct answer</li>
</ul>

---

## Calculator description:

I wanted to add a calculator to my website so I decided to code one using `HTML`, `CSS`, and `JavaScript`. The calculator design was inspired by the apple calculator on iPhone's. I wanted to have a current operation display and a previous one right above it in smaller font that displayed the last function.

### Problems:

<style>
  .bullet-points {
    list-style-type: disc; 
    margin-left: 40px; 
  }
</style>

<ul class = "bullet-points">
  <li>I had a visual issue where whenever I clicked a new operation, the current function would move to the previous function area without clicking the equals button</li>
  <li>The JavaScript logic was complicated and took a while to make</li>
</ul>

### Solutions:

<style>
  .bullet-points {
    list-style-type: disc; 
    margin-left: 40px; 
  }
</style>

<ul class = "bullet-points">
  <li>I deleted the previous operation div entirely which took away a lot of unnecessary complexity and made it easier to create the calculators</li>
  <li>I simplified the JavaScript by just using the eval function to evaulate the current operation whenever the user clicks the equal button</li>
</ul>

### Skills used/learned:

<style>
    .bullet-points {
    list-style-type: disc; 
    margin-left: 40px; 
    }
</style>

<ul class = "bullet-points">
  <li>I learned how to use HTML, CSS, and JavaScript to create a simple GUI based calculator</li>
  <li>I used the `eval` function in `JavaScript` to evaluate the current operation and display the new answer</li>
  <li>I used HTML tags to call the function to evaluate whenever the user clicks the equals button</li>
</ul>

---

## Unity game description

In the past, as a personal project, I developed a Unity 2D game called Flippy Maze. I decided that I wanted to put in on my website because I thought it would be a good addition. I built a folder that had all the necessary componenets to embed the game into the website with WebGL. I also decided to embed a video tutorial to get the user started.

### Problems:

<style>
  .bullet-points {
    list-style-type: disc; 
    margin-left: 40px; 
  }
</style>

<ul class = "bullet-points">
  <li>I didn't know how to put the build as an embed into the website with the WebGL folder</li>
  <li> When I found out how to fix the issue above, the website kept telling me that my file was not found. This error only occured when I tried to put the game in a post. It worked fine in index.md</li>
</ul>

### Solutions:

<style>
  .bullet-points {
    list-style-type: disc; 
    margin-left: 40px; 
  }
</style>

<ul class = "bullet-points">
  <li> After a few hours of research, I was able to figure out how to embed the game using some HTML code</li>
  <li>I needed to reference the directory and I thought I did this correctly, but it used the directory of the generated folder, meaning that the directory I was using previously was incorrect as it wasn't meant for generated file</li>
  <li> After looking through the directories, I was able to find the correct way to reference the right directory and the game worked fine.</li>
</ul>

### Skills used/learned:

<style>
  .bullet-points {
    list-style-type: disc; 
    margin-left: 40px; 
  }
</style>

<ul class = "bullet-points">
  <li>I learned how to use HTML code to embed a unity project via WebGL</li>
</ul>
