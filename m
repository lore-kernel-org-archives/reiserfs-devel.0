From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Reiser disc hosed?
Date: Wed, 11 Jan 2006 12:49:45 +0300
Message-ID: <200601111249.45426.vitaly@namesys.com>
References: <43BF3983.8010004@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27663-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43BF3983.8010004@gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Eric P <eric.maillist@gmail.com>

On Saturday 07 January 2006 06:46, Eric P wrote:
> So I'm doing an 'mplayer -dumpfile', and before I know it I've
> completely filled the last 10GB of my hard drive (total 80GB).  It
> wasn't were the OS resided; just a HD used for a file holding space.
> 
> Anyway, after reaching 100%, the folder I was working in became
> non-working.  When I would do 'ls' from its parent folder, it said
> something like 'Couldn't lstat /folder permission denied'; even as root.
> 
> (sorry if my details are sketchy.  Unfortunately, I tried tackling
> this problem while I had a fever.  Bad idea.).
> 
> 
> It's a reiser4 FS, so I umounted and ran:
> # fsck.reiser4 /dev/hdb1
> ...
> Warn : Fatal corruptions were found. Semantic pass is skipped.
> ***** fsck.reiser4 finished at Thu Jan  5 18:35:18 2006
> Closing fs...done
> 
> 1 fatal corruptions were detected in FileSystem. Run with --build-fs
> option to fix them.

have you run fsck.reiser4 --build-sb before running this to rebuild
the super block?

> So, as suggested, I ran:
> # fsck.reiser4 --build-fs /dev/hdb1   (which ran for ~30 min)
> ...
> Warn : Reiser4 storage tree does not exist. Filter pass skipped.
> ...
> Fatal: No reiser4 metadata were found. Semantic pass is skipped.
> ***** fsck.reiser4 finished at Thu Jan  5 19:16:50 2006
> Closing fs...done
> 
> NO REISER4 METADATA WERE FOUND. FS RECOVERY IS NOT POSSIBLE.

it looks like it is not reiser4 or probably the partition table got 
corrupted or the fs was wiped out somehow. If you need our assistance,
visit www.namesys.com/support.html please.

> So this is (ahem) bad, huh?  Am I screwed?  Or is there any way to
> recover some of the files?
> 
> Thanks for reading!
> Eric P.
> 
> 

-- 
Vitaly
