From: Chris Mason <mason@suse.com>
Subject: Re: Benchmark : ext3 vs reiser4 and effects of fragmentation.
Date: Thu, 16 Sep 2004 15:05:25 -0400
Message-ID: <1095361525.28057.60.camel@watt.suse.com>
References: <4148BC0E.5010509@willsmith.org>
	 <20040916085248.GI5137@backtop.namesys.com>
	 <20040916130809.GI26192@nysv.org>
	 <20040916153835.GK5137@backtop.namesys.com>
	 <20040916155248.GM26192@nysv.org>
	 <20040916183831.GL5137@backtop.namesys.com>
	 <20040916190019.GN26192@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21827-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040916190019.GN26192@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Markus TXrnqvist <mjt@nysv.org>
Cc: Alex Zarochentsev <zam@namesys.com>, Will Smith <will@willsmith.org>, reiserfs-list@namesys.com

On Thu, 2004-09-16 at 15:00, Markus TXrnqvist wrote:
> On Thu, Sep 16, 2004 at 10:38:31PM +0400, Alex Zarochentsev wrote:
> >
> >on-line defragmenter requires its part to be in kernel space. at least node
> >locks cannot be exported _safely_ to the user space, I think.
> 
> What if it was like 
> echo -n "Killer Algo by Zam" > /sys/fs/reiser4/hda1/repacker/algorithm
> or something to get rid of the risk of having two really separate
> mechanisms, and if it can't be in userspace either way...
> 
> This is also probably related to what Nik said back in the days about
> an online-fsck being impossible :)

It seems sensible to break up the algorithm somewhat between kernel and
userland.  The problem is just in finding units of work for the userland
code to advise on.  For files this is easy, for metadata and tree
indexes it is somewhat harder.

-chris


