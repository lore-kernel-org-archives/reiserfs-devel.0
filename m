From: Quinn Harris <lists@qutek.net>
Subject: Re: Relocating files for faster boot/start-up on reiser(fs/4)
Date: Fri, 15 Sep 2006 18:01:07 -0600
Message-ID: <200609151801.09038.lists@qutek.net>
References: <200609131451.42474.lists@qutek.net> <200609151520.39826.lists@qutek.net> <450B28E6.90405@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29906-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <450B28E6.90405@slaphack.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Friday 15 September 2006 16:27, David Masover wrote:

> > Not sure if I would be better of trying initng or waiting for upstart
> > (Ubuntus new init) to get scripts that actually parallel boot.  The code
> > for upstart is very clean and it has the backing of a major distro, so I
> > have high hopes.
>
> Hmm.  That sounds kind of cool, but I wonder how it compares to Gentoo's
> init scripts?  I guess I'll have to wait till it hits the one Ubuntu box
> I have...
Gentoo default init doesn't paralize well.  Not when compared to initng which 
is realitivly easy to get to work on Gentoo.  The Ubuntu people decided 
initng wansn't powerfull enough (let alone the existing sysvinit).  They 
thought it needed a better way to define the bootup sequence during boot.  In 
addition to integrate running any task like ACPI events, hotplut, CRON into 
one consistent tool.
http://www.netsplit.com/blog/work/canonical/upstart.html


>
> > Much like before, I was able to improve a 16.5s oowriter cold start to
> > 14s with this reallocate script, with a cold start of 4.8s (OO 2.0.2, was
> > using 2.0.3 before).
>
> Wait -- cold start is 14s, but it's also 4.8s?  Did you mean warm/hot
> start for that last number?
OOPS its 4.8s warm and was initially 16.5s cold then 14s cold after 
reallocationg.
>
> > I think Python will be the best language for this because its become
> > relatively universal and its easy to understand for the uninitiated. 
> > This really isn't black magic so transparency is good.  I personally
> > prefer Ruby though.
>
> Wait...  Python is more universal than Ruby of Ruby on Rails?
Both Gentoo and Ubuntu install Python by default but not Ruby.  And more 
people at least in the US are familiar with Python.  Finally I might use 
Python inotify code (to replace readahead-watch) and the Ruby version is a 
bit alpha and I don't think availible in Gentoo or Ubuntu packages.

I came to Ruby through RoR.  I think the language has an unmatched pragmatic 
eligance.  This isn't appreciated until one addresses a few problem domains 
with it.  I don't know of anything Python does reasonably well that Ruby 
can't do reasonably well (- the performance problem).  On the other hand, I 
doubt Python could make for something as slick as Rake 
http://www.martinfowler.com/articles/rake.html.  And Ruby provides a wealth 
of conviences and shortcuts without being the lexical mess that is Perl.  I 
could be missing something though.  But for this particular problem Python 
isn't bad.

>
> Python is faster, anyway...  I'm waiting for someone to do a decent
> implementation of Ruby on something like .NET before I start using it
> for anything I want to perform well.

