From: Oleg Drokin <green@namesys.com>
Subject: Re: Error messages.
Date: Thu, 6 Mar 2003 09:57:43 +0300
Message-ID: <20030306095743.B5417@namesys.com>
References: <7473069171.20030305201818@tnonline.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13109-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <7473069171.20030305201818@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anders Widman <andewid@tnonline.net>
Cc: reiserfs-list@namesys.com

Hello!

On Wed, Mar 05, 2003 at 08:18:18PM +0100, Anders Widman wrote:

>    This  has  come up on this list a number of times, and no one still
>    seem to have found the true answer to the problem.
>    kernel: status error: status=0x58 { DriveReady SeekComplete DataRequest }

Is this the only messages?
The most similar stuff I saw is coming in pairs with different message like this:
  hda: dma_intr: status=0x51 { DriveReady SeekComplete Error }
  hda: dma_intr: error=0x84 { DriveStatusError BadCRC }

And this one means there is noisy IDE cable and/or too high UDMA mode for this cable.

>    Sometimes  it  seem  to  help to disable DMA and or lower UDMA mode

This is also confirms above theory of bad data cable.
And if you do not use UDMA, CRC is not checked at all.

>    (all  drives are ATA-100 or ATA-133). But then after a few days, or
>    a  few  minutes  the  kernel  starts spitting out these status=0x58
>    errors.

Hm. This is strange.
Well, the best thing you can probably do is just post the whole history to
IDE maintainers and ask for decoding. Worked for me.

>    What  exactly does this status=0x58 error mean, and what can one do
>    to solve the problem?

Well, I checked my logs:
Feb 27 21:14:47 car kernel: hdg: status error: status=0x58 { DriveReady SeekComplete DataRequest }
Feb 27 21:14:47 car kernel: hdg: drive not ready for command
Feb 27 21:14:51 car kernel: hdg: status error: status=0x58 { DriveReady SeekComplete DataRequest }
Feb 27 21:14:51 car kernel: hdg: drive not ready for command
;)))
And for this case I am sure this was a scratchy CD-ROM disk in my CD-ROM drive.

Probably same stuff can be get when drive is busy remapping bad sectors?
Use smartctl to find out how these messages corellate with remapped bad sectors counts?

Bye,
    Oleg
