From: "M" <martin@luminoussheep.net>
Subject: Re: REISERFS: panic... Trying to log block (prints.c:362)
Date: Tue, 14 Jun 2005 14:00:00 +0100 (BST)
Message-ID: <17210.194.72.110.12.1118754000.squirrel@luminoussheep.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-24375-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> Hello
...
>> Jun 14 07:14:36 localhost kernel: REISERFS: panic (device sda2):
journal-2332: Trying to log block 471, which is a log block
>
> This means that you have a filesystem corruption. Would you try to
reiserfsck sda2?

I will if you want (but I won't be at the machine for a 4 hours) but it
shouldn't be corrupted...

The sequence of commands was:
mkreiserfs
mount
tar onto newly mounted fs
box paniced...

It dies within about 30 seconds of issuing the tar command and is
repeatable. So the question is why is the filesytem corrupt?
Do you suspect a bad sata driver?

-- 
Thanks,
M



