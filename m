From: Robert Lazzurs <rob@ednetisp.net>
Subject: linux and nfs issues
Date: Thu, 29 Jan 2004 11:42:49 +0000
Message-ID: <1075376569.633.166.camel@manson.ednet.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16648-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Regarding this post from the mailing list archives:

Dan Oglesby wrote:

> Hendrik Visage wrote:
>
>> On Sat, Nov 15, 2003 at 10:23:08PM +0100, Redeeman wrote:
>>
>>> i have read that nfs dont work with reiserfs, but even though that, i
>>> made an export, and it works just perfect, is it dangoures somehow?
>>
>>
>>
>> Several moons ago, there were problems with reiserfs and NFS, as
>> reiserfs didn't (still don't?) have the notion of inodes, which is
>> used in NFS for filehandle information. there were a quick work around
>> which didn't work that well, but the current 2.4.x kernels and 
>> Reiserfs 3.6
>> works sofar without troubles.
>>
>>
>> Hendrik
>>
>
> I export several ReiserFS filesystems via NFS, and have had no issues 
> accessing or manipulating data via NFS.  This is with kernel 2.4.21 
> and ReiserFS 3.6.
>
> --Dan
>
>
>
The described problems were more like years ago than moons ago, however, 
there were some kernels a few moons ago that had NFS problems not due to 
reiserfs code just to keep things in a nice state of chaos for the 
users.....

-- 
Hans

We have noticed some serious issues with out linux based nfs server with
a reiser 3.6 partition on raid 1.  From the logs it appears like a nfs
locking issue.

Jan 19 11:25:29 liszt-06/liszt-06 kernel: vs-13075:
reiserfs_read_inode2: dead inode read from disk [30626 747337 0x0 SD].
This is likely to be race with knfsd. Ignore
Jan 19 11:29:51 liszt-06/liszt-06 kernel: vs-13075:
reiserfs_read_inode2: dead inode read from disk [30626 765040 0x0 SD].
This is likely to be race with knfsd. Ignore
Jan 19 11:31:47 liszt-06/liszt-06 kernel: vs-13075:
reiserfs_read_inode2: dead inode read from disk [30626 30908 0x0 SD].
This is likely to be race with knfsd. Ignore
Jan 19 12:14:55 liszt-06/liszt-06 kernel: vs-13075:
reiserfs_read_inode2: dead inode read from disk [30626 663906 0x0 SD].
This is likely to be race with knfsd. Ignore

The box has only been hosting mail queues for out postfix based cluster
and it has been running the 2.4.21 kernel when the above issue happened.

Now I understand from the kernel change logs that there have been many
changes to knfsd that could have been the cause of this issue, however I
cannot confirm that, so could I ask if anyone on this list knows if this
is a known issue and if it has been resolved in a more recent kernel and
if so which one.

Thanks in advance, kind regards - RL

-- 
MSN:lazzurs@everybuddy.com	|"All that is etched in stone
Yahoo:admroblaz AIM:admroblaz	|is truly only scribbled in
ICQ:66324927			|sand" - RL
Jabber:admroblaz@jabber.org	|Join Eff http://www.eff.org
e-mail:lazzurs@lazzurs.myftp.org|Take care all - Rob Laz


-- 

This email and any files transmitted with it are confidential and intended
solely for the use of the individual or entity to whom they are addressed.
If you have received this email in error please notify the sender. Any
offers or quotation of service are subject to formal specification.
Errors and omissions excepted.  Please note that any views or opinions
presented in this email are solely those of the author and do not
necessarily represent those of edNET or lightershade ltd. Finally, the
recipient should check this email and any attachments for the presence of
viruses.  edNET and lightershade ltd accepts no liability for any damage
caused by any virus transmitted by this email.

-- 
-- 
Virus scanned by edNET.
