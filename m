From: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Subject: Re: [RFC 1/1] fs/reiserfs/journal.c: Remove obsolete  __GFP_NOFAIL
Date: Mon, 24 Mar 2014 14:00:01 +0000
Message-ID: <20140324140001.00200e83@alan.etchedpixels.co.uk>
References: <20140321171830.ef47fdea1a3a2f2921c8fe86@skynet.be>
	<20140321130055.c0ea32946f3543cd7f6bedd6@linux-foundation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20140321130055.c0ea32946f3543cd7f6bedd6@linux-foundation.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Fabian Frederick <fabf@skynet.be>, linux-kernel <linux-kernel@vger.kernel.org>, reiserfs-devel@vger.kernel.org

> The whole point of __GFP_NOFAIL is to centralise this
> wait-for-memory-for-ever operation.  So it is implemented in a common
> (core) place and so that we can easily locate these problematic
> callers.

For reiserfs I'm not sure it's worth bothering. If you get an out of
memory or disk caused block read failure in the wrong location it'll copy
random data over low physical memory (its one of several filesystems
which happily memcpy to errno values)

Making reiserfs go away would be a much better long term option IMHO

Alan
