From: "mite pascoff" <ttl@linuxmail.org>
Subject: Re: can't find a reiserfs file ssytem! 2
Date: Wed, 17 Mar 2004 16:03:09 +0200
Message-ID: <20040317140309.ABECF3982E7@ws5-1.us4.outblaze.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17269-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vladimir Saveliev <vs@namesys.com>
Cc: reiserfs-list@namesys.com

Ok I did what you sad but some problems accur:

> create a copy of that partition on spare device
> dd if=problemdevice of=sparedevice

my problem partition is 15GB large and dd stoped after copying 2GB of data with a messige like:
File size limit exceeded
So I began testing this part/image of the problem partition

> get the latest reiserfsprogs
> (ftp://ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.6.13.tar.gz)

did that

> reiserfsck --rebuild-sb sparedevice
> reiserfsck --rebuild-tree sparedevice

did that too

> Lets us know the result
 
A LOT of messages came out and after --rebuild-sb and --rebuild-tree reiserfsck --check reports that "No corruptions found" ... but now I cant mount this imige file ... the command I try is "mount -t reiserfs image.file /mnt/test -o loop" even -o loop=/dev/loop[0-3] ... mount exits with the usual error and nothing happens ... so what should I do now ... perform these actions on the problem partition or to find a way to mount the image.file and see if aeverything is OK there ?
-- 
______________________________________________
Check out the latest SMS services @ http://www.linuxmail.org 
This allows you to send and receive SMS through your mailbox.


Powered by Outblaze
