From: Oleg Drokin <green@namesys.com>
Subject: Re: journal size==0 [reiserfs 3.6, reiserutils 3.x.1b]
Date: Mon, 15 Apr 2002 09:21:05 +0400
Message-ID: <20020415092105.A1116@namesys.com>
References: <20020415002651.377f3c5c.twist@twistrulz.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10065-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <20020415002651.377f3c5c.twist@twistrulz.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Wiedemann <twist@twistrulz.de>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Apr 15, 2002 at 12:26:51AM +0200, Thomas Wiedemann wrote:

> i cannot mount my reiserfs partition any more, because of that:
> super-459: read_super_block: super found at block 16 is within its own log. It must not be of this format type.

What kernel version do you have?
Relocated/nonstandard journal support is only available in 2.5 kernel series
for now.

> so, here's the story how i "created" this error and some details:
> due a hardware failure (the harddisk?), i got some weird error messages:
> Apr 13 17:32:13 hq kernel: hdb: dma_intr: status=0x51 { DriveReady SeekComplete Error }
> Apr 13 17:32:13 hq kernel: hdb: dma_intr: error=0x84 { DriveStatusError BadCRC }
> (...)
There are bad hardware for sure. BAd hardware is dealt with on a special basis
described in http://namesys.com/support.html, as Hans outlined already.

Bye,
    Oleg 
