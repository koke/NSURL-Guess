# NSURL+Guess
## Fix common typos on URLs

If you are getting URLs from a user input, sometimes there are typos, or the users are confused about the whole 'URL' thing.

There are a few ways to be smart about it

## Usage

````objc
    NSURL *url = [NSURL guessURLWithString:@"hppt:/myblog.com"];
    // url now has http://myblog.com/
````
