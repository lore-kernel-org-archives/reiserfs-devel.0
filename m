From: Oleg Drokin <green@namesys.com>
Subject: Re: Problem with my HDD
Date: Thu, 30 May 2002 09:21:55 +0400
Message-ID: <20020530092155.D3922@namesys.com>
References: <10512850437.20020529194929@starfall.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10445-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <10512850437.20020529194929@starfall.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cookie-Monster <cookie.monster@starfall.de>
Cc: reiserfs-list@namesys.com

Hello!

On Wed, May 29, 2002 at 07:49:29PM +0200, Cookie-Monster wrote:

> I hope you can help me. I formated on of my Server-HDDs with ReiserFS
> version, which has been distributed in SuSE Linux 7.3. Sorry, but I
> don't know the version, cause I'm know running SuSE Linux 8.0.
> My Problem is, that the HDD cannot be mounted anymore:
> 1.   fileserver:/ # mount /dev/sda1 /ftp/apps/
> 2.   mount: Not a directory
>       Bad root block 4294967295. (--rebuild-tree did not complete)

Well, so you in fact run reiserfsck --rebuild-tree before.
What caused you to run it for the first time?

> The check goes on til there are 171398 (more than 60%) blocks left then it hangs
> up for a while before continueing. From this point on it continues
> very slow only. From 150xxx it continues fast til 13039.
> At this point the program quits without saying anything and the HDD is
> hung up. The old version of reiserfsck, in the SuSe Linux 7.3 Edition
> gave out a lot of "Block could not be read" or something like this and
> the HDD hung up.

what does 'dmesg' output says after this?
If you have read errors, then namesys can help you only based
on http://namesys.com/support.html terms.

> I really need the data! Is there any possibilty of deleating the
> unreadable blocks and rebuuilding the tree then? When this works, I

This is possible, but all the data that was contained in these blocks would be
lost.

> p.s.: The HDD is a IBM DRHS36V (36GB U2W-SCSI) if that is important.

Hm, I thought that only IBM DTLA-307040 and IC40... were subject to quick
death.

Bye,
    Oleg
