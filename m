From: Lorenzo Allegrucci <l.allegrucci@tiscali.it>
Subject: Re: [OOPS] Linux-2.4.20-pre4 with reiserfs
Date: Wed, 12 Mar 2003 11:41:38 +0000
Message-ID: <200303121141.38414.l.allegrucci@tiscali.it>
References: <200303112216.12359.l.allegrucci@tiscali.it> <20030312104642.B9291@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13215-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030312104642.B9291@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

On Wednesday 12 March 2003 07:46, Oleg Drokin wrote:
> Hello!
>
> On Tue, Mar 11, 2003 at 10:16:12PM +0000, Lorenzo Allegrucci wrote:
> > `fsx-linux -c 2 linux-2.4.20.tar.bz2' on a console and
> > `fsstress -d -d -n 10000 -p 10' on a second console.
> > The oops happened just few seconds after I run `vmstat 1'
> > on third console.  Reproducible.
>
> Ah, looks like known direct io problem.
> There was a directio fix in 2.4.21-pre5, but
> some later IBM guys made us aware of another directio problem,
> see the patch below (should help for you).
> Please try 2.4.21-pre5 + this patch and if it still does not work, please
> tell us. Thank you. (note that this patch was not passed through our full
> patch verification process yet, but it works for me and for Chris Mason
> (whose code is most part of the patch)).

[snip patch]

It works for me, I could not reproduce the oops.
Thank you.

