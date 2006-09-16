From: David Masover <ninja@slaphack.com>
Subject: Re: Relocating files for faster boot/start-up on reiser(fs/4)
Date: Sat, 16 Sep 2006 03:59:32 -0500
Message-ID: <450BBCF4.7060506@slaphack.com>
References: <200609131451.42474.lists@qutek.net> <200609151520.39826.lists@qutek.net> <450B28E6.90405@slaphack.com> <200609151801.09038.lists@qutek.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29907-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200609151801.09038.lists@qutek.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Quinn Harris <lists@qutek.net>
Cc: reiserfs-list@namesys.com

Quinn Harris wrote:
> On Friday 15 September 2006 16:27, David Masover wrote:
> 
>>> Not sure if I would be better of trying initng or waiting for upstart
>>> (Ubuntus new init) to get scripts that actually parallel boot.  The code
>>> for upstart is very clean and it has the backing of a major distro, so I
>>> have high hopes.
>> Hmm.  That sounds kind of cool, but I wonder how it compares to Gentoo's
>> init scripts?  I guess I'll have to wait till it hits the one Ubuntu box
>> I have...
> Gentoo default init doesn't paralize well.  Not when compared to initng which 
> is realitivly easy to get to work on Gentoo.

I'm not sure what initng is, but the way I paralize Gentoo is by setting 
a flag in /etc/conf.d/rc:
RC_PARALLEL_STARTUP="yes"

I still don't see a difference between initng and Gentoo's init.  I 
guess I'd have to install them both.  One thing I like about Gentoo's 
init is that they are still just shell scripts, and it would take a 
minimal amount of code to convert them to/from the old init style.

> The Ubuntu people decided 
> initng wansn't powerfull enough (let alone the existing sysvinit).  They 
> thought it needed a better way to define the bootup sequence during boot.  In 
> addition to integrate running any task like ACPI events, hotplut, CRON into 
> one consistent tool.
> http://www.netsplit.com/blog/work/canonical/upstart.html

Aha, thanks.

Getting offtopic here, but I don't see the comparison I'm looking for. 
I see why it's different than launchd -- mostly, that launchd provides 
no way of knowing whether we want to wait for a script to run or an app 
to start.  But I don't know of a way to know when an app has finished 
starting, unless it daemonizes itself -- which makes it easy to write a 
script that ends when the app has started.

I really don't see the usefulness of making that distinction as far as 
dependencies go.

Finally read up on the "event-based system", and I suspect this kind of 
thing could probably be an extension to a dependency-based system.  I 
guess we'll see if initng pulls that off.

>> Wait...  Python is more universal than Ruby of Ruby on Rails?
> Both Gentoo and Ubuntu install Python by default but not Ruby.  And more 
> people at least in the US are familiar with Python.  Finally I might use 
> Python inotify code (to replace readahead-watch) and the Ruby version is a 
> bit alpha and I don't think availible in Gentoo or Ubuntu packages.

Speaking of which, the Perl inotify is broken for me a bit lately, I 
need to figure out what's going on.  Unfortunately, I don't know if it's 
perl or the kernel that's broken...

> I don't know of anything Python does reasonably well that Ruby 
> can't do reasonably well (- the performance problem).

This might solve the performance problem:

>> I'm waiting for someone to do a decent
>> implementation of Ruby on something like .NET before I start using it
>> for anything I want to perform well.

If they can do it right, well, it seems like MS wants to replace C++ 
with C#, thus .NET should perform decently.  Mono means it's 
cross-platform, or at least, it runs JIT'ed on the platforms I care about.

And hey, once you're on Gentoo or Ubuntu, it doesn't matter much, 
really.  Install a Ruby app and Ruby becomes a dependency.
