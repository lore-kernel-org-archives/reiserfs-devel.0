From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Yet another oops with reiser4...
Date: Tue, 10 Feb 2004 13:26:30 +0300
Message-ID: <200402101326.30810.vitaly@namesys.com>
References: <4021964D.3030707@free.fr> <200402061800.08136.vitaly@namesys.com> <4027F5B0.70300@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16743-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4027F5B0.70300@free.fr>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vince <fuzzy77@free.fr>
Cc: reiserfs-list@namesys.com

On Tuesday 10 February 2004 00:03, Vince wrote:
> Vitaly Fertman wrote:
> > Hello Vince,
> >
> > would you try the fsck from the latest reiser4progs snapshot:
> > http://www.namesys.com/snapshots/2004.02.06/
>
> Well I tried the new reiser4progs and the fsck did finish... but I was
> unfortunately running a kernel with the 2004.01.19-fixed snapshot and it
> looks like it was a bad idea (?). I enclose the fsck log in attachment
> in case it could help.
>
> Then I could mount my partition but any access failed with I/O Error. :-(
>
> Then I booted my new kernel... now mounting the partition is also ok but
> the partition looks empty... except that df reports that my files are
> still there:
>
> /dev/ide/host0/bus1/target0/lun0/part3
>                        86757988  21631724  65126264  25% /mnt/goinfre
>
> Now, fsck -build-fs with this kernel (new snapshot) fails with:

> ***** Semantic Traverse Pass: reiser4 semantic tree checking.
> Error: Semantic pass failed: cannot create 'lost+found' directory.
>
> Now the question is: is it still possible to recover my data on this
> partition ?

would you run 
	debugfs.reiser4 -P /dev/xxx | bzip2 -c > xxx.bz2
and provide it for downloading? I will try to fix it locally.

-- 
Thanks,
Vitaly Fertman
