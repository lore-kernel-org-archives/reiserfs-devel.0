From: Domenico Andreoli <cavok@tiscali.it>
Subject: reiserfsprogs: lib/misc.c: why die() aborts?
Date: Sat, 20 Mar 2004 17:18:19 +0100
Sender: Domenico Andreoli <cavok@libero.it>
Message-ID: <20040320161819.GA6734@raptus.homelinux.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17341-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

hi all,

in trying to figure out what is the unpack program in reiserfsprogs
and if it supposed to be distributed in the debian package, i came to
the function die() in lib/misc.c.

i'm seeing it regularly aborts the execution instead of using the
usual exit(EXIT_FAILURE). shouldn't it be more polite or it is not for
public use?

what is unpack supposed to do?

cheers
domenico

-----[ Domenico Andreoli, aka cavok
 --[ http://filibusta.crema.unimi.it/~cavok/gpgkey.asc
   ---[ 3A0F 2F80 F79C 678A 8936  4FEE 0677 9033 A20E BC50
