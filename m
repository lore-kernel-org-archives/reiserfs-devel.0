From: Laurenz Brein <brein@culturall.com>
Subject: cannot mount reiserfs with nonstandard journal size
Date: Tue, 9 Sep 2003 13:13:01 +0200
Message-ID: <20030909111301.GA3688@WS-VPK-054>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15606-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

I'm using reiserfsprogs 3.6.11 on a Slackware 9.0 machine with Kernel 2.4.20
which I patched with the patches from /pub/reiserfs-for-2.4/2.4.20-pending

When I
   mkreiserfs /dev/sdb1
(standard journal size), I can mount the file system with
  mount -t reiserfs /dev/sdb1 /back
without problems.

If, however, I create it with
  mkreiserfs -s 1025 /dev/sdb1
or any other journal size, the same mount will fail with
  mount: wrong fs type, bad option, bad superblock on /dev/sdb1,
         or too many mounted file systems

Checking the file system with
  reiserfsck /dev/sdb1
fails with the message
  Failed to open the journal device ((null)).
The check works fine if I either add the --no-journal-available or the
-j /dev/sdb1 option.

My questions:
- Is this behaviour correct?
- Is there a way (mount option?) to mount reiserfs with non-standard
  journal sizes?

Thanks,
Laurenz Brein
