From: Oleg Drokin <green@namesys.com>
Subject: Re: Can resize_reiserfs do non-destructive resizing??
Date: Mon, 18 Nov 2002 16:53:44 +0300
Message-ID: <20021118165344.A14537@namesys.com>
References: <200211180851.54274.bestb@sympatico.ca>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12012-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200211180851.54274.bestb@sympatico.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bruce <bestb@sympatico.ca>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Nov 18, 2002 at 08:51:54AM -0500, Bruce wrote:

> Thanks; I ran 
> 	reiserfsck --rebuild-sb /de/hda2
> then tried to run 
> 	reiserfsck --rebuild-tree
> However, running the second came up with:
> Pass 0:
> ####### Pass 0 #######
> Loading on-disk bitmap .. ok, 1837081 blocks marked used
> Skipping 8373 blocks (super block, journal, bitmaps) 1828708 blocks will be 
> read
> 0%                                                      left 1823494, 2607 
> /sec
> bread: Cannot read a block # 17599.

Hm, this is a bad sign.
Try to run badblocks on yor drive.

Is there anything in kernel logs at this time?

Bye,
    Oleg
