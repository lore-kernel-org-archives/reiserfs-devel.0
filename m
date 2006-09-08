From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: reiserfsck (3.6.19) --rebuild-tree failed
Date: Fri, 8 Sep 2006 15:22:40 +0400
Message-ID: <200609081522.40534.vs@namesys.com>
References: <200609081130.k88BUpi3004823@smtp.hispeed.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29833-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200609081130.k88BUpi3004823@smtp.hispeed.ch>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: grossnik.mailinglists@hispeed.ch
Cc: reiserfs-list@namesys.com

Hello

On Friday 08 September 2006 15:30, grossnik.mailinglists@hispeed.ch wrote:
> Hi Vladimir
>
> >ok, all bad blocks are used. Lets try to find what they are used for:
> >cat /root/hda3.bad | debugreiserfs -x /dev/hda3
>
> # cat /root/hda3.bad | ./debugreiserfs -x /dev/hda3 > /root/tmp.txt 2>&1
> =>
>
> debugreiserfs 3.6.19.3 (2003 www.namesys.com)
>
> list of 21 block numbers is read
> /0

ah, sorry, I forgot that you ran reiserfsck --rebuild-tree and that did not 
complete. debureiserfs -x will not help.

I will try to reproduce your problem here and debug it.

Btw, did reiserfstune say you something like the below?

reiserfstune -B list2 /dev/hda2
reiserfstune: Bad block 32793 is used already in reiserfs tree. To mark it as 
a bad block use reiserfsck
--fix-fixable with -B option.




> block #0 has wrong level 0, has to be 65534
> Number of unresolved block numbers: 21
>
>
>
> Kind Regards
> Bruno
