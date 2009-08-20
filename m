From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: linux-next: reiserfs lockout with xattr ?
Date: Thu, 20 Aug 2009 16:32:09 +0200
Message-ID: <20090820143207.GB6389@nowhere>
References: <4A79CA90.8080101@free.fr> <20090808002726.GI4999@nowhere> <4A7E9C63.4090400@free.fr> <20090809233302.GD6089@nowhere> <4A807E3A.8050703@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:date:from:to:cc
         :subject:message-id:references:mime-version:content-type
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Iv8o34bEZr03wP/2YvSBa8pCz9xrf31eYiXQf5XpbBY=;
        b=e+va0Vq3hn3sDKCJFed5WRNAoPfwJSSCYkbIA4SYHw1rmtRD43hYTVhcgPBAmFyEpu
         ydhNnVTd0+LyfR+NywMa6i5SSHP2YEZmd/YIIK6aOIfNdbdqGitrOVjWXrSLTI/aFToJ
         cFiYAQUDqBPid3E29/SwuPuoI4T00AfL4wgHI=
Content-Disposition: inline
In-Reply-To: <4A807E3A.8050703@free.fr>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Laurent Riffard <laurent.riffard@free.fr>
Cc: Kernel development list <linux-kernel@vger.kernel.org>, ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

On Mon, Aug 10, 2009 at 10:08:26PM +0200, Laurent Riffard wrote:
> Le 10/08/2009 01:33, Frederic Weisbecker a =E9crit :
> >=20
> > Thanks a lot for this report. Reiserfs xattrs are definetly paths I
> > haven't tested deeply.
> >=20
> > I'm trying to reproduce these issues and will let you know once I g=
et
> > a fix.
> >=20
> > (Btw, if you're still running this tree, you should update with the
> > latest patch I just pushed, it's a very important fix).
> >=20
> > Thanks,
> >=20
> > Frederic.
>=20
> I tried with your lastest patch (git head is at "kill-the-bkl/reiserf=
s:=20
> fix early readdir offset increment"), and the lockout still happens.
>=20
> ~~
> laurent


Ok, it looks like the last two patches in my tree have introduced a loc=
king
inversion dependency between the reiserfs write lock and mm->mmap_sem.

In filldir, we take the reiserfs lock and we might take mm->mmap_sem if
we fault while copying the dir entry to the user.

In mmap, the mm->mmap_sem is taken before the call to the fs mmap callb=
ack
and there we take the reiserfs lock.

Locking inversion: AB - BA

What is really sad here is that I have no choice: I can't take the reis=
erfs lock
while filling a dir entry to the user.
This part, introduced in the last two patches of the tree optimized a l=
ot
the throughput, and now I have to revert them :-(

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
