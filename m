From: jlewis@lewis.org
Subject: Re: reiserfs rebuild-tree time?
Date: Thu, 11 Mar 2004 20:57:49 -0500 (EST)
Message-ID: <Pine.LNX.4.58.0403112055570.1969@web1.mmaero.com>
References: <Pine.LNX.4.58.0403110111490.1969@web1.mmaero.com>
 <20040311071850.GB13119@dbz.icequake.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17185-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040311071850.GB13119@dbz.icequake.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ryan Underwood <nemesis-lists@icequake.net>
Cc: reiserfs-list@namesys.com

On Thu, 11 Mar 2004, Ryan Underwood wrote:

> Maybe it's time to test the HDD?  A quick run through with the
> manufacturer's util will at least rule out failing hardware before going
> further.

I kind of doubt that's it.  The Adaptec i2o cards are somewhat finicky,
but if the drives even look back at the card funny, it'll declare them
dead, sound the alarm that annoys people in the offices nearby, and
degrade the array.  That isn't happening right now.

----------------------------------------------------------------------
 Jon Lewis *jlewis@lewis.org*|  I route
 Senior Network Engineer     |  therefore you are
 Atlantic Net                |
_________ http://www.lewis.org/~jlewis/pgp for PGP public key_________
