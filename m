From: Alexandre Ratti <alex@gabuzomeu.net>
Subject: Re: New error when running script on ReiserFS partition
Date: Thu, 12 Dec 2002 15:27:07 +0100
Message-ID: <4.3.2.7.2.20021212151241.0288ddc8@mail.poulpe.net>
References: <4.3.2.7.2.20021212141046.00b5d640@mail.poulpe.net>
 <4.3.2.7.2.20021212141046.00b5d640@mail.poulpe.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12156-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021212170742.A3110@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

Hello Oleg,


At 17:07 12/12/2002 +0300, Oleg Drokin wrote:
>On Thu, Dec 12, 2002 at 02:54:33PM +0100, Alexandre Ratti wrote:
>
> > I got a new error when my backup script ran today. (See [1] for previous
> > message sent on Tuesday). This script runs on a large ReiserFS partition.
> > System is Debian Woody with recompiled 2.4.19 kernel. System did not crash.
> > I saw with ps that the kupdated process was dead (defunct).
> > I'm not sure this is ReiserFS-related, though these errors only seem to
> > happen when the script runs. Can someone confirm, based on this syslog
> > snippet?
>
>While this is certainly a piece of reiserfs code, the crash address makes no
>sence at all.
>Can you please run memtest86 for some time to confirm that your memory is 
>still ok?

It's running now; I'll let you know what the results are. (I last ran 
memtest86 in October when I set up this box and the memory was fine at that 
time.)


Cheers

Alexandre



