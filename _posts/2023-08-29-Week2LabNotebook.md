---
layout: post
title: Week 2 Lab Notebook
description: Lab notebook covering week 2
comments: false
categories: ["5.A", "C4.1"]
courses: { "compsci": { "week": 2 } }
type: tangibles
---

# Week 2 Lab Notebook:

---

## Game of life description:

I added the code for the game from the source provided in Slack announcments and added some styles to make it look more visually appealing.

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

<ul class="bullet-points">
  <li>There was a buggy line in the source, but when added to the code to run on the website, it would not work. I was also unable to paste in the line here without the page crashing</li>
  <li>When scrolling, the text, "Remix of game of life," would stay constant on the screen and would overlap with all elements of the website</li>
</ul>

### Solutions:

<style>
  .bullet-points {
    list-style-type: disc; 
    margin-left: 40px; 
  }
  .bullet-points li {
    margin-bottom: 20px; 
  }
</style>

<ul class="bullet-points">
  <li>Removing the line was able to fix the website and it would continue to run properly</li>
  <li>I removed the text element in the HTML code that contained the buggy text, and the overlapping stopped</li>
</ul>

### Skills used/learned:

<style>
  .bullet-points {
    list-style-type: disc; 
    margin-left: 40px; 
  }
  .bullet-points li {
    margin-bottom: 20px; 
  }
</style>

<ul class="bullet-points">
  <li>Editing HTML code to fix overlapping text errors</li>
  <li>Using CSS to apply styles to the buttons</li>
</ul>

---

## Phone data table description:

I used the code from the JsOuput table to create my own table that contained the data of phone companies, models, release years, color, and price. I then added a little bit of styling to make more appealing.

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

<ul class="bullet-points">
  <li>I encountered an issue where the search bar overlapped with the data table values, most likely due to the fact that I styled the head of the table</li>
</ul>

### Solutions:

<style>
  .bullet-points {
    list-style-type: disc; 
    margin-left: 40px; 
  }
  .bullet-points li {
    margin-bottom: 20px; 
  }
</style>

<ul class="bullet-points">
  <li>In my CSS styles, I added a margin so that the search bar would be moved further up</li>
</ul>

### Skills used/learned:

<style>
  .bullet-points {
    list-style-type: disc; 
    margin-left: 40px; 
  }
  .bullet-points li {
    margin-bottom: 20px; 
  }
</style>

<ul class="bullet-points">
  <li>Editing HTML to change table values.\</li>
  <li>Adding and modifying CSS to style the table and fix visual issues</li>
</ul>

---

## Snake game description:

Using the source code for the snake game, I was able to add a playable and fully functioning snake game into the website.

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

<ul class="bullet-points">
  <li>On both localhost and GitHub pages, I was unable to load the game page for some reason, and the tab would time out</li>
</ul>

### Solutions:

<style>
  .bullet-points {
    list-style-type: disc; 
    margin-left: 40px; 
  }
  .bullet-points li {
    margin-bottom: 20px; 
  }
</style>

<ul class="bullet-points">
  <li>I switched browsers, and the page started working. It was an issue that only occurred on Chrome</li>
</ul>

### Skills used/learned:

<style>
  .bullet-points {
    list-style-type: disc; 
    margin-left: 40px; 
  }
  .bullet-points li {
    margin-bottom: 20px; 
  }
</style>

<ul class="bullet-points">
  <li>Adding HTML code to put a functioning snake game into the website</li>
</ul>

---

## Stock protfolio simulator description:

For this project, me and Tanay decided to collaborate on one big Python project that would allow us to pull and display stock data in a table using the `pandas` module and `Stooq` database. We also worked on a project to show this data on a graph but as of right now it does not fully work.

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

<ul class="bullet-points">
  <li>We wanted to use as many simulations as possible, so we moved the number to around 15,000 simulations</li>
  <li>The code kept timing out and couldn't fully execute because our computers couldn't handle that many, causing lagging and heating up</li>
</ul>

### Solutions:

<style>
  .bullet-points {
    list-style-type: disc; 
    margin-left: 40px; 
  }
  .bullet-points li {
    margin-bottom: 20px; 
  }
</style>

<ul class="bullet-points">
  <li>We learned that 6000 was an optimal number of simulations for both accuracy and cost on computers</li>
</ul>

### Skills used/learned:

<style>
  .bullet-points {
    list-style-type: disc; 
    margin-left: 40px; 
  }
  .bullet-points li {
    margin-bottom: 20px; 
  }
</style>

<ul class="bullet-points">
  <li>We used the Pandas module to express the data of stock prices which was pulled.</li>
  <li>We used the Stooq database from which we pulled data of 8 stocks.</li>
  <li>We used Python to code functions that would allow us to use the modules from above.</li>
</ul>
