From: Sean Plaice <splaice@gmail.com>
Subject: reiserfs errors in dmesg output
Date: Sat, 3 Jul 2004 05:22:58 -0700
Message-ID: <ae9bd76a040703052222e0065f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19495-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello,
My system is running linux 2.4.33 with reiserfs for all of it's files
systems, The system has a PERC-3DC Raid card (uses the aacraid
driver).

The server is a very io intensive mail server.

I have recently noticed some "troubleing" output in the dmesg output.
The server does not appear to be having any operational problems but
the errors are leading me to be quite worried of potential future
problems.

Could someone please help me diagnose what these error messages mean,
and what I should do about them.

Thank you in advance for your answers, take care.

<snip>

sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
1466199 0x0 SD] (nlink == 1) not found (pos 28)
sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
1466199 0x0 SD] (nlink == 1) not found (pos 28)
sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
1466199 0x0 SD] (nlink == 1) not found (pos 28)
sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
1466199 0x0 SD] (nlink == 1) not found (pos 28)
sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
1466199 0x0 SD] (nlink == 1) not found (pos 28)
sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
1466199 0x0 SD] (nlink == 1) not found (pos 28)
sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
1466199 0x0 SD] (nlink == 1) not found (pos 28)
sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
1466199 0x0 SD] (nlink == 1) not found (pos 50)
sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
1466199 0x0 SD] (nlink == 1) not found (pos 50)
sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
1466199 0x0 SD] (nlink == 1) not found (pos 50)
sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
1466199 0x0 SD] (nlink == 1) not found (pos 3)
sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
1466199 0x0 SD] (nlink == 1) not found (pos 3)
sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
1466199 0x0 SD] (nlink == 1) not found (pos 3)
sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
1466199 0x0 SD] (nlink == 1) not found (pos 3)
sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
1466199 0x0 SD] (nlink == 1) not found (pos 3)
sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
1466199 0x0 SD] (nlink == 1) not found (pos 3)
sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
1466199 0x0 SD] (nlink == 1) not found (pos 3)
sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
1466199 0x0 SD] (nlink == 1) not found (pos 3)
sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
1466199 0x0 SD] (nlink == 1) not found (pos 3)
sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
1466199 0x0 SD] (nlink == 1) not found (pos 3)
sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
1466199 0x0 SD] (nlink == 1) not found (pos 3)
sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
1466199 0x0 SD] (nlink == 1) not found (pos 3)
sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
1466199 0x0 SD] (nlink == 1) not found (pos 3)
sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
1466199 0x0 SD] (nlink == 1) not found (pos 3)
sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
1466199 0x0 SD] (nlink == 1) not found (pos 3)

and

sd(8,6):journal-1777: buffer 109798 bad state !PREPARED !LOCKED !DIRTY
 JDIRTY_WAIT
sd(8,6):journal-1777: buffer 185659 bad state !PREPARED !LOCKED !DIRTY
 JDIRTY_WAIT
sd(8,6):journal-1777: buffer 208840 bad state !PREPARED !LOCKED !DIRTY
 JDIRTY_WAIT
sd(8,6):journal-1777: buffer 300870 bad state !PREPARED !LOCKED !DIRTY
 JDIRTY_WAIT

</snip>

-- 
Sean
