---
layout: post
title: Errors and Troubleshooting
description: Issues I encountered and how I got past them.
toc: True
comments: True
categories: ["5.A", "C4.1"]
courses:
  {
    "csse": { "week": 1 },
    "csp": { "week": 1, "categories": ["6.B"] },
    "csa": { "week": 1 },
  }
type: devops
---

## Errors I encountered and how I fixed them

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
  <li>Encountered error with Ruby version after downloading Ruby 3 via Homebrew.
    <ul class="bullet-points">
      <li>Command `ruby -v` showed version 2.6 (default macOS version), causing issues with some Ruby commands.</li>
      <li>Used `which -a ruby` to identify incorrect Ruby directory in terminal.</li>
      <li>Installed Jekyll gems after correcting Ruby directory.</li>
    </ul>
  </li>
  <li>Ran `brew info ruby` to gather information from terminal output. Echo command from output set correct Ruby directory.</li>
  <li>Faced Python version and pip command issue.
    <ul class="bullet-points">
      <li>`pip` commands not detected, `python --version` showed 2.7 despite installing version 3.11.4.</li>
      <li>Followed guidance from Mr. Mortensen, ran `activate_macos.sh` script to fix Python and pip issue.</li>
      <li>Successful in obtaining correct Python version and getting `pip` commands to work.</li>
    </ul>
  </li>
  <li>Ran `bundle install` and `make` to begin editing website.</li>
  <li>Identified code issue: Overlapping text in minimal theme's blog section (`config.yml` file).</li>
  <li>Suspected styling error in header tag causing the problem.</li>
  <li>Unable to locate exact error in styling.</li>
  <li>Recent error in styling calculator: Added `style.css` but text displayed under buttons.</li>
  <li>Resolved by merging CSS and JavaScript into markdown using `style` and `script` tags.</li>
</ul>
