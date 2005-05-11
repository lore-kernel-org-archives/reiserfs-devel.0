From: maherrero@arsystel.com
Subject: Reiserfsck fails. Out of disk space on pass 2
Date: Wed, 11 May 2005 12:02:01 +0200 (CEST)
Message-ID: <10784.217.76.138.66.1115805721.squirrel@mail.arsystel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-24038-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello guys!
I wonder if you can help me.
A couple of days ago my system failed: a big-big-BIG kernel dump on the
screen and system hang, so I rebooted. The first time my debian couldn't
start x.org because there was not enough free space "Uh?, Okay, let's
check the partition" So I rebooted again and started a second installation
I have in a different partition for these situations.
I logged in and started normally, checked my original root partition (on
/dev/hda3) and at pass 2 it aborted

Not enough allocable blocks, checking bitmap...there are 0 allocable
blocks , btw

out of disk space

After that it is impossible to recover the partition. Obviously I cannot
mount it either. I have repeated it several times and always the same
fail.
I have tried giving this partition more space but no success. Gparted
doesn't work and reports 2.00 Tb of data in a 19 Gb partition!
Any idea of what am I doing wrong (because I suppose that this problem can
be solved but I don't know how)
I have googled but no similar incident has been reported.

Thank in advance


M. A. Herrero.

