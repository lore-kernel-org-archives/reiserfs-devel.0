From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: Reiser4 status as of this weekend
Date: Thu, 20 May 2004 13:39:30 +0400
Message-ID: <1085045969.1431.141.camel@tribesman.namesys.com>
References: <003a01c4377d$d653eac0$7d02a8c0@toronto.chantrynetworks.com>
	 <40A68F75.2030306@namesys.com> <20040515221017.GL1232@nysv.org>
	 <40A7A553.2020901@namesys.com>  <20040519195056.GM24604@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-18780-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040519195056.GM24604@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Markus =?koi8-r?Q?T=F6rnqvist?= <mjt@nysv.org>
Cc: Hans Reiser <reiser@namesys.com>, Russell Treleaven <rtreleaven@chantrynetworks.com>, ReiserFS List <reiserfs-list@namesys.com>

Hello

On Wed, 2004-05-19 at 23:50, Markus TЖrnqvist wrote:
> On Sun, May 16, 2004 at 10:30:59AM -0700, Hans Reiser wrote:
> >Markus Törnqvist wrote:
> 
> [mmap]
> >>>substantial work to do right, and is in progress.  We currently have a 
> >>>fix that costs performance, and are fixing the performance issue (which 
> >>>is fixable but requires code....).
> >>Would you say this is the biggest issue?
> >It is the only issue that I know of.
> 
> How about Copy-on-capture? Is it usable? Does it provide better
> performance?
> 

When we moved to mm kernel it broke. When it was working - it did not
show significant effect in quick tests like bonnie.


> >>What about NFS?
> >fixed by nikita recently but not released.  See next snapshot.
> 
> I'm trying BK pulls. Yesterday it didn't compile, xfs seemed broken.
> Retrying now, after bk -r get.
> 
> I wrote a lame script, haven't used it much myself, but it should do
> something. Like get a BK pull.
> http://mjt.nysv.org/reiser/getreiser.sh
> http://mjt.nysv.org/reiser/getreiser.sh.txt
> 
> >by doing the architectural work....  Also, it requires that 2/3 of the 
> >work (by cost) be done in the US, and the moscow embassy has gone into 
> 
> Have you tried other governments?
> 
> >total asshole mode and isn't giving work visas to most russians.  Still, 
> >we will try to get work visas in 6 months.  I hope that it being for DoD 
> >work will increase the chance of getting visas.
> 
> That must not fail.
> The DoD can't say "please give these guys work visas" just to cover
> their own interests? Or this has no effect?
> 
> >It is in the source code..... we have the best commented source code in 
> >the kernel (Andrew Morton is the only other kernel person who comments 
> >code well that I know of).
> 
> There was also a tangent on the topic of creating daily snapshots.
> 
> This might make it easier for people to come to terms with Reiser4.
> People have many reasons to dislike BK, so a daily snapshot patch
> against some vanilla system may be a good thing.
> 
> However, having broken code in the BK for days without having time to
> fix it is not good.
> 
> So this would require changelogs and some testing on snapshots so that
> every once in a while one can be labeled "stable as hell"

