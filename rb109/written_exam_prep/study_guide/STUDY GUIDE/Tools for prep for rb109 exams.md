# **Tools to Prep for RB109 Exams: Obsidian, Anki, and More**

https://medium.com/@MarilynRoxie/tools-to-pass-the-rb109-exams-obsidian-anki-and-more-f6533b141e51

Aug 15, 2024

I passed [Launch School'](https://launchschool.com/)s RB109 written exam on May 6th, 2024, and the interview exam on May 29th, 2024. The RB109 exams cover topics from RB101 and the [Introduction to Programming with Ruby](https://launchschool.com/books/ruby) book.

I'm sharing the tools I used and my strategies before and during the exams in case these ideas help anyone else with their exam preparation.

One of the best things about preparing for RB109 was not just passing the exams but also unlocking a more effective method of studying for me in general. As I got into the rhythm of studying the way I will detail below, I couldn't help but wish I had studied this way all along.

I had previously written another article, [What You Don't Need to Pass RB109](https://medium.com/@MarilynRoxie/what-you-dont-need-to-pass-rb109-70a249c7afab), but it doesn't matter what order you read them in.

# Track Study Time

![](https://miro.medium.com/v2/resize:fit:548/1*Ci8Dgl2VnxMlZSMP6gx98Q.png)

Screenshot from my actual study time spreadsheet

I highly recommend keeping track of your time. Even if you haven't done so from the beginning, you can still start now. Without accurate tracking, you may be studying more or less than you think.

I found [the Launch School Core Tracker](https://docs.google.com/spreadsheets/d/1pjSWYejfRJ43jgYdUFBY81j-0aUmXk1dKT-MhD9-U3s/edit?usp=sharing) on Slack, a template that I use to track my study time.

Each time you study, you can add the course, date, and time you spent, and the sheet will automatically calculate your average study time for that course, number of days you've been active vs all days that have passed since you started the course, and your total study time. You could add notes on what you studied that day or other relevant fields.

I have seen other students use [Toggl](https://toggl.com/) or a custom spreadsheet they've made themselves, but I love the Core Tracker's simplicity.

When studying, I use [the Pomodoro method](https://todoist.com/productivity-methods/pomodoro-technique). There are a wealth of resources about this method to the extent that there's nothing new I could possibly say about it here. It is popular for a reason. I deviate from this now and again if I'm really in 'the zone' and end up studying, e.g., an hour straight, but for the most part, it's Pomodoro all the way.

# Choose a Markdown Editor

Markdown editors are tools people have very strong opinions about. My strong opinion is that [Obsidian](https://obsidian.md/) is amazing! [You can read about what Obsidian is here](https://help.obsidian.md/Obsidian/Obsidian).

If you prefer another Markdown editor (e.g., [Typora](https://typora.io/)), you probably don't need to be persuaded away from it. Keep using it; skip this section and move on.

You should use a Markdown editor before taking the RB109 written exam to increase your familiarity with Markdown, which is what you’ll write your answers in.

Personally, I moved to Obsidian from [Notion](https://www.notion.so/) in 2023 and haven't looked back. Notion supports Markdown but has some formatting quirks that don't always play nicely with text boxes elsewhere. Additionally, unlike Notion, Obsidian is also available offline.

If you've never used Markdown much or at all before the written exam, taking your notes in Obsidian or another Markdown editor will give you great practice.

# Learn Markdown Basics

For describing code in a paragraph, use a single tick (`a`) character on each side:

On line 1, the variable `a` is initialized to reference the string object `"yes"`.

For writing code, fence off your code with three backticks with the word ruby written after the first set, write your code, then go to the last line and close the code with three backticks again.

![](https://miro.medium.com/v2/resize:fit:152/1*U0-Q0n5DRRO4hWza-tLBCQ.png)

You'll end up with this:

a = "yes"

When using Obsidain to take notes, there is useful syntax to know, such as # to start a heading and ## for a sub-heading. Read through [Obsidian's help document on syntax](https://help.obsidian.md/Editing+and+formatting/Basic+formatting+syntax) and look at [this beginner's guide on Obsidian Rocks](https://obsidian.rocks/getting-started-with-obsidian-a-beginners-guide/). Try out all the features you think would be handy for note-taking.

For my personal study guide notes, I like using Obsidian's [callouts](https://help.obsidian.md/Editing+and+formatting/Callouts) to make questions, answers, and sources of content clear, but be aware that this isn't something you can or should use for the exam.

**For the written exam itself, however, the only Markdown you need to know about are the single backticks for fencing off code in plain text and the triple backticks followed by the word ruby for fencing off whole blocks of Ruby code.**

If you're only referring to output from code and therefore don't need to specify that it is related to Ruby, you don't need to write anything after the first three backticks, and then you close out the last line with three backticks as usual.

![](https://miro.medium.com/v2/resize:fit:276/1*70Qd7O_Y6PLp8hZYhNodBw.png)

The result:

I'm output.  
I'm output too!

You can test out any Markdown paste in [the Launch School forums](https://launchschool.com/forum) by going to post a new topic, pasting the text in the box, and clicking ‘preview,’ or the ‘give us your feedback’ button followed by ‘preview’ on most LS pages. (Don't submit it!)

**The exam itself also provides a preview, which you should utilize, but don't wait until the exam to become comfortable with Markdown!**

If you're new to Obsidian, you should set aside any fancy techniques that are not crucial to RB109 prep. You can always learn more about maximizing its use later. This article also reinforces what is actually important to care about when it comes to your Markdown editor when prepping for an exam:


## My Approach to Learning during Launch School's Core Curriculum

### An amalgamation of deep learning, breaking concepts into smaller pieces, and spaced repetition


[Nicole van der Hoeven's great YouTube channel](https://www.youtube.com/c/NicolevanderHoeven) is one resource that can help you go further with Obsidian later on. There are themes, plugins, and various tips and tricks — there's a lot to know if you end up loving Obsidian, but remember to stay focused on RB109 for now!

# Copy and Paste from Markdown

Copying and pasting Markdown text from Obsidian into the written exam itself, so long as you formatted it correctly, works fine.

**You are permitted to copy and paste text from your Markdown editor into the written exam, as long as it is in your own words, including your own pre-written material.** This practice is not against the rules of the written exam or LS's Code of Conduct. In a study group, I received confirmation from LS TAs that this is acceptable.

The advantages of copying and pasting answers from your Markdown editor are that it…:

- …allows you to see how your answer will be formatted as you're typing
- …enables you to utilize notes or examples you wrote yourself before taking the exam
- …ensures your answers are in a safe place before transferring them over to the exam in case something goes wrong and you need to access them again

Don't expect to pass the exam using entirely pre-written material! You won't know what the specific questions are ahead of time and need to hold relevant information in your head to finish the exams on time. Personally, I was only able to incorporate a couple of examples I previously came up with to illustrate specific concepts in my exam answers.

**Note that you _cannot_ do the above on the interview exam —copying and pasting from your own notes only applies to the written exam.**

Final note — be careful if you’re pasting from irb; you will want to 'paste to match style' in Obsidian, or you will have strange effects like this, for example, when copy-pasting `str[4,5]` from irb:

str[**4**,**5**]

What you want is:

str[4,5]

# Start a Personalized Study Guide

The LS RB109 study guide contains a list of topics that may come up on the written or interview exams. I recommend turning this list into a personal study guide including everything you need to review and practice these concepts.

I created a note in my preferred Markdown editor, Obsidian, with each category as a header (e.g., Variables) and the individual topics within as sub-headings (e.g., Variables as Pointers).

Under every sub-heading, I added multiple example problems (usually spin-off ideas from LS problems) and explanations of the code that I modified myself.

# Filling in Your Study Guide

I detailed the code of every example problem in full by applying two important criteria:

1. Answering key questions in [A Comprehensive List of RB109 Practice Problems & Other Tips](https://medium.com/launch-school/a-comprehensive-list-of-rb109-practice-problems-other-tips-4a4fbb3cdd7c) :  
    **"What does the code output and/or return? Why? What concept does the example demonstrate?"**
2. Implementation of writing tips from [Speaking in Ruby](https://medium.com/@rebeccabiancofiorecw/speaking-in-ruby-caabc4f1adf6). There are many great suggestions here, but some of the most important are the incorporation of:  
    **passive verbs, reading code right to left, and following the code's logical execution path**

This process alone accounted for the bulk of my study time preparing for these exams. I filled out a complete personal study guide before the written exam. When preparing for the interview exam, I went over the guide again and added additional examples when necessary.

Of course, you should study and work through Launch School's original examples, exercises, and reading material, too, but making your own spin-off problems can really help cement difficult concepts.

Your hobbies, line of work, or people you know and admire can inspire your code. This is crucially important if the concept is especially tricky and you're having trouble grasping it through LS's examples alone.

I made one or two personal examples for every study concept using everything from Elden Ring to K-pop group members as inspiration, and I haven't forgotten them. Try it out!

# Polishing Your Study Guide

Lastly, an important part of studying that the process of assembling the guide revealed to me was the need to demystify any terms or concepts I was still unsure about. These terms only floated to the surface when I really took the time to examine various problems and their accompanying details line-by-line.

In these situations, I would be able to say what a code snippet's output and return would be, but I wouldn't necessarily be able to use precise vocabulary. Terms that I previously glazed over really began to jump out.

- ‘signature’ (“`Array#reject` has the signature...”)
- 'modify in place' (“the method modifies the array in place”)
- 'bound' (“[We can also talk of the variable as being bound to the String object, or binding the variable to the String object](https://launchschool.medium.com/variable-references-and-mutability-of-ruby-objects-4046bd5b6717)”)
- 'mutates the caller' (“ [this is a method that mutates the caller](https://launchschool.com/books/ruby/read/arrays)”)
- ‘self’ (“[values_at](https://docs.ruby-lang.org/en/3.2/Array.html#method-i-values_at)(*indexes) → new_array Returns a new Array whose elements are the elements of `self` at the given Integer or Range `indexes`.”)

Some of these terms are defined in LS material, some are explored in more detail later in the curriculum, and some of them have an implicit meaning that is not defined in LS, which is more likely if the term appears in [the Ruby documentation](https://docs.ruby-lang.org/en/) itself.

LS has very few instances of these kinds of terms being introduced without elaboration, especially compared to most other programming learning materials I've consulted. Nonetheless, there may be some terms you need to ask about in Slack, study groups, or consult additional resources to fully grasp. Take note of these terms and clarify them for yourself.

# Make and Review Your Own Flash Cards

What's so special about [Anki](https://apps.ankiweb.net/)? Maybe you've heard about it before.

Anki is a [spaced-repetition system](https://en.wikipedia.org/wiki/Spaced_repetition) (SRS) that will show you the cards you miss more often than the ones you routinely get correct.

The basics of Anki are beyond the scope of this article. There are many resources detailing how to use Anki, including [the getting started guide in the documentation](https://docs.ankiweb.net/getting-started.html). There is even an interesting slideshow presentation by LS student Mandy about the topic of [metacognition](https://en.wikipedia.org/wiki/Metacognition) in relation to Anki and Markdown editor Typora:

If you're interested in using Anki for flashcards, I recommend grabbing the [Syntax Highlighting (NG)](https://ankiweb.net/shared/info/566351439) plugin so you can format code properly. (Note that older versions of this plugin may or may not work depending on your Anki version; at the time of writing, I can confirm that the one I linked works.)

After installing the plugin, you can use it by going to add a card, copying code from your code editor or terminal, selecting Ruby from the dropdown menu listing programming languages, and clicking the lightning bolt.

![](https://miro.medium.com/v2/resize:fit:1000/1*Quk0WBeUIrz-1QL1o600NA.gif)

Using Syntax Highlighting (NG)

My own flashcards use the Syntax Highlighting (NG) plugin, basic question and answer fields, and I also added a 'More information' field that I sometimes use to provide documentation links or further information to shed light on problems I have found trickier. I tag flashcards with their associated course and topic.

The source of my questions and answers are variations on Launch School and [Codecademy](https://www.codecademy.com/learn/learn-ruby) Ruby material, [A Comprehensive List of RB109 Practice Problems & Other Tips](https://medium.com/launch-school/a-comprehensive-list-of-rb109-practice-problems-other-tips-4a4fbb3cdd7c), and my own questions that I have tested.

_I caution against looking around for Ruby flashcards made by others, even if they appear to be applicable to the material you're studying._ Why?

- They may contain mistakes
- You lose the study time of writing out both code and explanations of code yourself
- They may include material that is outdated or otherwise irrelevant to Launch School specifically

By the same token, _you shouldn't share your flashcards either, even if they're entirely original and don't include material from anywhere else_. In doing so, you rob people of the ability to practice, practice, practice using their own examples and explanations that would likely go much further to cement these fundamentals. **Additionally, the guidance on study sessions in the RB109 unit makes it clear that any of your own practice questions you are thinking about sharing should be made available to all students in a central place rather than shared one-on-one**; you can reach out on #the-spot on Slack to ask about adding any questions you think might be helpful to the SPOT wiki.

In general, be cautious about flashcard packs and any other problems that haven't been vetted for applicability to your area of the curriculum; they can't replace the magic of personally crafted flash cards!

Reviewing and making flashcards in Anki was time well spent, coming in second place in the study time I logged. The first place honor went to filling out my custom RB109 study guide in Obsidian. Using Anki also gave me a streamlined system of studying even when time-strapped, just to get in a few cards here and there.

When you get into the swing of things, flashcards become a key part of your routine.

# Review the Source Material

Don't forget about this type of studying. Re-read books and assignments, re-do problems, and re-watch videos from any Launch School material you're unsure about or feel the need to refresh on. It's great to rotate different kinds of studying into your routine, and it may help you avoid potential burnout from more intensive projects like the study guide and flash cards.

Working through the study guide and flashcards often made it clear which material I needed to review, but I also reviewed relevant LS material here and there until it felt as comfortable and familiar as possible. If anything I felt unsure about came up during the review, I added notes to expand on these topics in my study guide.

# Learning with and From Others

I attended five TA-led RB109 study groups in Gather. You can find out about these study groups on the LS events page and on Slack channels for each course, e.g., #RB101–109. I also attended one SPOT session (see more info at #the-spot channel on Slack) led by a fellow student.


##### Introducing the Launch School Flatverse with Gather Town

[We’re very excited to announce a new way to interact with the community at Launch School: in the “flatverse” using…](https://medium.com/launch-school/introducing-the-launch-school-flatverse-with-gather-town-5241358c2bd4?source=post_page-----f6533b141e51---------------------------------------)

If you're attending one of these sessions, write out your questions ahead of time, if you have any about the material you have been studying. Personally, I like to study for an hour right before the study group, with at least a 15-minute break in between. The study groups are usually about an hour long. I found it super helpful to bounce ideas around, listen to others explaining code, and get more practice talking about code out loud myself.

While I have introduced myself, asked questions a couple of times, had some good conversations with fellow students, and participated in Slack through [Smooth Start](https://public.launchschool.com/smooth-start), I admit I'm mostly a Slack lurker. Before asking a question myself, I search to see if anyone else has asked it, and I'm often able to find a great answer just like that.

# Rubber Ducking

Did you explain the output, the return, and the concept the code demonstrates?

Find someone willing to listen to your code explanations, whether they are proficient in Ruby or not. When talking through code out loud, it will become very clear which areas you are confident in and which ones you need to brush up on.

While I didn't rubber duck much before the written exam, rubber ducking was the technique that helped me feel the most prepared for the interview exam. I even did this with someone not too familiar with Ruby, and it still was helpful! I gave them a list of practice problems and what concepts they demonstrated, and I had to explain the output, return, and concepts out loud to random problems they chose. This helped to reveal any stumbling blocks in my understanding.

# Get Ready to Take the Exam

Lay out your materials in advance and make sure you have charged all of your electronics. This is what I used for the written exam:

- **time-keeping devices**

Phone and watch. I used my phone for timing each question and my watch for a timer that expired 10 minutes before the actual deadline to ensure I wasn’t down to the wire.

- **terminal or code editor**

I use [VS Code](https://code.visualstudio.com/). If you haven't used VS Code or similar before, though, just before the exam is probably not the time to start learning it. Make sure you're totally comfortable running .rb files and using irb in whatever you choose.

- **external monitor and screen-splitting feature or application (e.g.** [**Amethyst**](https://github.com/ianyh/Amethyst)**)**

I like tiling windows in columns on my laptop and then using my external monitor to tile two more. It's obviously not a requirement to use an external monitor or screen-splitting function, but for me, it was helpful to have my external monitor display the written exam and VS Code in their own windows and then have Ruby documentation and the Launch School curriculum index open on the other monitor.

Make sure your screen-splitting setup is just how you like it, and you're comfortable with any shortcuts related to layout adjustment before starting the exam if you plan on using it. I loved using Amethyst for this purpose because it made sure no time was wasted going between tabs or maximizing and minimizing windows.

- **piece of paper or blank spreadsheet/document**

Useful for tracking how long each question is taking

- **noise-cancelling headphones**

For the interview exam, which isn’t an open book, I just tested that my headphones and mic worked correctly, everything was charged, and I made sure I understood how to use Coderpad in advance.

# Take the Exam!

That’s right, you’re ready

When do you know when you’re ready to move on to the written or interview exams? You don’t want to rush to take it when you’re not really ready.

Honestly, if you have faithfully done everything I’ve described here, tweaking it to fit your own study preferences that are successful for you over a sustained period of time until you feel comfortable with everything you’re supposed to know for RB109, you are probably ready to take the exam. Practicing out loud with a study partner or in study groups is especially important for the interview exam, so don’t neglect these after finishing the written exam either.

Good luck!