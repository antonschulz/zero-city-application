# zero-city-application
Application for Tekniska Museet's "Zero-City"-exhibition

## Git pull requests and reviewing
To ensure that the code we write is understandable and well written we will be using pull requests 
and peer reviews. This means that we will pretty much never push directly to the master branch and
instead make use of feature branches. When the code is ready it will be reviewed by at least one
person who wasn't part of writing it before it is included in the master branch.

### Branches and pull requests
When working on a feature, say for example a new assignment, create a new branch (name it something 
relevant like the assignment name) and perform your work in this branch. When your code is ready to 
be included in the main branch make a pull request from your feature branch. Make sure that your
code is clear and understandable so that someone else can easily understand it. Also make sure that
comments are included where reasonable (comments don't make up for unreadable code though). The pull
request should also include a small description of what was changed and (if applicable) which
requirements it relates to. When at least one person has peer reviewed the pull request and marked 
as approved it can be merged (if the reviewer didn't already do this)

### Peer reviews
Peer reviewing a pull request is done by going to the "files changed" page of the pull request (on 
github) and going through the changes. Sometimes you should also switch to the branch locally so you
can run and test the changes. When reviewing someones code, keep the following in mind:

1. Be nice! You are reviewing the code not the person, if you see something wrong comment about it, but don't be an asshole. :)
2. Is the code easy to understand or does it take a long time to decipher?
3. Are the comments correct and well written? Are they needed? Or is there perhaps somewhere there should be one but isn't?
4. Does the code actually do what it's supposed to? Does it do anything it's not supposed to?
5. Does it contain any obvious faults or room for improvement?
6. ... Can't think of anything more right now, but if you come up with something else add it to this list

If the changes pass these requirements it is probably good enough to be included, but it is of 
course always nice to have more than one pair of eyes review the code before merging it. If you
think it is good enough then press "Review changes" on the top right of the "Files changed" page and
"Approved", and include any comments you might have. If you think there is something that must be
changed before it is merged then select "Request changes" and comment why you don't think it is 
ready to be merged.

## Setting up workspace
### Installing software
Guide follows steps from (Flutter's installation page)[https://docs.flutter.dev/get-started/install/windows]

1. Install (Android Studio)[https://developer.android.com/studio]
2. Download flutter from the flutter documentation.
3. Start android studio and go through the Android Studio setup wizard.
4. Open command prompt and type `flutter doctor`. Set android studio installation path using `flutter config --android-studio-dir "<directory>"`
5. When opening project, either select github repository fold which you've already cloned or select VSC and type in `git@github.com:antonschulz/zero-city-application.git`
6. Create Virtual device by clicking device manager (Icon in top-right which looks like a mobile phone)
7. Follow steps, more detailed steps to come.
8. Open device, and start the app by clicking run (green play button).