From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfsck failing with external journal
Date: Fri, 1 Oct 2004 19:18:00 +0400
Message-ID: <200410011918.01278.vitaly@namesys.com>
References: <415C0EEC.30906@uni.de> <415C1D99.9050005@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21981-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <415C1D99.9050005@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward@namesys.com>, "Ronny T. Lampert" <telecaadmin@uni.de>
Cc: reiserfs-list@namesys.com

On Thursday 30 September 2004 18:52, Edward Shishkin wrote:
> Ronny T. Lampert wrote:
> > Hi,
> >
> > I've made a fs with the newest reiserfs-progs.
> >
> > #> mkreiserfs -j /dev/hda5 /dev/hda6
> >
> > Mounting is fine.
> > But reiserfsck fails every time with:
> >
> > -o-o-
> >
> > ###########
> > reiserfsck --check started at Thu Sep 30 15:42:47 2004
> > ###########
> >
> > reiserfs_open_journal: journal parameters from the super block does
> > not match
> > to journal parameters from the journal. You should run  reiserfsck
> > with --rebuild-sb to check your superblock consistency.
>
> Hello.
> It is essential to specify right journal device for fsck, although I am
> not sure  if this warning is correct. As I remember, fsck should ask for a
> correct journal device or suggest to use the option --no-journal-available 
> (then you'll be invited to assign new journal device by reiserfstune). Vitaly?..

yes, these messages should be corrected.

> > -o-o-
> >
> > If I do as adviced (reiserfsck --rebuild-sb), it says the superblock
> > is fine.
> > Next time it fails with the same message.
> >
> > Only supplying -j /dev/hda5 to every reiserfs-prog will help :(
> > Doing an
> >
> > #> reiserfstune --new-journal-dev /dev/hda5
> >
> > doesn't cure it, too.
> >
> > I think, that is not as it's supposed to work because it'll _break all
> > system boot-up scripts_ !
>
> Let's first take a look at the scripts that will be broken ;)
> Edward.
>
> > Is it some subtle bug in the reiserfs-progs, because they try to
> > extract the journal_dev from the SB (as a quick look at the source
> > reveals) but don't use it properly?

Edward is right that currently relocated journal needs to be specified 
explicitly for reiserfsck. would be not bad to not require this though.

-- 
Thanks,
Vitaly Fertman

