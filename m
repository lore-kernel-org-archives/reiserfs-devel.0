From: Hans Reiser <reiser@namesys.com>
Subject: Re: Atomic filesystem or not
Date: Mon, 19 Jul 2004 01:33:50 -0700
Message-ID: <40FB876E.1050200@namesys.com>
References: <200407151434.23082.marcel@hilzinger.hu> <200407151354.47063.ctpm@ist.utl.pt> <40F6DE4A.2070103@slaphack.com> <40F6E06B.1080505@namesys.com> <40F73370.2090600@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19678-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40F73370.2090600@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Masover <ninja@slaphack.com>
Cc: Claudio Martins <ctpm@ist.utl.pt>, reiserfs-list@namesys.com, Marcel Hilzinger <marcel@hilzinger.hu>

David Masover wrote:

>
>
>
> Hans Reiser wrote:
> | David Masover wrote:
> |
> |>
> |> doing atomic operations -- because a system call named "reiser4"
> |
> |
> | Maybe I should call it sys_reiser and not sys_reiser4? ;-) What about
> | the name is not portable? ;-)
>
> Um.  Suppose someone wanted to duplicate it on (say) ext3?  Then the
> name sys_reiser becomes confusing.

I think it becomes clear not confusing.  It tells them they are 
following the reiser standard for how to act on their files, even if 
ext3 stores the files and has implemented the methods invoked to 
implement those actions. 

APIs should be defined by one person when possible. Committees are great 
for feedback, but generally do poorly at remembering the spiritual 
purpose of the API when they are given control of it.

>
> But I bet your system call does more than just define atoms, right?  Or
> it's supposed to?

A lot more, and it will expand rapidly over the next few years.

>
> Is there an advantage to having one system call, instead of many?
> (sys_begin_atom, sys_end_atom, sys_keyword_search, and so on...)

Yes, but it is hard to articulate the advantage.  I think the main one 
is that it encourages applications to just pass the semantics straight 
to the user without each app inventing its own atom delimiters, etc.  
This encouragement comes in the form of it being simplest to code it 
that way.  This is important.  I want users to only have to learn one 
way of naming things, not a different way for each application, not 
unless it is so well motivated that a programmer goes to extra effort to 
code it to be different.

>
> If so, you either want to try to turn it into a standard (so all new
> filesystems will have a sys_reiser call) or create a library to abstract
> the system call away (something like atom_new, atom_end, and so on).  In
> fact, if I'm not mistaken, the "atomic" features could even be
> implemented entirely as a userland library on top of the filesystem, at
> least as long as the power is on ;)
>
> I like your way better, but I also like the idea of making those
> features so widespread (even poorly implemented) that programs start
> adopting them.
>
> No matter how good reiser4 is, I don't think everyone will start using
> it overnight.  And its atomicity means very little to the average user
> if it isn't ubiquitous.  I want cp, vim, thunderbird, and so on to all
> support reiser4-style atoms.  If they can do that without a reformat for
> existing users/developers, it's more likely to happen in such mainstream
> apps, and it helps make reiser4 more useful.

David, none of the other linux filesystem development teams have any 
interest in implementing innovative semantics.  If they support 
sys_reiser4 by any name, they will do it sniping at it all the way.  
Designing semantics requires a very serious education in the topic, and 
not a lot of people are suited for such work.  (Dominic Giampaolo of 
Apple is one person, Codd was another, maybe MS has a few such persons 
but I don't know who and hopefully MS does not know either;-).)  Look at 
the  hassle they gave me over xattrs, which they want to do because 
someone else did it for Unix 5 years ago and not because they have the 
slightest clue about namespace design principles.

Apple wants to innovate in the FS semantics, Microsoft wants to innovate 
in the FS semantics, no major linux filesystem development teams 
competing with us want to implement any semantics less than 5 years old, 
and some of them even think and say that Linux should never implement 
things that have not had 5 years to mature in some other operating 
system first.   I cannot comprehend such people.

They are a wet noodle, and it is better to drag them by setting an 
example their users tell them to imitate than to try to push them by 
getting them to do what I say is the right API before the users are 
using it.

We have created a great storage layer, and if they were reasonable they 
would start building on top of it because it is the fastest storage 
layer ever.  It is so easy to add plugins to it. We could use so much 
help in adding new plugins, tweaking performance in corners we have 
neglected, etc. 

The Apple and Microsoft teams are much more serious about semantics than 
our linux competitors, and much better funded (that is to say, they are 
funded....)  than I am.  I worry about them.  Our linux competitors have 
zero architects, and  genuinely think architects have no value.  Sigh.  
There are so many ways to be silly in life.

We need to get some funding for pushing sys_reiser4() semantics out to 
the most commonly used apps by writing patches for them.  That would be 
nice....

Hans
