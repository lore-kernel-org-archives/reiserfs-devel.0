From: Steve Bergman <steve@rueb.com>
Subject: No reiser4 config options in 2.6.8.1-mm4 make menuconfig?
Date: Tue, 24 Aug 2004 16:39:24 -0500
Message-ID: <1093383564.16361.7.camel@voyager.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20490-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs <reiserfs-list@namesys.com>

I just downloaded kernel 2.6.8.1 and applied the mm4 patch.  I do have a
fs/reiser4 directory.  Unfortunately, I see no reiser4 options in make
menuconfig or make xconfig.  If I set CONFIG_REISER4_FS=m manually, it
has no effect; no reiser4 module gets built. What am I doing wrong?

-Steve Bergman

