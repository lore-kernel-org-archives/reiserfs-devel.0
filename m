From: Sander <sander@humilis.net>
Subject: Re: 2.4.21 -> 2.4.25 cryptoloop mess
Date: Sun, 9 Jan 2005 13:57:27 +0100
Message-ID: <20050109125727.GC862@favonius>
References: <8944.1105265334@www26.gmx.net> <19024.1105271084@www24.gmx.net>
Reply-To: sander@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23098-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <19024.1105271084@www24.gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Danny Norging <norging@gmx.de>
Cc: reiserfs-list@namesys.com

Danny Norging wrote (ao):
> reiserfsck-3.6.19 just finished, still nothing new in lost+found :(
> Thats what I did:
> 
> # losetup /dev/loop0 hdc1decrypted.dump
> # reiserfsck --rebuild-tree -S /dev/loop0 -l reiserfsck-3.6.19.log

This is after you ran this command with the older reiserfsck right? In
that case I would make a new copy and try again with this version on the
fresh copy. It might not make any difference at all though, but can be
worth a try.

I'm afraid (but still no Reiserfs expert) that your first --rebuild-tree
run on the original image (without the -S) did more damage than good.

It seems that the Namesys guys will help you out after the holidays.
They will have better suggestions than I have.

-- 
Humilis IT Services and Solutions
http://www.humilis.net
