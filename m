From: "Trenton D. Adams" <trenton.d.adams@gmail.com>
Subject: Re: [PATCH 1/2] kill-the-bkl/reiserfs: acquire the inode mutex safely
Date: Fri, 29 May 2009 22:23:44 -0600
Message-ID: <9b1675090905292123l7c3de4b6w897e153d60e5a469@mail.gmail.com>
References: <1242496922-6330-1-git-send-email-fweisbec@gmail.com>
	 <1242496922-6330-2-git-send-email-fweisbec@gmail.com>
	 <9b1675090905292005p2b53de7dy9e36f84368d76f01@mail.gmail.com>
	 <20090530032253.GA5999@nowhere>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=m3Iw0XCtJSmKh+2vOOE4sSGVSrKBkDFEi6Lg2Dy9oHc=;
        b=BGTlfuGu7Kh7R4g5ZyTZB1qfbEkagxCgxHVtOs4sehCffHgN4AjzXDjH/cGQka9+4a
         l+WwSyBJ585fx5UDnSQdSU8Ld9YtPJjg13/7Wic7l8fI/tbyzS9oXAUWlvfQpk9vd4tp
         8Jq84qu3aASMvS7mVQF1KHEKGe4JpiXKuQZHY=
In-Reply-To: <20090530032253.GA5999@nowhere>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Frederic Weisbecker <fweisbec@gmail.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Reiserfs <reiserfs-devel@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Jeff Mahoney <jeffm@suse.com>, Chris Mason <chris.mason@oracle.com>, Ingo Molnar <mingo@elte.hu>, Alexander Beregalov <a.beregalov@gmail.com>

On Fri, May 29, 2009 at 9:22 PM, Frederic Weisbecker <fweisbec@gmail.co=
m> wrote:
> On Fri, May 29, 2009 at 09:05:31PM -0600, Trenton D. Adams wrote:
>> On Sat, May 16, 2009 at 12:02 PM, Frederic Weisbecker
>> <fweisbec@gmail.com> wrote:
>> > While searching a pathname, an inode mutex can be acquired
>> > in do_lookup() which calls reiserfs_lookup() which in turn
>> > acquires the write lock.
>> >
>> > On the other side reiserfs_fill_super() can acquire the write_lock
>> > and then call reiserfs_lookup_privroot() which can acquire an
>> > inode mutex (the root of the mount point).
>> >
>> > So we theoretically risk an AB - BA lock inversion that could lead
>> > to a deadlock.
>> >
>> > As for other lock dependencies found since the bkl to mutex
>> > conversion, the fix is to use reiserfs_mutex_lock_safe() which
>> > drops the lock dependency to the write lock.
>> >
>>
>> I'm curious, did this get applied, and is it related to the followin=
g?
>> =A0I was having these in 2.6.30-rc3. =A0I am now on 2.6.30-rc7 as of
>> today. =A0I haven't seen them today. =A0But then again, I only seen =
this
>> happen one time.
>
>
> Hi,
>
> No, may be it will come for 2.6.31 but for now it is not merged so
> it's not related.
>
> If you see such warning anymore, don't hesitate to tell about
> it!
>
> Thanks!
>

I was trying to imply that the patch might fix the problem I saw, not
that it was the cause.  I only though that because it mentioned a
potential deadlock, and it seems like that is what the problem I saw
was.
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
