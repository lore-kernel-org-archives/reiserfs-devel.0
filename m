From: Oleg Drokin <green@namesys.com>
Subject: Re: Error message - vs-13070
Date: Mon, 17 Feb 2003 09:15:52 +0300
Message-ID: <20030217091552.A20096@namesys.com>
References: <5.2.0.9.0.20030215000534.018ed008@mail.bogus.home> <5.2.0.9.0.20030215000534.018ed008@mail.bogus.home> <5.2.0.9.0.20030216203350.018dd7d8@mail.bogus.home> <20030216153359.GA28622@mrball.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12786-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030216153359.GA28622@mrball.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hello!

On Sun, Feb 16, 2003 at 07:33:59AM -0800, Todd Lyons wrote:
> >hda: dma_intr: status=0x51 { DriveReady SeekComplete Error }
> >hda: dma_intr: error=0x40 { UncorrectableError }, LBAsect=6599945, 
> >sector=4286584
> >end_request: I/O error, dev 03:03 (hda), sector 4286584
> >These errors look to me like a hardware problem (bad sector on the drive).
> >Definately not a reiserfs problem, thanks for the reply Oleg.
> Depends, is 4286584 beyond the end of what really exists, or is that in
> the middle of your valid sectors?

Reads/writes beyond end of device emit different messages.

Bye,
    Oleg
