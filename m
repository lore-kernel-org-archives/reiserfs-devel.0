From: Oleg Drokin <green@namesys.com>
Subject: Re: Can resize_reiserfs do non-destructive resizing??
Date: Tue, 19 Nov 2002 18:56:00 +0300
Message-ID: <20021119185600.A29078@namesys.com>
References: <200211180851.54274.bestb@sympatico.ca> <20021118165344.A14537@namesys.com> <200211191045.35173.bestb@sympatico.ca>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12025-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200211191045.35173.bestb@sympatico.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bruce <bestb@sympatico.ca>
Cc: reiserfs-list@namesys.com

Hello!

On Tue, Nov 19, 2002 at 10:48:21AM -0500, Bruce wrote:

> I ran "badblocks /dev/hda2" and it produced a list of 39 numbers.
> Nov 19 09:52:07 desktop kernel: hda: dma_intr: status=0x51 { DriveReady 
> SeekComplete Error }
Well, that means that your hard drive is failing and reiserfs cannot read some
of the data because of bad sectors.

Bye,
    Oleg
