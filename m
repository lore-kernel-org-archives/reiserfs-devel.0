From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: "reiserfsck --rebuild-tree" fails
Date: Wed, 25 Sep 2002 16:05:43 +0400
Message-ID: <200209251605.43875.vitaly@namesys.com>
References: <3D839BC3000BAB31@mail.epost.de> <1032940085.27530.6.camel@riggs>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11528-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1032940085.27530.6.camel@riggs>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dirk Meul <dirk.meul@epost.de>, reiserfs-list@namesys.com

On Wednesday 25 September 2002 11:48, Dirk Meul wrote:
> Hello.
>
> I've a big problem with my ReiserFS partition. I got OOPS when trying to
> delete a file so i run:
> # reiserfsck --fix-fixable /dev/discs/disc2/part3
> It told me to rebuild tree so i did:
> # reiserfsck --rebuild-tree /dev/discs/disc2/part3
> But after 80% of rebuilding following messages appeare in syslog:
> dma_intr: status=0x51 { DriveReady SeekComplete Error }
> dma_intr: error=0x40 { UncorrectableError }, LBAsect=155297397,
> sector=XXXXXXXX
>
> With linux-2.4.20-pre7-ac2 reiserfsck aborts. If i use linux-2.4.20-pre7
> my PC locks.
>
> I'm using Debian GNU/Linux sid, so i'm using the reiserfsprogs version
> 3.6.3.
>
> Is it possible to recover part of the partition?
>
> Regards,

You have a broken hardware. If you need our assistance with recovering 
from the broken hardware, please visit our support page first - 
http://www.namesys.com/support.html.

-- 

Thanks,
Vitaly Fertman
