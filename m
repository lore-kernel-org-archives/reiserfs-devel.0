From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Creditsd [Re: Speaking of credits...]
Date: Sat, 8 May 2004 12:52:06 +0300
Message-ID: <20040508095205.GG29226@nysv.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18554-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Burnes, James" <james.burnes@gwl.com>
Cc: reiserfs-list@namesys.com

I just had to break this into a new thread, sorry ;)

On Fri, May 07, 2004 at 03:26:41PM -0600, Burnes, James wrote:
>I'm working on a 'creditsd' daemon that runs in the background and acts
>as a "broker" between applications that want to publish credits and
>applications that want to sample them.

Where are the credits stored, and how?
Also some syslog facility pops to mind.

>Basically creditsd exports and API that makes it possible for teams and
>individuals that contributed to a subsystem to make themselves known to

Subsystem also implies userland software?

>people and other applications that want to know.  It does it "out of
>band" so that it doesn't affect performance and gets around the problem
>of the credit's being invisible at some application layer that calls a
>lower layer.  What if a kde app calls the reiserfs mkfs tool?  Credits
>will be invisible even though they are not intended to be.

Where will they be shown?
/dev/xconsole, which may be hidden?
/var/log/credits?
kreditsviewd which is launched by kde which listens to a creditsd socket?

>The credits deamon will accept credit registration at either package
>install time or run time.

What do you mean by registration?
That the credits register with creditsd and then are forwarded to some
appropriate place?

>Credits displays and access methods which can include screensavers,
>install attractors, perhaps a kde ioslave called credits:, maybe
>something in /proc), will have the option of looking at the credits of

/proc, and many other solutions, require integration with the kernel.
That's not necessarily a bad thing, but I have one thought.

If userland apps are allowed to pump credits at will and the kernel
brokers them, there has to be good safety against DOSes.
while [ 0 ]; do shove_credit; done
OOPS! KERNEL PANIC! PWNED BY THE HAXOR KRU!

>either all installed apps, all running apps, or some selection of those,
>perhaps sorted by various process criteria, package install date or
>whatever.

It should be fairly easy to implement these hooks at any given time.
Of course, say, dpkg, must support this new API, as would .debs.
Or maybe the preinstall script would execute the userland program
/usr/bin/registercredit, but that has to be installed.

>It will be up to the credits display program and the user to decide how
>much credits they want to watch, how fast, how quietly etc...

We must hope this satisfies Hans. I think this idea is mostly for him.
It would satisfy me, though.

>Well the idea is a little loose right now, but perhaps a little more
>innovation and a little less "legislation" is what we need right now.

Amen!

>Should be fun.  I'm going begin the prototype this weekend.

Hey, this is a great project.

My questions above are not criticism, understand me correctly, but
in my opinion important issues that must be considered.

Please keep us updated and let me know if I can help in any way.
It would be interesting (if I have time, which I seldom have) to
implement something in Python that uses this API. Would be extremely
educational too, I believe.

So, when's a project page up at sourceforge?-)

Unreasonable to expect this to be in the kernel and distros very soon,
but maybe if we see it as a race condition, if Hans would be willing
to adopt this API for credits, it would be good if we had it pretty
well supported at the time of launching.

When it is in the mainline kernel, the reiser4progs etc credits system
could be altogether migrated. However, we must still depend on the
community. If the license says "you may not change the credits printing
system away from creditsd" it's still as non-free as the current one.

Relying on the community on this issue is not a bad thing. If the API
makes it to the kernel, no distro would want to patch the credits away
from the progs. This I'm sure of. They would also use the API themselves.
Many people don't trust other people, the kindness of strangers[1], but
here there is no reason not to trust them.

Thanks a million, let's make this fly!

[1]
Spock's Beard, The Kindness of Strangers, The Good Don't Last:
[...]
We could have done anything we wanted to do
Ant I don't know how it happened
But we got it all wrong
The bad don't mean anything
And the good don't last too long
[...]
Could have had give
Could have had take
We could've made anything we wanted to make
So we made 'Wheel Of Fortune'
And all the popular songs
We made a land where crap is king
And the good don't last too long
[...]

-- 
mjt

