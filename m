From: "Pawel Jagoda" <blue@bluenet.waw.pl>
Subject: Files > 2GB and 3.6 version (after converting from 3.5)
Date: Sat, 16 Sep 2006 14:25:02 +0200 (CEST)
Message-ID: <1156.192.168.0.1.1158409502.squirrel@www.bluenet.waw.pl>
Reply-To: pjagoda@bluenet.waw.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-29909-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello.

I've backup my data - one file, which have 4060 MB. Unfortunetly I didn't
point out that my destination file system is in old 3.5.x version. And of
course I cannot read my data after 2GB (it says: Input/Output Error). I
have converted my filesystem into 3.6.x, but still I'm not able to read
this file. But if I create new file (for example: dd if=/dev/zero
of=/mnt/hda3/some_file bs=1M count=3000), there is no problem to read it.
Is it possible, to do something to restore my backup from this file? If
yes, then how can I do it?


Paul.

