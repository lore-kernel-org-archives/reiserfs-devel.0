From: David Masover <ninja@slaphack.com>
Subject: Re: "Metas"
Date: Sat, 24 Apr 2004 23:38:05 -0500
Message-ID: <408B40AD.2050701@slaphack.com>
References: <20040423203515.GK19049@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18196-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040423203515.GK19049@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>
Cc: reiserfs-list@namesys.com


>
>What's so terribly bad about having the name for it in /proc or /sys
>or wherever and having it global from the kernel config?
>  
>
Imagine if I had to do
    cd `cat /sys/names/parent_directory`
instead of
    cd ..
Or even
    cd $parent_directory
or
    cd $parent

The fact is, for the usability to be sane in a text world, you're going 
to have to stomp on somebody's namespace.  If we were talking about 
scripts, it'd be different, but we're talking about something that I 
know I'd find a _manual_ use for.  Even if you say that I can set it to 
'...' myself, there's the problem of everyone having different 
definitions of that.  Imagine if, before I could even 'cd ..', I had to 
make sure that '..' was really '..'?  Or I might accidentally 'rm -rf 
../something' and have it mean something entirely different, because I'm 
on a different machine?

Note that in creating /proc/sys/names, I may have stomped on somebody 
anyway.  And here we have the chicken-and-egg thing of
    cd `cat /sys/\`/sys/names\``
and so on...

I vote for '...' if Hans/Linus/the Powers that Be will allow it.

>This is such a waste of time, really.
>  
>
Not really.  We already have 'metas' working, and now people want to 
change it.  There are a few choices here, if we wanted to "not waste time":
    Change it to the most popular idea, then change it again, and again, 
until people stop bickering.  They won't, and this is just confusing to 
users.
    Leave it the same until someone comes up with a generally accepted idea.
    Hans arbitrarily picks an idea.

Option #2 is what appears to be happening, and is the right thing to do 
-- make something that works (somewhat) so that other development may 
continue, then don't waste any more coding time on it until the design 
is solid.

Or, if you mean that bickering is a waste of time, get used to it -- 
we're human.  On top of that, if reiser4 is successful, no one may 
remember us, but they will use what we create here every day.

I appologize -- I shouldn't have said "we create".  I do little more 
than bicker.
