From: "Humberto Massa" <humberto.massa@almg.gov.br>
Subject: Re: reiser4 non-free?
Date: Mon, 10 May 2004 08:22:32 -0300
Message-ID: <1084188152.26226.196158678@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18574-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: debian-legal@lists.debian.org
Cc: reiser@namesys.com, reiserfs-list@namesys.com, ed@debian.org, cavok@debian.org

>> In the case of a NDIS driver, the driver itself is without doubt NOT
>> a derived work on the linux kernel.
>
>Yes, but the combination of the driver with the kernel is a derived
>work of the kernel, and it's not a case of "mere aggregation", which
>the GPL permits.

people here are not understanding me at all. I'll try to be more clear:

My position about Mr. Reiser's change of licensing:

1. The new license is GPL-incompatible. This is not a problem. He said
-- and I'll believe in his good faith -- that the kernel patch is not to
be licensed according to it, but GPL'd. OK.
1 (a) reiser4progs can be considered to be derivative of the reiser4
patch, but not a derivative of the kernel. I repeat: this is OK.

2. The new license has the possibility of being considered a
non-DFSG-free license because he is -- not really severely, but
seriously -- stopping creation of /some/ derived works. He does it to
stop
what he -- erroneously, IMHO -- called "plagiarism". I'll refer to it as
"aggressive rebranding". This is an unfortunate problem, in that would
get reiser4progs (and maybe reiserfsprogs) out of main, with all the
disadvantages that incur.
2 (a) Now, we should think: does Debian /need/ to aggresively rebrand,
removing the credits -- which Mr. Reiser state are part of his revenue
generation? Take in consideration the excellent work namesys has been
doing before answering.
2 (b) If the credits are to be considered for some reson prohibitively
extensive, what could we do to continuing their display, summarizing
them, to a point where it should be acceptable to Mr. Reiser?
2 (c) It has being a policy of the Debian Project, AFAIK, to comply
with the wishes of upstream (and *not* gratuitously fork projects)...

3. In the light of what I consider in good faith answer to the points
above, 
I suggest we politely request from Mr. Reiser that reverts his license to 
the GPL, with a request attached to it, whose terms would be something
like:

	"altough this license grants you the rights to modify the
	package, according to your wishes, the original copyright holder
	requests that you don't modify the credits printed at [[insert
	the occasions when they are printed here]], or the code that
	makes them being printed, or obfuscate their output in any way.
	This is because those credits are part of our revenue stream
	generation, and only by preserving them you would assure that we
	can continue to produce and improve the high-quality software
	you are using. For the record, for this version the referred
	credits are:

	  [[copy *all* of the credits here]] "

This request would be honored, IMHO, by the Debian Project, and I think
even RedHat and others would consider (after having their attention
called to this discussion) including the full Namesys branding as
opposed to losing reiserfs in the longer run. Besides, the full credits
will be a *legitimate* part of the license text -- and as such, it would
not be possible to ditch them anyway.

In a more technical point, some Makefile magic should be enough to
keep the copies of the credits in sync. :-)

4. The suggestion (3) above is the reason why I'm e-mailing this to the
reiser*progs maintainers.

5. Now back to the top and the NDIS driver thingy:

the combination of the NDIS driver and the kernel happens only
in the user's machine... the NDIS driver is certainly undistributable
by debian, it's in the disc present in the hardware box... and
copyright gives the user the possibility of combining them.

Hope to have helped,

--
br, M



-- 
http://www.fastmail.fm - Email service worth paying for. Try it for free
