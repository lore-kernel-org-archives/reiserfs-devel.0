From: Heinz-Josef Claes <hjclaes@web.de>
Subject: Re: duplicate files and recent changes
Date: 07 Jun 2002 10:53:57 +0200
Message-ID: <1023440037.971.6.camel@kakapo>
References: <Pine.WNT.4.43.0206060127230.1296-100000@fanatic>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10666-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <Pine.WNT.4.43.0206060127230.1296-100000@fanatic>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "S. Alexander Jacobson" <alex@shop.com>
Cc: reiserfs-list@namesys.com

Am Don, 2002-06-06 um 07.30 schrieb S. Alexander Jacobson:
> I just joined this list.  Two question:
> 
> 1. Can reiserfs detect that I have two copies of
> the same file on disk and store tham as one file
> (doing a lazy copy) if someone writes to one of
> them?
> 
> 2. Is there a fast way to get access to the file
> change list?  It would be nice to be able to do
> fast backup of changed files without having to
> traverse entire directory trees.
> 
> -Alex-
> 
> ___________________________________________________________________
> S. Alexander Jacobson                   i2x Media
> 1-212-787-1914 voice                    1-603-288-1280 fax
> 
> 
Hi,

I don't know why you want this feature.
But I've written a well tested tool for backing up directories on
another disk which uses md5 sums to recognize same files (even in one
backup) and hard links them. By this way, it combines the advantages of
full and incremental backup. It also uses compression and has a lot of
other options and optimisations. It runs best with reiserfs, because
reiserfs has no preconfigured number of inodes and is fast with hard
linking.
So, if you need to backup, try
http://sourceforge.net/projects/storebackup


Regards,
Heinz-Josef Claes

PS: Licence is GPL.



