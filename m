From: Ric Wheeler <ric@emc.com>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Tue, 20 Sep 2005 20:27:30 -0400
Message-ID: <4330A8F2.7010903@emc.com>
References: <200509182004.j8IK4JNx012764@inti.inf.utfsm.cl> <432E5024.20709@namesys.com> <20050920075133.GB4074@elf.ucw.cz> <20050921000425.GF6179@thunk.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1750822AbVIUAdj@vger.kernel.org>
In-Reply-To: <20050921000425.GF6179@thunk.org>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Theodore Ts'o <tytso@mit.edu>
Cc: Pavel Machek <pavel@suse.cz>, Hans Reiser <reiser@namesys.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, thenewme91@gmail.com, Christoph Hellwig <hch@infradead.org>, Denis Vlasenko <vda@ilport.com.ua>, chriswhite@gentoo.org, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Theodore Ts'o wrote:

> 
> Another interesting refinement would be to analyze the resulting
> filesystem after it has been repaired to determine how much data could
> be salvaged by the fsck program.   

We use reiserfs3 to store data and have had very good luck in getting 
data off of real world, hard disk failures.  In our case, we have a 
digital signature which is used to compare validate the content of the 
files after recovery so we have an extra comfort level with the results 
of a repaired file system...

Working on getting fsck to run reliably and quickly on large file 
systems (any type of file system) is certainly a big item on our wish 
list.  With relatively small file system (320GB) we can spend hours 
trying to recover.

> 
> There is a very interesting paper that I coincidentally just came
> across today that talks about making filesystems robust against
> various different forms of failures of modern disk systems.  It is
> going to be presented at the upcoming 2005 SOSP conference.
> 
> 	http://www.cs.wisc.edu/adsl/Publications/iron-sosp05.pdf
> 
> It's definitely worth a read.  A few comments about it; first of all,
> I know nothing about this modified "iron ext3" (ixt3) discussed in the
> paper aside from what's the paper itself.  It would be interesting to
> see what they have done with it.  Secondly, I _think_ sct has already
> fixed the problems discussed in the paper with respect to inadequate
> write squelching after an I/O failure writing to the ext3 journal, but
> we need to chat with the paper's authors to confirm that, and if there
> still is a problem, obviously we need to fix it.  Third of all, I'll
> note that the paper does takes an approving note of the fact that
> Reiserfs (v3) always panic's when it detects a write fault, so for
> those folks in the Reiser team who might have a persecution complex,
> relax, the whole world isn't out to get you.  :-)
> 
> 						- Ted

We have been sponsors of this work at Wisconsin - a good group with 
interesting results.

As an earlier thread on lkml showed this summer, we still have a long 
way to go to getting consistent error semantics in face of media 
failures between the various file systems.  I am not sure that we even 
have consensus on what that default behavior should be between 
developers, so image how difficult life is for application writers who 
want to try to ride through or write automated "HA" recovery scripts for 
systems with large numbers of occasionally flaky IO devices ;-)

Ric



