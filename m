From: Hans Reiser <reiser@namesys.com>
Subject: Re: ReiserFS problems
Date: Thu, 07 Aug 2003 18:41:20 +0400
Message-ID: <3F326510.7030804@namesys.com>
References: <20030806182055.A28562@bitwizard.nl> <20030806164852.GA14719@namesys.com> <3F324CEF.4070608@namesys.com> <200308072324.55305.russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15234-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200308072324.55305.russell@coker.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: russell@coker.com.au
Cc: Rogier Wolff <R.E.Wolff@harddisk-recovery.nl>, reiserfs-list@namesys.com

Russell Coker wrote:

>
>The problem with fsck being too agressive has a long history.  The HPFS DLL 
>for CHKDSK.EXE in OS/2 when run in level 3 was known for recovering files 
>from a recently formatted file system.  It seems that the IBM file-system 
>people weren't smart enough to come up with the type of ideas that Rogier can 
>come up with in seconds.  ;)
>
>  
>
I think it is more like, when you write the first version of fsck you 
don't think about people storing copies of reiserfs on reiserfs, and 
then on the next chance you get you change the disk format.  
Unfortunately, changing disk formats is not done often so there is a lag 
(though now that we have the new plugin infrastructure....).

-- 
Hans


