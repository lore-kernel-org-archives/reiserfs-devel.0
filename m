From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Subject: journal-2018 trouble?
Date: Mon, 24 Mar 2003 22:55:48 -0300
Message-ID: <200303242255.48998.gustavo@zacarias.com.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13363-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


Hi.
I'm getting loads of journal-2018 kernel messages when mounting a reiser 
filesystem from a lvm block device.

---snip---
Mar 24 22:22:30 anubis kernel: reiserfs: checking transaction log (device 
3a:00) ...
Mar 24 22:22:30 anubis kernel: journal-2018: Bad transaction length 7 
encountered, ignoring transaction
---

Of course they vary in transaction length.

---reiserfsck 3.6.5 snip---
reiserfs_open_journal: journal parameters from super block does not match to
journal parameters from journal.

Either make journal partition available or use --no-journal-available
If you have the standard journal or if your partition is available
and you specified it correctly, you must run rebuild-sb.
---

This is a 2.4.20 kernel with 2.4.20-pending patches, namely
01-iput-deadlock-fix
02-directio-fix
03-journal-overflow-fix
04-trivial1
05-more-mount-checks

Information is just fine, everything works, i'm just a little worried about 
the warnings. The machine has been (obviously) shut down uncleanly some 
times.
Would a rebuild-sb be safe?
Thanks in advance.

