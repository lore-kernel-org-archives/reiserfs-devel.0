From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: Reiserfs on DVD-RAM
Date: Wed, 24 Mar 2004 17:24:12 +0300
Message-ID: <1080138252.1977.244.camel@tribesman.namesys.com>
References: <pan.2004.03.24.00.29.32.974180@spamfilter.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17429-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <pan.2004.03.24.00.29.32.974180@spamfilter.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Fionn Behrens <fionn@spamfilter.de>
Cc: reiserfs-list@namesys.com

Hello

On Wed, 2004-03-24 at 03:29, Fionn Behrens wrote:
> I'd like to use Reiserfs on DVD RAM Media for backups, because of the
> rather big block size of the media and the space efficiency that Reiserfs
> is known for. On the other hand I realize that journalling on a phase
> change disc is probably a good way to wear the disc a lot faster than
> usual.
> 
> So I am looking for an efficient way to keep the journals off-disk. I dont
> presume journalling can be switched off completely for reiserfs? But would
> it be possible to share a single external journal partition among several
> media of the same size as long as the journal is always properly replayed
> and/or the disc correctly unmounted?
> 

I guess that would be possible. Reiserfs in 2.6 is supposed to be able
to deal with non-standard journals. mkreiserfs has an option (-j) which
allows to specify separate device for the journal.
tunereiserfs is supposed to be able to setup new journal for a
filesystem.
So, assuming you have /dev/backup1, /dev/backup2 and /dev/journal you
should be able to do something like:
mkreiserfs /dev/backup1 -j /dev/journal
mount /dev/backup1
...
umount /dev/backup1
mkreiserfs /dev/backup2 -j /dev/journal
mount /dev/backup2
...
umount /dev/backup2

# set journal for /dev/backup1
reiserfstune /dev/backup1 --no-journal-available -journal-new-device
/dev/journal

...

PS: I have never tried this myself, though


> I appreciate any hints and tips.
> 
> br,
>    Fionn
> 
> 

