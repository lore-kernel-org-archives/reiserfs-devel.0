From: William Lee Irwin III <wli@holomorphy.com>
Subject: Re: silent semantic changes with reiser4
Date: Tue, 7 Sep 2004 20:03:42 -0700
Message-ID: <20040908030342.GW3106@holomorphy.com>
References: <200409070206.i8726vrG006493@localhost.localdomain> <413D4C18.6090501@slaphack.com> <413D4ED9.5090206@namesys.com> <20040907062806.GL3106@holomorphy.com> <20040907223801.GS3106@holomorphy.com> <20040908024319.GU3106@holomorphy.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21615-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040908024319.GU3106@holomorphy.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: David Masover <ninja@slaphack.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, Spam <spam@tnonline.net>, Tonnerre <tonnerre@thundrix.ch>, Christer Weinigel <christer@weinigel.se>, Linus Torvalds <torvalds@osdl.org>, Pavel Machek <pavel@ucw.cz>, Jamie Lokier <jamie@shareable.org>, Chris Wedgwood <cw@f00f.org>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On Tue, Sep 07, 2004 at 07:43:19PM -0700, William Lee Irwin III wrote:
> -	return (count_t)(max_off / device->blksize);
> +	return (size & ~4096ULL)/device->blksize;

Correcting this to return (size & ~4095ULL)/device->blksize does not
fix the coredumps.


-- wli
