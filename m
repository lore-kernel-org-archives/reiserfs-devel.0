From: Zygo Blaxell <eazgwmir@umail.furryterror.org>
Subject: a happier reiserfsck story
Date: Wed, 02 Jul 2003 13:37:31 -0400
Message-ID: <pan.2003.07.02.13.37.30.693348.20132@umail.hungrycats.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-14803-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I have a USB2.0/firewire external disk drive which has a 120GB reiserfs
filesystem on top of a loop-AES loopback FS.  Often the nbd driver is
involved tool, as I'm testing various hardware configurations in order to
isolate ieee1394 or USB in order to reliably talk to this disk from my laptop.

The current state of Linux USB and IEEE1394 drivers is such that this
filesystem has endured _many_ crashes.  One pass of reiserfsck 3.6.6 and
one of 3.6.8 fixed the most recent crash, which was the only one that
required a reiserfsck.

Why two passes?  Well, it takes more than an hour to run reiserfsck
through firewire, and while I was waiting I figured I might as well
grab the latest version in case 3.6.6 didn't work (it didn't).
