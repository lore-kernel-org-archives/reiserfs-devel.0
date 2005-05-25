From: Arjan van de Ven <arjan@infradead.org>
Subject: Re: BUG() in radix-tree.c, 2.6.11, reiserfs ?
Date: Wed, 25 May 2005 08:18:06 +0200
Message-ID: <1117001887.6010.34.camel@laptopd505.fenrus.org>
References: <20050524224802.GA11957@diamant.rubis.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24137-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050524224802.GA11957@diamant.rubis.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Stephane Jourdois <kwisatz@rubis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, reiserfs-list@namesys.com

On Wed, 2005-05-25 at 00:48 +0200, Stephane Jourdois wrote:
> Hello all,
> 
> I was burning a DVD-R at 16x speed on IDE, the .iso was on /dev/sda1,
> which is a reiserfs part on a SATA disk.  I was at the same time
> building another .iso on /dev/sda1, with files from an lvm spawned on
> /dev/sd{b,c,d}.

I suggest you try it again but without the "evil" nvidia driver.


