From: "Ronny T. Lampert" <telecaadmin@uni.de>
Subject: reiserfsck failing with external journal
Date: Thu, 30 Sep 2004 15:49:32 +0200
Message-ID: <415C0EEC.30906@uni.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21971-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi,

I've made a fs with the newest reiserfs-progs.

#> mkreiserfs -j /dev/hda5 /dev/hda6

Mounting is fine.
But reiserfsck fails every time with:

-o-o-

###########
reiserfsck --check started at Thu Sep 30 15:42:47 2004
###########

reiserfs_open_journal: journal parameters from the super block does not match
to journal parameters from the journal. You should run  reiserfsck with 
--rebuild-sb to check your superblock consistency.

-o-o-

If I do as adviced (reiserfsck --rebuild-sb), it says the superblock is fine.
Next time it fails with the same message.

Only supplying -j /dev/hda5 to every reiserfs-prog will help :(
Doing an

#> reiserfstune --new-journal-dev /dev/hda5

doesn't cure it, too.

I think, that is not as it's supposed to work because it'll _break all system 
boot-up scripts_ !

Is it some subtle bug in the reiserfs-progs, because they try to extract the 
journal_dev from the SB (as a quick look at the source reveals) but don't use 
it properly?

Kind regards,
Ronny
