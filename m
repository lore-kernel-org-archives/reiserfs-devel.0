From: Kurt Guenther <kurtg@serent.com>
Subject: reiserfs repairs
Date: Wed, 29 Sep 2004 07:26:46 -0400
Message-ID: <415A9BF6.1010506@serent.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21956-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com


I have some "wierd" files and I thought it may be from a long string of 
system crashes (due to nvidia/xorg-x11 issues).

> enigma root # ls -ld .
> drwx------  13 root root 776 Sep 27 16:45 .
> enigma root # ls -ld ./README
> ls: ./README: Permission denied
> enigma root # ls -l ./README
> ls: ./README: Permission denied
> enigma root # ls -l
> ls: README: Permission denied
> ls: xorg.conf.new: Permission denied
> total 533
> -rw-r--r--  1 root root 541206 Sep 27 16:42 openvpn-2.0_beta11.tar.gz
> enigma root #


It seems whatever existed in thid directory at the time of the crash has 
gone over to the dark side.  

I looked at reiserfsck, but it needs this file system to be be 
unmounted.  This is a remote RAID-1 server, so not much luck there.

What's the recommended approach to recover/delete these?   I'm running 
the 2.6.8-r3 Gentoo kernel.

--Kurt

