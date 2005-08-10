From: Tarmo =?ISO-8859-1?Q?T=E4nav?= <tarmo@itech.ee>
Subject: BUG: reiserfs+acl+quota deadlock
Date: Wed, 10 Aug 2005 06:05:11 +0300
Message-ID: <1123643111.27819.23.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25383-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-kernel@vger.kernel.org
Cc: reiserfs-list@namesys.com

Hi,

I've already reported a similiar bug to the one I found now
and that was fixed by:
"[PATCH] reiserfs: fix deadlock in inode creation failure path w/
default ACL"

This bug is similiar in effect but has some differences in how
to trigger it. The end effect will be just like with the other
bug that the affected directory will be unaccessible to any user
or process.

So here's the way to reproduce it, as minimal as I could get it:

You need reiserfs, quota and acl support in kernel.
you also need quota tools (edquota, quotaon, quotacheck), I used
linuxquota 3.12.

# cd /mnt
# dd if=3D/dev/zero of=3Dtest bs=3D1M count=3D50
50+0 records in
50+0 records out
# mkreiserfs -f test >/dev/null
mkreiserfs 3.6.19 (2003 www.namesys.com)

test is not a block special device
Continue (y/n):y
# mkdir mpoint
# mount test mpoint -o loop,acl,usrquota
# mkdir mpoint/user1
# useradd -d /mnt/mpoint/user1 user1     # may also use existing user
# chown user1 mpoint/user1
# quotacheck -v mpoint                   # initializes quota file
# edquota user1
---- set soft block limit to 1000, hard limit to 4000 ----
# edquota -t
---- set the grace periods to something small: 1minutes ---
# quotaon mpoint
# ## at this point "repquota -a" should show the quota for user1
# su user1
# cd
# ## now we are in user1 home dir as user1
# cat /dev/zero > file1
loop2: warning, user block quota exceeded.
loop2: write failed, user block limit reached.
cat: write error: No space left on device
--- now we wait till the grace period expires (repquota -a) ----
# cat "" > otherfile
loop2: write failed, user block quota exceeded too long.
---- and it will hang forever ----
# ## /mnt/mpoint can still be accessed, but /mnt/mpoint/user1 can't


I tested this on an -mm patchset kernel (2.6.13-rc5-mm1), but I
discovered the bug in my server which runs plain 2.6.12 with the
patch from Jeff Mahoney for the first reiserfs+acl bug.

The main difference between the two bugs is that the first one requires
the existance of a default acl, this one does not, but it does require
acl to be enabled.


PS. please CC, I'm not subscribed to the list

--=20
Tarmo T=E4nav <tarmo@itech.ee>

