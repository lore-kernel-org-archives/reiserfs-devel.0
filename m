From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [BUG] kernel 3.1.0 possible circular locking dependency detected
Date: Mon, 31 Oct 2011 08:08:55 -0700
Message-ID: <CA+55aFzuWD1xRhQNLfe0ey_-1vACwY=ofD5PXSzL_5UeDRbk8g@mail.gmail.com>
References: <4EAE5DE3.2020205@t-online.de>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:sender:in-reply-to:references:from:date
         :x-google-sender-auth:message-id:subject:to:cc:content-type;
        bh=sLX22z4Z0AQRxtWChf22qC9xEUA+Dl373OrZ6tjBMs8=;
        b=ixKRvU89fQevZ0k2wyocaw7bcmxBMe5xjl23gu1hWNnTQt2JJAgUHJ/xrNvTRgISfB
         XcEmrO2Lpjzgjb9xHPnXsrcz2Yr56GE4rPAFH2KXKIfRoNoU8siho4JalCeIDQtv/mb/
         Vnvc3nFQWJ+sSR/smpZK00okokQnZ7TZKFbrA=
In-Reply-To: <4EAE5DE3.2020205@t-online.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Knut Petersen <Knut_Petersen@t-online.de>
Cc: linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, Greg KH <gregkh@suse.de>, Al Viro <viro@zeniv.linux.org.uk>, Christoph Hellwig <hch@lst.de>, Frederic Weisbecker <fweisbec@gmail.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>

[ Added a few more people to the cc ]

On Mon, Oct 31, 2011 at 1:35 AM, Knut Petersen
<Knut_Petersen@t-online.de> wrote:
> After a " rm -r /verybigdir" (about 12G on a 25G reiserfs 3.6partition)
> I found the following report about a circular locking dependency in
> kernel 3.1.0

Heh. There is even a comment about the ordering violation:

/* We use I_MUTEX_CHILD here to silence lockdep. It's safe because xattr
 * mutation ops aren't called during rename or splace, which are the
 * only other users of I_MUTEX_CHILD. It violates the ordering, but that's
 * better than allocating another subclass just for this code. */

and apparently the comment is wrong: we *do* end up looking up xattrs
during splice, due to the security_inode_need_killpriv() thing.

So I think this needs a suid (or sgid) file that has xattrs and is removed.

That said, I suspect this is a false positive, because the actual
unlink can never happen while somebody is splicing to/from the same
file at the same time (because then the iput wouldn't be the last one
for the inode, and the file removal would be delayed until the file
has been closed for the last time).

But the hacky use of "I_MUTEX_CHILD" is basically not the proper way
to silence the lockdep splat.

Anybody?

                  Linus
