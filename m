From: Edward Shishkin <edward@namesys.com>
Subject: Re: reiser4 corruption
Date: Fri, 17 Jun 2005 21:08:16 +0400
Message-ID: <42B30380.90606@namesys.com>
References: <Pine.LNX.4.60.0506171108440.6542@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24402-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.60.0506171108440.6542@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: mross@rs-net.org
Cc: reiserfs-list@namesys.com, Vitaly Fertman <vitaly@namesys.com>

mross@rs-net.org wrote:

Hello

> I recently experimented using reiser4 on a backup system that 
> processes millions of files (most hard links to a main pool of files) 
> every night. I installed it on a spare machine by patching a vanilla 
> 2.6.11.11 with the reiser4 patches. Everything keep working for a few 
> days, but I suddenly noticed this message displayed multiple times:
>
> reiser4[ktxnmgrd:md0:ru(1754)]: commit_current_atom 
> (fs/reiser4/txnmgr.c:1147)[nikita-3176]:
> WARNING: Flushing like mad: 16384
>
> as well as:
>
> reiser4[pdflush(28040)]: commit_current_atom 
> (fs/reiser4/txnmgr.c:1147)[nikita-3176]:
> WARNING: Flushing like mad: 16384


This is harmless

>
> Would someone mind explaining to me what this means? Upon fscking, it 
> complained about one node containing an unrecognizable module, or 
> something similar.


What patch set did you apply? If this is the last one 
(reiser4-for-2.6.11-5) there is some inconsistency due to format changes
that will be fixed in the next release.

Edward.

> Unfortunately, I don't have the exact output. Also, the semantic 
> checks would have taken 2-3 full days to finish, so I didn't even let 
> fsck finish. I just moved back to reiserfs, which is a shame since 
> reiser4 was incredibly faster. (Simultaneous backups were going at a 
> rate of ~20MB/s compared to ~8MB/s on reiserfs)
>
> Thanks,
>
> -Ross
>
>

