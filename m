From: twist <twist@twistrulz.de>
Subject: Re: journal size==0 [reiserfs 3.6, reiserutils 3.x.1b]
Date: Mon, 15 Apr 2002 15:34:59 +0200
Message-ID: <20020415153459.7f88330a.twist@twistrulz.de>
References: <20020415002651.377f3c5c.twist@twistrulz.de>
	<20020415092105.A1116@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10069-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020415092105.A1116@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Mon, 15 Apr 2002 09:21:05 +0400
Oleg Drokin <green@namesys.com> wrote:

> Hello!
> 
> On Mon, Apr 15, 2002 at 12:26:51AM +0200, Thomas Wiedemann wrote:
> 
> > i cannot mount my reiserfs partition any more, because of that:
> > super-459: read_super_block: super found at block 16 is within its own log. It must not be of this format type.
> 
> What kernel version do you have?
> Relocated/nonstandard journal support is only available in 2.5 kernel series
> for now.

2.4.18-rc4
ok, then i'll try it with the development kernel later.


> 
> > so, here's the story how i "created" this error and some details:
> > due a hardware failure (the harddisk?), i got some weird error messages:
> > Apr 13 17:32:13 hq kernel: hdb: dma_intr: status=0x51 { DriveReady SeekComplete Error }
> > Apr 13 17:32:13 hq kernel: hdb: dma_intr: error=0x84 { DriveStatusError BadCRC }
> > (...)
> There are bad hardware for sure. BAd hardware is dealt with on a special basis
> described in http://namesys.com/support.html, as Hans outlined already.

of course it was a hardware failure that created the whole mess, but that is not my problem...i just missed a warning or something that reiserfsck --no-journal-available deletes the journal and doesn't create a new one, if the kernel it is used on does not support external journals. it failed with just using --rebuild-sb, so i tried it that way. and there is no way to tell fsck that the journal should just be ignored, right?

thnx, thomas



--
"Windows is the most documented operating system that has ever been."

--Bill Gates
