From: Terje Malmedal <terje.malmedal@usit.uio.no>
Subject: Re: reiserfs and nfs.
Date: Mon, 25 Nov 2002 19:12:19 +0100
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <E18GNiV-0006n8-00@aqualene.uio.no>
References: <15842.17986.416305.106123@laputa.namesys.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org@vger.kernel.org>
In-reply-to: <15842.17986.416305.106123@laputa.namesys.com> (message from
	Nikita Danilov on Mon, 25 Nov 2002 18:48:18 +0300)
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikita@Namesys.COM
Cc: linux-kernel@vger.kernel.org, Reiserfs-List@Namesys.COM


[Nikita Danilov]
> Terje Malmedal writes:
>> 
>> Hi, 
>> 
>> I'm nfs-exporting a reiserfs filesystem, the problem is that the
>> inode-number as seen from the client seems to change from time to
>> time. This confuses a number of programs, for instance Emacs believes
>> that the file changed under it when this happens.

> This problem is not known. What version of reiserfs (3.5 or 3.6) and
> kernel are you using? Is there any way to reproduce this problem?

On the NFS-server I'm using RedHat kernel 2.4.18-10smp, according to
dmesg I'm using version 3.6 of reiser: 
reiserfs: checking transaction log (device 3a:00) ...
Using r5 hash to sort names
ReiserFS version 3.6.25

(The block device is LVM by the way)

Clients are both Linux and Solaris. 

To reproduce do something like: 
$ ls -li RMAIL
 387607 -rw-------    1 tm       4050     36635726 Nov 20 16:15 RMAIL

on the nfs-client, (obviously on a NFS-file) and wait a bit, varying
from a few minutes to many hours and the inode-number will be
different. I'm guessing the period you have to wait is dependent on
how much else is going on on the NFS-server.

I have no reason to suspect any data-corruption, md5 of file as well
as atime, ctime and mtime are unchanged.

-- 
 - Terje
malmedal@usit.uio.no
