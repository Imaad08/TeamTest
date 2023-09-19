---
layout: post
title: Python quiz
description: A simple Python quiz to get familliar with the language.
comments: True
categories: ['5.A', 'C4.1']
courses: {'compsci': {'week': 1}}
type: hacks
---

```python
import getpass, sys

def question_with_response(prompt):
    print("Question: " + prompt)
    msg = input()
    return msg
def question_and_answer(prompt):
    print(prompt)
    msg1 = input()
    return msg1
questions = 3
correct = 0

print('Hello, ' + getpass.getuser() + " running " + sys.executable)
print("You will be asked " + str(questions) + " questions.")
question_and_answer("Are you ready to take a test?")

rsp = question_with_response("What is the keywoard to declare a function in python?")
if rsp == "def":
    print(rsp + " is correct!")
    correct += 1
elif rsp == "Def":
    print(rsp +" is correct!")
    correct += 1
else:
    print(rsp + " is incorrect!")

rsp = question_with_response("What is a collection of items, which can be of varying data types, called in Python?")
if rsp == "list":
    print(rsp + " is correct!")
    correct += 1
elif rsp == "List":
    print(rsp +" is correct!")
    correct += 1
elif rsp == "a list":
    print(rsp +" is correct!")
    correct += 1
elif rsp == "A list":
    print(rsp +" is correct!")
    correct += 1
else:
    print(rsp + " is incorrect!")

rsp = question_with_response("Each 'if' command contains an '_________' to determine a true or false condition?")
if rsp == "expression":
    print(rsp + " is correct!")
    correct += 1
elif rsp == "Expression":
    print(rsp +" is correct!")
    correct += 1
else:
    print(rsp + " is incorrect!")

print(getpass.getuser() + " you scored " + str(correct) +"/" + str(questions))
```

    Hello, imaadmuzaffer running /usr/local/opt/python@3.11/bin/python3.11
    You will be asked 3 questions.
    Are you ready to take a test?
    Question: What is the keywoard to declare a function in python?
    def is correct!
    Question: What is a collection of items, which can be of varying data types, called in Python?
    list is correct!
    Question: Each 'if' command contains an '_________' to determine a true or false condition?
    expression is correct!
    imaadmuzaffer you scored 3/3


<script src="https://utteranc.es/client.js"
        repo="student2"
        issue-term="pathname"
        theme="github-light"
        crossorigin="anonymous"
        async>
</script> 
