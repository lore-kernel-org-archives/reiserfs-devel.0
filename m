From: Matt Stegman <matts@ksu.edu>
Subject: Online Resizing Failure
Date: Fri, 25 Oct 2002 14:10:01 -0500 (CDT)
Message-ID: <Pine.GSO.4.33L.0210251403010.28840-100000@unix2.cc.ksu.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11783-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hello,

I cannot resize a mounted reiserfs filesystem.  I'm trying to grow a
reiserfs filesystem on an LVM volume.  I've extended the volume with
lvextend, and resize_reiserfs -v reports "remount failed: Invalid
argument."  Looking in dmesg, I see "can't shrink filesystem on-line." I'm
using kernel 2.4.20-pre10-ac2 on Gentoo Linux, reiserfsprogs 3.6.3. I know
reisers supports online growing, but I don't know what I'm doing wrong.

-- 
      -Matt Stegman


