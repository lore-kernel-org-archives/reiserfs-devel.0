From: Adam Nielsen <a.nielsen@optushome.com.au>
Subject: Re: BUG: Replaying ReiserFS log causes hard lockup
Date: Fri, 26 Mar 2004 22:34:43 +1000
Message-ID: <20040326223443.2e5011fa.a.nielsen@optushome.com.au>
References: <20040325204836.07bcf910.a.nielsen@optushome.com.au>
	<1080213348.1976.277.camel@tribesman.namesys.com>
	<1080219262.14742.146.camel@watt.suse.com>
	<20040326220107.333b23e8.a.nielsen@optushome.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17491-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040326220107.333b23e8.a.nielsen@optushome.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> Then it locks.  Once it printed the message about INIT starting after
> this, so I guess it's something around this point that's causing the
> problem.  However since it seems to be a *really* bad lock, I don't
> know how to proceed :-(

Ok, I've done some more fiddling and I think I've narrowed the problem
down to the SATA driver.  Since the kernel used to boot, then it
started locking up during booting, I was trying to work out what could
cause this.  I tried wiggling the SATA cable again, and that fixed
it - I could boot Linux again.

Wiggling the SATA cable while Linux was loaded didn't seem to cause a
problem, so I started dd reading off a ton of data and started fiddling
with the cable.  I couldn't seem to fault anything, so I tried
unplugging the cable altogether (as SATA is hot swappable.) Obviously
everything accessing the drive paused, and when I plugged the cable back
into the drive it seemed as though everything resumed again (because the
drive started reading off a ton of data due to dd running.)  However,
after a few seconds the drive stopped reading, and dd wouldn't
terminate.  I tried switching to another VT and logging in, but after I
typed in my login name it froze too.  It seems that if the drive gets
disconnected and reconnected, everything accessing it stops (I'm
guessing due to a driver problem.)

I'm still not sure why it would lock up during boot, but perhaps when
the SATA hardware is initialised the drive disconnects and reconnects,
and if it hasn't reconnected by the time something (e.g. ReiserFS) wants
to access the disk, that causes the lockup - only since the lock happens
in the kernel, it completely locks everything up.  Of course, this is
just a wild guess, but given the behaviour it does seem like a
possibility.  Especially if hotswapping is a feature not yet implemented
in the driver (which is quite likely, as it is still only in the testing
stage.)

Anyway, thanks for all your help, and I might try to find the SI3512
driver people and see what they think.  Wish me luck ;-)

Cheers,
Adam.
