From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [BUG 3.13.0-rc6] reiserfs possible circular locking dependency
Date: Fri, 3 Jan 2014 11:46:29 -0800
Message-ID: <CA+55aFxVs_aGnMdcTck3C7AayFrjX=GrFSwmJwiC9q3-3wySgw@mail.gmail.com>
References: <52C70C75.4050502@t-online.de>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=/67PxmLUZqzHUoBmtwSG/eBila1xyES/bv8wpr7eE38=;
        b=pMInRSrfpg8yQ6HMhcgoP+6WUeT4VPkRFbkxDfZ56pMFIyCjY925FdV3bZwwxdn/La
         441hQGBo9/wB0oyZozgNw0yiJ1m45ijKaIBZ2VnRRRCNqFelKHldL7JZ3o1KbASQH1Ry
         fuUtLJfYKxJ0VLX/EvtNbOwISWLtmTkcsH/KlLW76H5h9+HfnmF3a6dftjwUn3MqG//X
         T/GlF4Sck9+hwJ3ZtqFesDrrDrF2+aoSTOOH1x1Fl7UQhczREYmnAxGhsUH3JESwBX8/
         2XAjrwCeDETsiRVZ2r5645iXzYbSCVFjV0HAXhtYDeAXTRSUL3Nqo+wOQunTEnsdvUAP
         WqrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=/67PxmLUZqzHUoBmtwSG/eBila1xyES/bv8wpr7eE38=;
        b=Yy5UztS30OpHO1c6SkBKiBRg3+R8MjS7NMviE3+NP/YWYC9edcuBhEabMC5XxuRkvs
         BeGNKbNhQ4x+zGoVUVlt9C9XSJ1qX7HK01wZGpLfl2W2V6YJG/lcv89EAc6YmPxcoWHy
         unK0WUnnN1B/KxVrplC3/7Fq0ZB3XhcvJLSLs=
In-Reply-To: <52C70C75.4050502@t-online.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Knut Petersen <Knut_Petersen@t-online.de>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, Jeff Mahoney <jeffm@suse.com>, reiserfs-devel@vger.kernel.org

On Fri, Jan 3, 2014 at 11:16 AM, Knut Petersen
<Knut_Petersen@t-online.de> wrote:
> Rebooting after a power failure on an openSuSE 13.1 system
> with kernel 3.13.0-rc6 triggered the attached lockdep warning.

Hmm. It seems to be that the *normal* sequence should be:

 - get i_mutex, call lookup, which gets sbi->lock (reiserfs_write_lock)

but in the mounting path, we have special circumstances.

That finish_unfinished() function does

 - reiserfs_write_lock_nested() .
 - remove_save_link
 - iput(inode) with the write lock held

and that can apparently end up taking i_mutex in open_xa_dir (and then
recursively the write lock, but that's an explicitly recursive lock,
so that part should be ok).

Now, I don't think this can *really* deadlock with the normal order of
operations, because during mounting there is no other process that can
take those in the reverse order (since the filesystem isn't live), but
I do wonder if we should just release the reiserfs write lock over the
iputs. We release it in other parts anyway (like for the quota off)

Jeff, you already touched this exact case in commit d2d0395fd177
("reiserfs: locking, release lock around quota operations") except
that was for those quota operation cases.

Even if it's not a real problem, making lockdep happy sounds like a
good idea. Of course, the trouble is that this code path almost never
gets exercised (which is why this hasn't been noticed earlier), so
testing...

Jeff? Comments?

             Linus
