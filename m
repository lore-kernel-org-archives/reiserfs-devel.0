From: Jindrich Makovicka <makovick@gmail.com>
Subject: Re: kernel BUG at fs/reiser4/plugin/file/tail_conversion.c:80?
Date: Sun, 21 May 2006 14:04:11 +0200
Message-ID: <20060521140411.7de0722f@holly.localdomain>
References: <44704349.70602@yahoo.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28657-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44704349.70602@yahoo.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Maximilian Mehnert <widolo87@yahoo.de>
Cc: reiserfs-list@namesys.com

On Sun, 21 May 2006 12:39:05 +0200
Maximilian Mehnert <widolo87@yahoo.de> wrote:

> Kernel-Patch: reiser4-for-2.6.16-2.patch.gz
> 
> kernel BUG at fs/reiser4/plugin/file/tail_conversion.c:80!
> invalid opcode: 0000 [#1]
> [...]
> 
> 
> 
> I thought that maybe someone with greater insight than I might be
> interested in the attached kernel dump.
> I don't know how to reproduce this - the only thing I can say is,
> that I had several reiser4 partitions under heavy load. (Now I
> changed to reiserfs... Too many problems with reiser4 during the last
> days.. :-( )

This was a really frequent matter during the last two weeks. Please
look for the patches that were posted.

> I noticed another thing: using reiser4 for some days on my laptop
> rendered kopete (instant messaging application) nearly unresponsive.
> Looking at the output of strace it seems that the frequent use of
> fsync()  (in sqlite) causes heavy i/o with reiser4. This problem does
> not occur with ext3 or reiserfs...

This is a known issue. fsync() and sync() generate a lot of seeking,
and are painfully slow. I have the same problems with postgresql's
vacuum and db4 open/close here.

Regards,
-- 
Jindrich Makovicka
