From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: Reiserfs fails on read only media
Date: Mon, 18 Apr 2005 16:45:50 +0400
Message-ID: <1113828349.3975.187.camel@tribesman.namesys.com>
References: <20050417113427.6d17e413.a.nielsen@shikadi.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23894-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050417113427.6d17e413.a.nielsen@shikadi.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Adam Nielsen <a.nielsen@shikadi.net>
Cc: reiserfs-list@namesys.com

Hello

On Sun, 2005-04-17 at 05:34, Adam Nielsen wrote:
> Hi all,
> 
> As a quick method of backing up an old hard drive, I tried to dump the
> raw disk image onto a DVD-R, thinking I'd be able to mount the DVD as a
> normal reiserfs image.
> 
> This almost works, however since the disc is readonly the mount fails
> because reiserfs is unable to write to the log:
> 
> ReiserFS: hdc: warning: sh-458: journal_init_dev: cannot init journal device 'unknown-block(22,0)': -30
> ReiserFS: hdc: warning: sh-462: unable to initialize jornal device
> ReiserFS: hdc: warning: sh-2022: reiserfs_fill_super: unable to initialize journal space
> 
> I tried using the "nolog" option but it still wants to write to the log.
> Is this the correct behaviour? 

yes, it is known "feature", which should be fixed,

for now,
you have to create on cd reiserfs with non-standard journal

something like:

# make a filesystem with non-standard journal: 
# use /dev/journal, journal size 8192
mkreiserfs fs-image -j /dev/journal -s 8192

# fill fs-image with backupdata
# burn cd with fs-image

# IMPORTANT: save journal header in file "journal-header"
dd if=/dev/journal of=journal-header bs=4096 count=1 skip=8191

# backup is done, do not lose "journal-header"

...

# you want to mount backup cd

# make /dev/journal to look like a journal of reiserfs on backup cd
dd if=journal-header of=/dev/journal bs=4096 count=1 seek=8191

# the below should work now, note that /dev/journal is to be writeable
mount /dev/cdrom /mnt -o ro


>  Shouldn't it completely ignore the log
> if you use the "nolog" option?
> 
nolog is "noop" option currently.
I do not remember now what this nolog was used for.



> Cheers,
> Adam.
> 

