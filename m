From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH RFC]  buffer_head: remove redundant test from
 wait_on_buffer
Date: Mon, 7 Jun 2010 13:24:00 -0700
Message-ID: <20100607132400.492613f1.akpm@linux-foundation.org>
References: <1271415499.2075.19.camel@localhost>
	<20100416145123.283f216c.akpm@linux-foundation.org>
	<xr93ljbbw3u8.fsf@ninji.mtv.corp.google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <xr93ljbbw3u8.fsf@ninji.mtv.corp.google.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Greg Thelen <gthelen@google.com>
Cc: Richard Kennedy <richard@rsk.demon.co.uk>, Alexander Viro <viro@zeniv.linux.org.uk>, Jens Axboe <jens.axboe@oracle.com>, lkml <linux-kernel@vger.kernel.org>, Nick Piggin <npiggin@suse.de>, Jeff Mahoney <jeffm@suse.com>, reiserfs-devel@vger.kernel.org

On Sat, 22 May 2010 23:05:03 -0700
Greg Thelen <gthelen@google.com> wrote:

> > --- a/fs/buffer.c~buffer_head-remove-redundant-test-from-wait_on_buffer-fix
> > +++ a/fs/buffer.c
> > @@ -90,6 +90,12 @@ EXPORT_SYMBOL(unlock_buffer);
> >   */
> >  void __wait_on_buffer(struct buffer_head * bh)
> >  {
> > +	/*
> > +	 * Calling wait_on_buffer() against a zero-ref buffer is a nasty bug
> > +	 * because it will almost always "work".  However this buffer can be
> > +	 * reclaimed at any time.  So check for it.
> > +	 */
> > +	VM_BUG_ON(atomic_read(&bh->b_count) == 0);
> 
> My system is failing this VM_BUG_ON() occasionally.  I think this is due to
> wait_on_buffer() calls with b_count=0 from locations within fs/buffer.c.

Thanks.

Yup, the buffers are protected by lock_page().

> These
> occasional b_count=0 callers are caused by buf reads that complete quickly -
> after the I/O is issued but before it is waited upon.  Such fs/buffer.c callers
> need to either bypass this assertion or increment b_count.  I don't think they
> need to grab an b_count reference.  I suggest a bypass routine in the patch
> below.  Does this look good?

I think I'll just drop
buffer_head-remove-redundant-test-from-wait_on_buffer-fix.patch and
wait_on_buffer-remove-the-buffer_locked-test.patch.

