From: <jmh5@nei.mv.com>
Subject: Reiser FS will not boot after crash
Date: Mon, 4 Sep 2006 15:26:03 -0400 (EDT)
Message-ID: <Pine.LNX.4.04.10609041516380.4384-100000@nei15.nei1.nei.mv.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-29800-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com


Hi,

  I am observing the following Reiser failure:

  I am trying to use camorama with a Creative WebCam Live spca5xx driver
(recently downloaded and compiled) . Camorama does not start and computer
freezes (no response to mouse, or keyboard. Can't change to terminal
window.

  Reset or pull plug leaves Knoppix 5.0.1-DVD unbootable:

  The actual message from GRUB is inconsistent filesystem?! From a boot
loader?

  The 'fix' is even stranger. I execute fsck.reiserfs from another OS
partition on the Knoppix 5.0.1-DVD partition (takes forever). Somehow
'reading' the Knoppix filesystem 'fixes' whatever was preventing Knoppix
5.0.1-DVD from booting.

  I am curious what your comments and/or suggestions might be?

  regards to all Linuxers,
  john

  

