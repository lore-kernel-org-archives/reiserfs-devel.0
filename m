From: Sebastian Kaps <seb-reiserfs.0462a0@toyland.sauerland.de>
Subject: Data corrupted after crash
Date: Thu, 25 Jul 2002 19:54:24 +0200
Message-ID: <m34renr8vj.fsf@toyland.sauerland.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11078-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi!

I'm running Linux 2.4.18 with ReiserFS and no additional patches
applied.
Some minutes ago my machine was shut off due to a power failure. After
rebooting I've noticed that at least one file was corrupted.
I had gnus, opera and some other apps running before the crash and now
my opera bookmarks file "~/.opera/opera6.adr" looks like a mixture of
~/.newsrc.eld (used by gnus), the original bookmarks file and some other
stuff what seems to be Opera's history data.

Isn't journalling supposed to prevent such things?

"dmesg|grep -i reiser" after the reboot says:
,----
| reiserfs: checking transaction log (device 21:03) ...
| reiserfs: replayed 38 transactions in 2 seconds
| ReiserFS version 3.6.25
`----
-- 
Ciao, Sebastian

* HP:    http://www.sauerland.de/~toyland/          PGP-Key available
