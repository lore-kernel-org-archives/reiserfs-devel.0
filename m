From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: "Metas"
Date: Sun, 25 Apr 2004 13:09:26 +0300
Message-ID: <20040425100926.GO19049@nysv.org>
References: <20040423203515.GK19049@nysv.org> <408B40AD.2050701@slaphack.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18205-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <408B40AD.2050701@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Masover <ninja@slaphack.com>
Cc: reiserfs-list@namesys.com

On Sat, Apr 24, 2004 at 11:38:05PM -0500, David Masover wrote:

>Imagine if I had to do
>   cd `cat /sys/names/parent_directory`

You would not. It would simply be a means of accessing the name
of the parent directory.

If you were in a situation where you would not know the name of
the parent directory.

>scripts, it'd be different, but we're talking about something that I 
>know I'd find a _manual_ use for.  Even if you say that I can set it to 

You check it once to see if the kernel has the default names for
the metas directory. "Oh, bugger, it's changed to METAS, then I guess
I'll use cd METAS in the furure"

As for scripts it's easy to say `cat`

>definitions of that.  Imagine if, before I could even 'cd ..', I had to 
>make sure that '..' was really '..'?  Or I might accidentally 'rm -rf 
>../something' and have it mean something entirely different, because I'm 
>on a different machine?

I think this is a gross exaggeration ;)

>I vote for '...' if Hans/Linus/the Powers that Be will allow it.

I'm still sticking to ..metas/ and I don't know why I even touched
a thread like this :)

>Not really.  We already have 'metas' working, and now people want to 
>change it.  There are a few choices here, if we wanted to "not waste time":

Discussing the point per se is not a waste of time, it's the bickering.

This is starting to look like a stalemate Debian vs Gentoo war :)

>   Change it to the most popular idea, then change it again, and again, 
>until people stop bickering.  They won't, and this is just confusing to 
>users.

Or every administrator decides on what they'll have on their machines.

>   Leave it the same until someone comes up with a generally accepted idea.

Which is just as easily circumvented by one like of kernel code.

>   Hans arbitrarily picks an idea.

He already did.

>Option #2 is what appears to be happening, and is the right thing to do 
>-- make something that works (somewhat) so that other development may 
>continue, then don't waste any more coding time on it until the design 
>is solid.

This is pretty true. I certainly hope the Namesys people are semi-ignoring
this thread for better work on something more important.

>Or, if you mean that bickering is a waste of time, get used to it -- 
>we're human.  On top of that, if reiser4 is successful, no one may 
>remember us, but they will use what we create here every day.

I just want to see this thing fly, get into distros, gain popularity,
be the best fscking (pun intended) file system around :)

That includes standing behind ..metas/, a /sys/ export and a kernel
macro or whatever means that an admin can use to semi-trivially change
the system's name for the dir.

And never have mv work on the directory, especially while it's invisible
to readdir.

-- 
mjt

