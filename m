From: Oleg Drokin <green@namesys.com>
Subject: Re: fs errors on thinkpad R31
Date: Fri, 10 Jan 2003 18:07:23 +0300
Message-ID: <20030110180723.A16153@namesys.com>
References: <200301092320.48501.bernd-schubert@web.de> <20030110173246.A10156@namesys.com> <200211101555.52164.bernd-schubert@web.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12313-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200211101555.52164.bernd-schubert@web.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernd Schubert <bernd-schubert@web.de>
Cc: ReiserFS <reiserfs-list@namesys.com>

Hello!

On Sun, Nov 10, 2002 at 03:55:51PM +0100, Bernd Schubert wrote:
> > > this is the second time within 14 days after which I had to run
> > > reiserfsck on my IBM Thinkpad R31.
> > > This time I lost a directory with 49 files (it seems it were only kernel
> > > modules, so probably not so important data).
> > > I have attached the error messages from the /var/log/messages file.
> > Hm. Looks like some blocks have unexpected contents.
> > Do you often uncleanly turn-off/run out of battaries prior to
> > corruption?
> > Try to disable write caching in your harddrive then. (hdparm -W0 /dev/hda)
> thanks for your help. When I had to run reiserfsck for the very first time, I 
> thought this as well, since there where some unexpected crashes in December 
> and I run one day before the first fsck out of batteries. But ever since this 
> fsck, nothing like this happend again (I found the reason for the crashes and 
> never needed to run on accu since this time).

Still blocks are filled with some garbage it seems.
Do you suspend/resume your laptop? May be that corrupts memory or something?

> Should I enable reiserfs-debugging within the kernel configuration ? Any other 
> possibilities to debug this ? 

Probably first you need to find out usage pattern that leads to corruption.

Bye,
    Oleg
