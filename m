From: Christian Kujau <evil@g-house.de>
Subject: Re: vpf-10680, minor corruptions -- oooh!
Date: Thu, 19 Jun 2003 20:55:36 +0200
Message-ID: <3EF20728.2080905@g-house.de>
References: <3EF07AFB.8060303@g-house.de> <20030618152626.GA17240@namesys.com> <3EF0A8E8.2000209@g-house.de> <20030619054535.GA23852@namesys.com>
Reply-To: evil@g-house.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14634-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030619054535.GA23852@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS List <reiserfs-list@namesys.com>

Oleg Drokin schrieb:
> Well, normally reiserfs is caring about consistency.
> There are two noticeable omissions, though:
> 1. if the unexpected shutdown was because of power loss and you have write cache enabled
>    and your write reorders write requests, then it is possible invalid data gets
>    written to disk, before "transaction is finished" mark is written to the drive.

yes, the on-disk write cache. this could be indeed a problem hard to
cover from any fs. i could disable it, yes.

> So can you say check/fix the fs, mount it write some files to it,
> unmount it and run fsck again to see if everything is ok?

oh, oh! i was about to answer this question with a plain "Yes". ok, with
--fix-fixable the corruptions got fixed, a reiserfsck went O.K. with "no
corruptions". i mounted the device yesterday, but no files were written
to it until today. now, i've just unmounted the partition, reiserfsck
went O.K. again, no corruptions. mounted again, i created a directory on
the fs and copied 329 files into it (cp -a /lib /path-to-reiser-fs/).

unmounted, reiserfsck found 131 corruptions in an instant:


lila:~# reiserfsck /dev/sde2
<--------reiserfsck 3.6.6, 2003-------->

[...]

Do you want to run this program?[N/Yes] (note need to type Yes if you
do):Yes
###########
reiserfsck --check started at Thu Jun 19 16:51:49 2003
###########
Replaying journal..
0 transactions replayed
Checking internal tree..finished
Comparing bitmaps..vpf-10640: The on-disk and the correct bitmaps differs.
Checking Semantic tree:
/temp/lib/libnss_files-2.3.1.sovpf-10680: The file [3214 3538] has the
wrong block count in the StatData (104), should be (56)

[...]

finished

131 found corruptions can be fixed with --fix-fixable
###########
reiserfsck finished at Thu Jun 19 16:52:04 2003
###########
lila:~# find /lib/ | wc -l
     329
lila:~#


the pathnames (/temp/lib/...) are the same files i just copied to the
fs. i was not aware of a reproduceable bug (?) at all on this issue.

the fs is used once in a week very often, but rarely _during_ week. this
could be the cause, that i never recognized the errors before or were
fixed by a journal replay at boot time.

fyi only: i have _one_ weird issue with this alpha: it has 128 MB RAM
inside, but only 64 MB are recognized. putting 64 MB into it gives 32
MB, but 32 MB is still 32MB. this is odd, but kernel compiling / heavy
load causes no ooopses, well i got some with 2.5.6x kernels, but this is
long ago. and: the hd is a little old, it's a ST34573N (SCSI, 2 GB). but
there are no odd kernel messages or failures in the log.  i say this,
because often "bad RAM" or other issues are often on-topic here.


Thank you,
Christian.

PS: sorry for the delay. mail probs.

