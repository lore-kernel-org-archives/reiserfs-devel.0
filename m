From: "Bostjan Skufca @ domenca.com" <bostjan.skufca@domenca.com>
Subject: Quota patches will not do against 2.4.25
Date: Wed, 18 Feb 2004 23:16:49 +0100
Message-ID: <1077142609.4033e4519f02c@www.domenca.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-16843-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Command and results:

# gunzip -c ../linux-patches-2.4.23/reiserfs/06-kinoded-9.diff.gz | patch -p1
patching file fs/inode.c
Hunk #1 succeeded at 503 (offset 32 lines).
Hunk #3 succeeded at 787 (offset 33 lines).
Hunk #4 FAILED at 821.
Hunk #5 succeeded at 1252 (offset 59 lines).
Hunk #6 succeeded at 1306 (offset 33 lines).
Hunk #7 succeeded at 1441 (offset 64 lines).
1 out of 7 hunks FAILED -- saving rejects to file fs/inode.c.rej


Best regards,

Bostjan Skufca
system administrator

Domenca d.o.o.
Phone: +386 4 5835444
Fax: +386 4 5831999
http://www.domenca.com





------------------------------
http://webmail.domenca.com
------------------------------

