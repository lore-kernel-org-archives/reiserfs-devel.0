From: Bernd Schubert <bernd-schubert@web.de>
Subject: Re: fs errors on thinkpad R31
Date: Sun, 10 Nov 2002 15:55:51 +0100
Sender: bernd-schubert@web.de
Message-ID: <200211101555.52164.bernd-schubert@web.de>
References: <200301092320.48501.bernd-schubert@web.de> <20030110173246.A10156@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-12312-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030110173246.A10156@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: ReiserFS <reiserfs-list@namesys.com>

On Friday 10 January 2003 15:32, Oleg Drokin wrote:
> Hello!
>
> On Thu, Jan 09, 2003 at 11:20:48PM +0100, Bernd Schubert wrote:
> > this is the second time within 14 days after which I had to run
> > reiserfsck on my IBM Thinkpad R31.
> > This time I lost a directory with 49 files (it seems it were only kernel
> > modules, so probably not so important data).
> > I have attached the error messages from the /var/log/messages file.
>
> Hm. Looks like some blocks have unexpected contents.
> Do you often uncleanly turn-off/run out of battaries prior to
> corruption?
> Try to disable write caching in your harddrive then. (hdparm -W0 /dev/hda)
>

Hello Oleg,

thanks for your help. When I had to run reiserfsck for the very first time, I 
thought this as well, since there where some unexpected crashes in December 
and I run one day before the first fsck out of batteries. But ever since this 
fsck, nothing like this happend again (I found the reason for the crashes and 
never needed to run on accu since this time).

Should I enable reiserfs-debugging within the kernel configuration ? Any other 
possibilities to debug this ? 

Thanks,
	Bernd

