From: David Bernick <bernz@alpha.bernztech.org>
Subject: Re: slow stat() ?
Date: Tue, 2 Dec 2003 06:57:20 -0500 (EST)
Message-ID: <Pine.LNX.4.10.10312020656030.21222-100000@alpha.bernztech.org>
References: <1070299845.12809.98.camel@tiny.suse.com>
Reply-To: bernz@bernztech.org
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16201-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1070299845.12809.98.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list@namesys.com

> My guess is the stats are being done across a large directory tree and
> this is generating lots of atime updates.  You could mount -o
> noatime,nodiratime, which will reduce the amount of work reiserfs does
> on each stat.

so far so good!

The program (a series of very large finds across large directory
structures) usually spikes the load to 5 or 6 because of all the times
kupdated and kjournald are being accessed during stat() operations. It's
been running for a few hours and the load has barely to hit 1. 

I'll keep you all informed but this looks like it helped a great deal.
thanks a bunch!

d

