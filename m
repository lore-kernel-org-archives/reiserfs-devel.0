From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser fs slow on mksf and mount
Date: Mon, 29 Aug 2005 12:53:40 -0700
Message-ID: <431367C4.8030502@namesys.com>
References: <1125074717.5549.44.camel@localhost.localdomain>	 <430F4B91.7030909@namesys.com>	 <1125076138.5549.65.camel@localhost.localdomain>	 <1125076558.5549.72.camel@localhost.localdomain>	 <430F5226.50701@namesys.com> <1125080213.5549.100.camel@localhost.localdomain> <4310BF35.3060603@suse.com> <43136493.40405@namesys.com> <431365AA.8060709@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25710-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <431365AA.8060709@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: mingz@ele.uri.edu, "Vladimir V. Saveliev" <vs@namesys.com>, reiserfs-list@namesys.com, Nate Diller <ndiller@namesys.com>

Jeff Mahoney wrote:

> Hans Reiser wrote:
>
> >Did you ever look into my question about device congestion, and whether
> >raising that limit would fix the bitmap loading time issue?
>
>
> I haven't really had the time recently. I'll look into it, but it
> doesn't change the fact that we're wasting RAM on huge filesystems.
>
> -Jeff
>
> --
> Jeff Mahoney
> SuSE Labs

Do you understand the argument, namely that it does not do any good to
have N spindles if the device congestion limit prevents them from going
in parallel?

An easy way to test this would be to see if striped devices mount faster
than concatenated ones.  If yes, then there is crap io scheduler and/or
raid device driver code to fix, and it matters more than the original
issue at question.


