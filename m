From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: reiser fs slow on mksf and mount
Date: Mon, 29 Aug 2005 11:07:12 -0400
Message-ID: <431324A0.1010708@suse.com>
References: <1125074717.5549.44.camel@localhost.localdomain> <1125080213.5549.100.camel@localhost.localdomain> <4310BF35.3060603@suse.com> <200508272345.09417.chrivers@iversen-net.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25699-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200508272345.09417.chrivers@iversen-net.dk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christian Iversen <chrivers@iversen-net.dk>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Christian Iversen wrote:
> On Saturday 27 August 2005 21:29, Jeff Mahoney wrote:
>>My dynamic bitmap patch fixes both of the problems you've posed so far.
>>Mount time is reduced to O(1) time, since only the superblock and root
>>node are read at mount time. On my system, it's something along the
>>lines of 0.2s. Memory consumption is reduced also, because the bitmap
>>block is released after the allocation/free that required it is complete.
> 
> I've been reading about this patch with quite some interest. Would you say 
> it's stable enough for daily use? I have a terabyte array that takes forever 
> to mount, and probably uses quite a bit of memory too.

I've done testing with it, and it's been ok. I haven't heard any bug
reports, but I haven't heard any "hey it works" comments either. It
should be pretty stable - the only thing I'm concerned about is how it
deals with I/O errors. That part of the patch will be dependent on my
developing better i/o handling for reiserfs in general. That patch is
also mostly done, but needs more testing.

- -Jeff

- --
Jeff Mahoney
SuSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQFDEySgLPWxlyuTD7IRAoMXAJ9IozJtv2236HK1R/4bMMaK8/mrIACeMYUu
tz7nPOMFTIY2dJ/j9DXjMG0=
=lGWE
-----END PGP SIGNATURE-----
