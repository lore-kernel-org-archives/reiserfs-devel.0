From: Zygo Blaxell <eazgwmir@umail.furryterror.org>
Subject: Re: reiserfsck 3.6.8 + corrupted filesystem
Date: Wed, 02 Jul 2003 19:12:11 -0400
Message-ID: <pan.2003.07.02.19.12.09.969889.20132@umail.hungrycats.org>
References: <pan.2003.07.02.13.31.41.846811.20132@umail.hungrycats.org> <pan.2003.07.02.13.31.41.846811.20132@umail.hungrycats.org> <200307022231.36007.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-14813-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Wed, 02 Jul 2003 14:31:36 -0400, Vitaly Fertman wrote:
> fsck should not abort if in memory data on pass1 (which were built on
> pass0 of fsck) match what they should be. Otherwise it looks like
> hardware problem with memory or smth like that.

OK, that clears things up a bit.

Basically something in the output of pass 0 is different from what is
expected based on in-RAM data in pass 1.  The diagnostic message could be
(much!) clearer about that, rather than just guessing that I must have "bad
memory."

In a nutshell, either the system RAM is bad, or the disks are mangling
data without returning errors, or reiserfsck has a bug that causes it to
expect to find that it has previously written something that it hasn't.

I'll exercise RAM and disks over the next N days to try to eliminate
hardware as a possible cause.
