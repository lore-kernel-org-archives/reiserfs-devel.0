From: Oleg Drokin <green@namesys.com>
Subject: Re: Error messages.
Date: Thu, 6 Mar 2003 10:19:57 +0300
Message-ID: <20030306101957.A5751@namesys.com>
References: <7473069171.20030305201818@tnonline.net> <20030306095743.B5417@namesys.com> <200303060907.49762.pacman@huji.ac.il>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13112-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200303060907.49762.pacman@huji.ac.il>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Voicu Liviu <pacman@huji.ac.il>
Cc: reiserfs-list@namesys.com

Hello!

On Thu, Mar 06, 2003 at 09:07:49AM +0200, Voicu Liviu wrote:
> I also get messages like this: ( what is this? )
> On Thursday 06 March 2003 08:57, Oleg Drokin wrote:
> > hda: dma_intr: status=0x51 { DriveReady SeekComplete Error }
> >   hda: dma_intr: error=0x84 { DriveStatusError BadCRC }

This is a complete sign of either your having noisy/broken (or too long?)
IDE cable (consider changing).
or your using too high UDMA mode for your IDE cable (e.g. UDMA3+ for 40 wire cable)
(consider changing cable or lowering UDMA mode).

Bye,
    Oleg
