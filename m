From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfsprogs release
Date: Wed, 26 Jun 2002 13:17:10 +0400
Message-ID: <200206261317.10813.vitaly@namesys.com>
References: <200206251829.25799.vitaly@namesys.com> <20020625165254.GA30301@matrix.wg>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-10851-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020625165254.GA30301@matrix.wg>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Tuesday 25 June 2002 20:52, Dirk Mueller wrote:
> On Die, 25 Jun 2002, Vitaly Fertman wrote:
> > that reiserfsprogs-3.x.1c-pre6 which you can find on our ftp
> > site seems to be stable and they are going to become a new
> > release within next few days. We encourge you to test it and
> > to report about any possible problem.
>
> changelog ?

The most of changes are just bug fixes and speedups.
    StatData got wrong values sometimes.
    Tails were not converted back if had been converted to internal.
    Lost+found was not accessible sometimes due to wrong flag in 
    metadata.
    Extra checks on --check and fixes on --fix-fixable were added 
    for wrong st_nlinks, some info in internal tree.
    Some multiple checks during overwriting and relocation were 
    eliminated.
    Etc.

Added different block size support - 1k, 2k and for Alpha 8k. 
We are going to include the kernel patch after 2.4.19.

Support for bad block lists was added also but disabled for now 
due to some conflicts with the current kernel, which have not been 
solved yet.

-- 

Thanks,
Vitaly Fertman
