From: Oleg Drokin <green@namesys.com>
Subject: Re: [BK] ReiserFS file write bug fix for 2.4
Date: Fri, 13 Sep 2002 09:05:40 +0400
Message-ID: <20020913090540.A4723@namesys.com>
References: <5.1.1.6.2.20020912183504.01d24f60@pop.tvnet.hu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11437-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <5.1.1.6.2.20020912183504.01d24f60@pop.tvnet.hu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Newsmail <newsmail@satimex.tvnet.hu>
Cc: reiserfs-list@namesys.com

Hello!

On Thu, Sep 12, 2002 at 06:40:10PM +0100, Newsmail wrote:
> > The mount option (-o alloc=prealloc min=4:preallocsize=9) only or better
> > a "reformat"?
> > Those mount options are no longer needed starting from 2.4.20-pre6.
> > They are default. Reformat is not needed, but all the blocks allocated by
> > old allocator will remain at their old places of course.
> I use 2.4.20-pre4 without these mount options. So apparently reiserfs is 
> much slower than the optimal am I right? (if my memory is good this is 
> about some speed optimization right?).

It depends on kind of workloads you have. But in general - yes, it is somewhat
slower and if you have massive parallel writers, on-disk blocks layout is
suboptimal.
You should use above mount options (alloc=preallocmin=4:preallocsize=9)
or upgrade to 2.4.19-pre7 (of that's not our yet, then to whatever is the
current state of Marcelo's bk repository is ).

Bye,
    Oleg
