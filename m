From: Genady Okrain <mafteah@gmail.com>
Subject: Cant remove empty dir!
Date: Sat, 31 Jul 2004 18:11:18 +0300
Message-ID: <30a4d01b040731081132a029@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19895-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I have small problem:

# rm -rf DIR/
rm: cannot remove directory `DIR//scripts': Directory not empty

# dmesg |tail
reiser4[rm(15938)]: key_warning (fs/reiser4/plugin/object.c:97)[nikita-717]:
WARNING: Error for inode 5144273 (-2)

# ls DIR/scripts/
ls: DIR/scripts/kernel-doc: No such file or directory

I tried all the new snapshots but the same problem.
-- 
Genady Okrain AKA Mafteah
