From: Joe Feise <jfeise@feise.com>
Subject: Reiser4 cowardly panic 2.6.17-mm5
Date: Sat, 01 Jul 2006 15:41:55 -0700
Message-ID: <44A6FA33.1000305@feise.com>
Reply-To: jfeise@feise.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28887-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I consistently get cowardly panic errors during bootup with 2.6.17-mm5 (I also
had that with -mm3, and had hoped -mm5 would have fixed it.)
It corrupts the partition this is happening on (/var)
I don't have dmesg or syslog output, though, since this happens during bootup,
and /var gets corrupted...

-Joe

