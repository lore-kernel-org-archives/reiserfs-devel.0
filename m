From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: BUG: Replaying ReiserFS log causes hard lockup
Date: Fri, 26 Mar 2004 10:46:40 -0500
Message-ID: <40645060.7050707@suse.com>
References: <20040325204836.07bcf910.a.nielsen@optushome.com.au>	<1080213348.1976.277.camel@tribesman.namesys.com>	<1080219262.14742.146.camel@watt.suse.com>	<20040326220107.333b23e8.a.nielsen@optushome.com.au> <20040326223443.2e5011fa.a.nielsen@optushome.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17501-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040326223443.2e5011fa.a.nielsen@optushome.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Adam Nielsen <a.nielsen@optushome.com.au>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Adam Nielsen wrote:
|>Then it locks.  Once it printed the message about INIT starting after
|>this, so I guess it's something around this point that's causing the
|>problem.  However since it seems to be a *really* bad lock, I don't
|>know how to proceed :-(
|
|
| Ok, I've done some more fiddling and I think I've narrowed the problem
| down to the SATA driver.  Since the kernel used to boot, then it
| started locking up during booting, I was trying to work out what could
| cause this.  I tried wiggling the SATA cable again, and that fixed
| it - I could boot Linux again.
|
| Wiggling the SATA cable while Linux was loaded didn't seem to cause a
| problem, so I started dd reading off a ton of data and started fiddling
| with the cable.  I couldn't seem to fault anything, so I tried
| unplugging the cable altogether (as SATA is hot swappable.) Obviously
| everything accessing the drive paused, and when I plugged the cable back
| into the drive it seemed as though everything resumed again (because the
| drive started reading off a ton of data due to dd running.)  However,
| after a few seconds the drive stopped reading, and dd wouldn't
| terminate.  I tried switching to another VT and logging in, but after I
| typed in my login name it froze too.  It seems that if the drive gets
| disconnected and reconnected, everything accessing it stops (I'm
| guessing due to a driver problem.)
|
| I'm still not sure why it would lock up during boot, but perhaps when
| the SATA hardware is initialised the drive disconnects and reconnects,
| and if it hasn't reconnected by the time something (e.g. ReiserFS) wants
| to access the disk, that causes the lockup - only since the lock happens
| in the kernel, it completely locks everything up.  Of course, this is
| just a wild guess, but given the behaviour it does seem like a
| possibility.  Especially if hotswapping is a feature not yet implemented
| in the driver (which is quite likely, as it is still only in the testing
| stage.)
|
| Anyway, thanks for all your help, and I might try to find the SI3512
| driver people and see what they think.  Wish me luck ;-)

It may be a driver problem, but it could also be a shortcoming in the
way ReiserFS currently handles write errors in the journal.

Even when all you're doing is reading from the disk, you're still
writing a little bit (unless you've mounted with -onoatime,nodiratime).
ReiserFS can't deal at all with the device going away when it's
performing journal operations. Since updating the atime for a file
requires altering the metadata, it uses the journal. If I had to guess,
I'd say that you'd see ReiserFS panic in your logs, with something along
the lines of "journal-###: buffer write failed". A panic will make all
further access to the filesystem hang.

I'm in the final stages of a patch that will allow ReiserFS to handle
journal io-errors more gracefully. The result will be, rather than
panicking the system on journal write, the filesystem will be forced
read-only and all active transactions will be aborted and released. The
filesystem will umount'able, and on re-mount will appear similar to as
if a power failure had occured. However, since it did abort on an
io-error, I'd recommend a reiserfsck on the aborted partition.

- -Jeff

- --
Jeff Mahoney
SuSE Labs
jeffm@suse.com
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFAZFBgLPWxlyuTD7IRAgOYAJ4m9a2QRsUH7BuB7igHOWZf3P3j4ACfWml/
0aYNPCreOG3UQbI4/YNJTSw=
=Bqo5
-----END PGP SIGNATURE-----
