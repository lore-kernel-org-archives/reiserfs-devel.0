From: evilninja <evilninja@gmx.net>
Subject: Re: reiserfs in cryptoloop file is corrupt: all data lost?
Date: Wed, 19 Oct 2005 22:25:50 +0200
Message-ID: <4356ABCE.1010009@gmx.net>
References: <43569E08.8000405@t-online.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26575-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43569E08.8000405@t-online.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com
Cc: Detlef Grittner <detlef.grittner@t-online.de>

Detlef Grittner schrieb:
> An appropriate fstab entry, so a user is allowed to mount the device 
> looks like this:
> /home/userX/data         /home/userX/crypto  reiserfs   
> user,noauto,loop=/dev/loop0,encryption=twofish256,phash=sha512,itercountk=100 

so, you're using a file-backed cryptoloop setup? these setups are often 
reported to deadlock. but this only as a side-note...

> I have done a reiserfsck --check, which told me I should run reiserfsck 
> --rebuild-sb and then a reiserfsck --rebuild-tree. The last one 
> obviously failed and just told me that there is no reiserfs meta data.

you ran reiserfsck on what? on the losetup'ed /dev/loop0 i hope ;-)
please provide the output of the reiserfsck run. please make sure that 
you're running a current version of reiserfsprogs / current kernel.

> I want to know, if it is worth a try, otherwise I won't spend time and 
> money on it.

well, it's only $25 at http://www.namesys.com/support.html ;-)

Christian.
-- 
BOFH excuse #34:

(l)user error
