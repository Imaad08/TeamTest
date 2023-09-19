---
toc: False
comments: True
layout: post
title: ChatGPT Voice Assistant
description: Voice assistant powered by my OpenAi API Key and Python
courses: {'compsci': {'week': 3}}
type: hacks
---

```python
import openai
import speech_recognition as sr
import time
from gtts import gTTS
import os

# Set key(will mot work on github due to openai/github deal)
openai.api_key = "put key here"

def transcribe_audio_to_text(filename):
    recognizer = sr.Recognizer()
    with sr.AudioFile(filename) as source:
        audio = recognizer.record(source)
    try:
        return recognizer.recognize_google(audio)
    except:
        print('Error ocurred')

def generate_response(prompt):
    response = openai.Completion.create(
        engine="text-davinci-003",
        prompt=prompt,
        max_tokens=4000,
        n=1,
        stop=None,
        temperature=0.7,
    )
    return response["choices"][0]["text"]

def speak_text(text):
    tts = gTTS(text)
    tts.save("output.mp3")
    os.system("afplay output.mp3")  # Play the audio file

def main():
    while True:
        # Wait for keyword
        print("Say 'Start' to start ")
        with sr.Microphone() as source:
            recognizer = sr.Recognizer()
            audio = recognizer.listen(source)
            try:
                transcription = recognizer.recognize_google(audio)
                if transcription.lower() == "start":
                    # Record
                    filename = "input.wav"
                    print("Ask away:")
                    with sr.Microphone() as source:
                        recognizer = sr.Recognizer()
                        source.pause_threshold = 1
                        audio = recognizer.listen(source, phrase_time_limit=None, timeout=None)
                        with open(filename, "wb") as f:
                            f.write(audio.get_wav_data())

                        # Transcribe
                        text = transcribe_audio_to_text(filename)
                        if text:
                            print(f"You said: {text}")

                            # Generate response
                            response = generate_response(text)
                            print(f"GPT says: {response}")

                            # Speak the GPT response
                            speak_text(response)
            except KeyboardInterrupt:
                print("Recording interrupted by user.")
            except Exception as e:
                print("An error occurred: {}".format(e))

if __name__ == "__main__":
    main()

```

    Say 'Start' to start 
    Ask away:
    You said: who is Elon Musk and what are some of his projects
    GPT says: 
    
    Elon Musk is an engineer, entrepreneur, and innovator best known for founding and leading companies such as SpaceX, Tesla, and The Boring Company. He is also the CEO of Neuralink, a company focused on developing brain-machine interfaces. His projects range from space exploration to sustainable energy, artificial intelligence, and transportation. He has also been involved in projects such as Hyperloop and OpenAI.
    Say 'Start' to start 


<script src="https://utteranc.es/client.js"
        repo="student2"
        issue-term="pathname"
        theme="github-light"
        crossorigin="anonymous"
        async>
</script> 
