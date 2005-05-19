From: Martin Piayda <martin.piayda@udo.edu>
Subject: Reiser4 O_DIRECT
Date: Thu, 19 May 2005 19:53:12 +0200
Message-ID: <1116525192.29446.5.camel@zion>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24086-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,
I'm missing O_DIRECT support in the current Reiser4 implementation (up
to Kernel 2.6.12-rc4-mm).
Calling sys_open(myfile, O_RDWR | O_DIRECT, 0) fails with -22.

Is this support planned, did I miss something, should I get my own
patches? ReiserFS seems to work with O_DIRECT, but not Reiser4, so I
wondered why not.

Regards,
Martin

