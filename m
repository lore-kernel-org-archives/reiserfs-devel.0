From: grossnik.mailinglists@hispeed.ch
Subject: Re: Re: reiserfsck (3.6.19) --rebuild-tree failed
Date: Fri, 8 Sep 2006 13:30:51 +0200
Message-ID: <200609081130.k88BUpi3004823@smtp.hispeed.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-29832-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
Sender: Grossniklaus Mailinglists <grossnik.mailinglists@hispeed.ch>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: vs@namesys.com
Cc: reiserfs-list@namesys.com

Hi Vladimir

>ok, all bad blocks are used. Lets try to find what they are used for:
>cat /root/hda3.bad | debugreiserfs -x /dev/hda3

# cat /root/hda3.bad | ./debugreiserfs -x /dev/hda3 > /root/tmp.txt 2>&1
=3D>

debugreiserfs 3.6.19.3 (2003 www.namesys.com)

list of 21 block numbers is read
/0
block #0 has wrong level 0, has to be 65534
Number of unresolved block numbers: 21



Kind Regards
Bruno
