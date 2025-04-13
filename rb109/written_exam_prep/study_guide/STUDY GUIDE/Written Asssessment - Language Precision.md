### Language Precision

#### Parameters vs. Arguments

Parameters are the names assigned to a method's arguments, while arguments are the values passed to the method.

#### Variables vs. Values

Variables are not passed to or returned by methods: **values** or **references** are passed.

#### Assignment

When discussing a variable assignment like this:

```ruby
greeting = 'Hello'
```

Most of the Launch School material describes this statement as:

> The `greeting` variable is assigned to the string `'Hello'`.

However, there are places where we describe this code as:

> The string `'Hello'` is assigned to the `greeting` variable.

Both of these are acceptable in assessments. However, try to be consistent; otherwise, your meaning may be confused.

#### Truthiness

Be clear about the distinction between _truthiness_ and Boolean values. You should distinguish between _truthy_ and the Boolean `true`. Likewise, you should differentiate between _falsy_ and the Boolean `false`.

In Ruby, `false` and `nil` both _evaluate as false_ in a Boolean context, while all other values _evaluate as true_. We can, therefore, say that `false` and `nil` are _falsy_ values, while every other value is _truthy_. This is **not** the same as saying that `false` and `nil` are `false`, nor can we say that all other values are `true`. These may seem like subtle distinctions, but they are important ones. For example:

```ruby
a = "Hello"

if a
  puts "Hello is truthy"
else
  puts "Hello is falsy"
end
```

Here, it would be **correct** to say that either:

- `a` evaluates as true in the conditional statement, or
- `a` is truthy

But it is **incorrect** to say:

- `a` is `true`, or
- `a` is equal to `true`

To summarise, use "evaluates to true", "evaluates as true", or "is truthy" when discussing an expression that evaluates as true in a Boolean context. Similarly, use "evaluates to false", "evaluates as false", or "is falsy" when discussing an expression that evaluates as false. Use "is `true`" or "is equal to `true`" **only** when talking about the Boolean `true`, and "is `false`" or "is equal to `false`" **only** when discussing the Boolean `false`.

## Time Management

Be sure to practice time management to ensure you don't go over the time limit. For example, in a 2-hour assessment with 10 questions, you will need an average of 12 minutes for every question. If you spend 15 minutes per question, you will rapidly become pressed for time.

At the start of the assessment, quickly review all the questions to identify those that may require more time. This will help you gauge how much time you can realistically devote to each question. Don't forget to reserve some time for reviewing your answers, mainly to ensure you have addressed all parts of each question.

Several Launch School students have shared articles on time management for the JS109 and RB109 assessments. These articles offer valuable insights:

- [The Importance of Time and Stress Management For Launch School Interviews](https://medium.com/launch-school/the-importance-of-time-and-stress-management-for-launch-school-interviews-20cb1b2fc92f)
- [How to prepare for Written Assessments and Manage your time while taking them!](https://medium.com/@haider.codes23/how-to-prepare-for-written-assessments-and-manage-your-time-while-taking-them-495ff01c37ca)
- [Why I Ran Out of Time Taking Launch School’s RB109 Written Assessment (and what I’m changing so it doesn’t happen again)](https://medium.com/launch-school/why-i-ran-out-of-time-taking-launch-schools-rb109-written-assessment-and-what-i-m-changing-so-it-32a7eeb77b26)

## Additional Tips

Some Launch School students have blogged about their assessment experiences:

- In the video [How I Study and Prepare For Launch School's Assessments](https://www.youtube.com/watch?v=NS1ar08blQk), Felicia describes how she prepares for Launch School assessments, written and interview. This is an excellent video with advice that almost everybody can benefit from.
- Zach had a rough time through the first two Launch School assessments. In [I Failed Programming 101 Three Times](https://zachary-dubow.medium.com/i-failed-programming-101-three-times-6fa0ea487f64), he describes his struggle and frustration trying to pass these assessments and how he eventually embraced the Launch School way.
- Raúl talks about his preparation and experiences as a non-native English speaker in [this interesting article](https://medium.com/@raul.dehevia/launch-schools-109-written-assessment-a-non-native-english-speaker-s-perspective-d320b47368ba).
- Callie's [blog article](https://medium.com/launch-school/passing-launch-schools-first-assessments-rb109-4b2b047060dc) has a wealth of helpful information about preparing for both parts of the assessment: the written assessment and the interview.

The above articles were written for older versions of the JS109 and RB109 assessments, which had 3-hour time limits and more questions. However, the guidance in these articles remains relevant.

These articles are worth your time; don't pass them up!

## Mock Assessment

A mock assessment is available [here](https://launchschool.com/gists/dd5687ea). This demonstrates the format of our written assessments and includes a few questions with model answers to illustrate the level of detail and precision required for full marks.

## During the Assessment

Assessments are timed. Your grade will be reduced if you exceed the time limit. However, it's better to submit an assessment late than with incomplete or poor answers.

When you begin the assessment, you will not receive any warnings, countdowns, or emails. You must manage your time independently. We will check the start and submission times when grading the assessment.

**Save your answers as you work through them!**

If you encounter problems during the assessment, such as:

- Accidentally closing your browser, browser window, or browser tab
- Power outages
- Software failures
- Other technical glitches

You can recover your saved answers by reopening the assessment. However, this only works for saved answers. Remember that the clock will continue to run while you address any issues.

If you experience technical glitches that may be on our end, take a screenshot, if possible, to document the problem. Then, reload the page in your browser. You can report the issue **after** submitting the assessment. Immediate responses via Slack or email are not guaranteed, so it's best to continue working as soon as possible. You can add your notes to the Conversation tab.

## Next steps

There is a study guide lesson for each assessment with advice tailored to that specific assessment. After that, there is a "Start the Exam" lesson. When you go into this lesson, you will be taken to a page with some final reminders about the assessment. There will be a button that you need to click to actually begin the assessment.

After completing the assessment, click the "Submit" button to submit your assessment for grading. We aim to grade assessments within 24 hours of submission, though it may take longer on weekends and holidays.

As part of the grading process, you may be asked to revise some of your answers and resubmit your assessment. These revisions should be completed within 3 days of the request. Sometimes, multiple rounds of revisions are necessary to ensure complete comprehension of course materials, even for answers that received full marks.

Upon completion of the revisions, you will receive a verdict and feedback within 24 hours.

If you have any questions during the grading process, please use the "Conversations" tab in the assessment to communicate with the TA responsible for grading your assessment.