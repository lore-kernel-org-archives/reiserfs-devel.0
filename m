From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfsprogs 3.6.5-pre2 release.
Date: Tue, 25 Feb 2003 17:12:45 +0300
Message-ID: <200302251712.45985.vitaly@namesys.com>
References: <200302251650.22469.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-12911-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200302251650.22469.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Tuesday 25 February 2003 16:50, Vitaly Fertman wrote:
> Hi all!
>
> - a critical bug on pass0 of rebuild-tree with overflowing while checking
> unformatted item offsets was fixed.
>
> - reiserfsck -a (started at boot) replays journal, checks error flags in
> the superblock, bitmaps, fs size, 2 levels of internal tree and switches
> to fixble mode if any problem is detected. For root fs fixable cannot be
> performed (as fs is mounted) and just --check will be done.

As the pre release has one critical bug fixed and we would like to make it
a new release as soon as possible, any test of how rebuild-tree works on
filesystems with big files is appreciated.

Also, it would be interesting to know how much time does reiserfsck -a take
on big arrays. So if you have a such, try it also please. I mean, on consistent
filsystems, otherwise reiserfsck will switch to the fix-fixable mode.

-- 

Thanks,
Vitaly Fertman
