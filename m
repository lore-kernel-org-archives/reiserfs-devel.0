From: Oleg Drokin <green@namesys.com>
Subject: Re: attrib +A doesn't work
Date: Mon, 9 Sep 2002 14:37:15 +0400
Message-ID: <20020909143715.A1014@namesys.com>
References: <20020905034320.GA11951@yzero> <15735.10894.167461.158961@laputa.namesys.com> <20020905140132.A19752@namesys.com> <20020908003526.GA19852@thibs.menloschool.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11407-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20020908003526.GA19852@thibs.menloschool.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Allen H. Ibara" <aibara@ucsd.edu>
Cc: reiserfs-list@namesys.com

Hello!

On Sat, Sep 07, 2002 at 05:35:26PM -0700, Allen H. Ibara wrote:
> > mount -o attrs in fact.
> I'm not sure if this is the right place to report this...

Sure it is.

> The 'attrs' mount option is broken with kernels 2.4.20-pre2 through -pre5 (the
> latest as of this email).
> See "license cleanup" patch found here:
> ftp://ftp.namesys.com/pub/reiserfs-for-2.4/2.4.19.pending/01-license_cleanup.diff
> It contains a re-work of reiserfs_parse_options() in super.c that removes
> the 'attrs' option. Perhaps a merge error or simple omission.

Thanks a lot for letting us know.
Somehow this omission got past our testing.

Bye,
    Oleg
