From: Hans Reiser <reiser@namesys.com>
Subject: Re: Agressive selective pre-allocation
Date: Thu, 12 Dec 2002 17:46:08 +0300
Message-ID: <3DF8A130.7070101@namesys.com>
References: <20021210074600.J26400@vestdata.no> <200212100826.36651.russell@coker.com.au> <20021210111228.GA9155@shuttle.mothership.home.dhs.org> <20021212094754.S26400@vestdata.no>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12157-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021212094754.S26400@vestdata.no>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Ragnar_Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>
Cc: reiserfs-list@namesys.com

Ragnar Kj=F8rstad wrote:

>On Tue, Dec 10, 2002 at 12:12:28PM +0100, Stefan Fleiter wrote:
> =20
>
>>>mbox's aren't an issue, if you have them then you probably don't care too
>>>much about performance anyway.
>>>     =20
>>>
>>I switched some large mailing lists with thousands of messages from mbox =
to
>>maildir with mutt. Changing mailboxes lasted maybe 2 or 3 times longer,
>>so I switched back to mbox *for speed*.
>>   =20
>>
>
>Yes, maildir is not always faster.
>
>First problem is disk-layout. The way it works with reiserfs3.6 and
>default hashes the inodes and files are written in different orders and
>the disk does a lot of unneeded seeks.=20
>
You mean the names are written in an order different from the stat data=20
and file bodies, and the stat data and file bodies have the same order.

This is because we sort filenames by filename, and  sort stat data and=20
file bodies by objectid which tends to be ordered by creation time.

We should implement a plugin that sorts filenames by creation time, and=20
that will cause our performance to resemble ext2 more (meaning that for=20
large directories the performance will fall apart, but for small=20
directories there might be some advantage from not sorting by name).  I=20
think that sorting file bodies by filename would require a larger key,=20
so I hesitate at that, but maybe it would be interesting to explore also.

>A workaround is to use a hash
>that automagicly orders inodes and files the same way. A better way is
>probably to store the stat-data with the directory-data. I think that is
>on the schedule, is it not?
>
No, not yet, it didn't make the 4.0 code freeze....  patches are=20
welcomed....

>
>It is also important that readdir-order matches the ondisk layout, but
>that is perhaps already the case?
>
If you copy a directory, then after the copy the readdir order matches=20
the ondisk layout.

>
>Possible the overhead of the systemcalls is also significant, but my
>guess is that it is negletable compared to io-performance.
>
>Next problem is readahead. When the whole mailbox is in a single file
>the OS is able to use readahead to improve performance, but it doesn't
>seem to work as well when reading a whole directory. This is perhaps the
>thoughest one to solve, IMHO.
>
It is not very hard to solve if we use packing locality readahead.

>
>
>However, the single most important fix would be the mail-clients. If I'm
>not mistaken mutt reads the whole mail, and that's simply not required.
>It should only read the headers. That will speed things up by a huge
>factor when you have mails with attachments and so on.  It must also learn=
=20
>that it shouldn't reread the folder everytime it's updated!
>
>Right now the case is pretty much that none or few of the potential
>performance-benefits of maildir are made use of, and the drawbacks are
>hitting much harder then they ought to. I bet it's only temporary
>though. Reiserfs has the potential to make faster mailsystems with
>the use of maildir! :-)
>
>
>
> =20
>


