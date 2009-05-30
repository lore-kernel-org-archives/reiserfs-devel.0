From: "Trenton D. Adams" <trenton.d.adams@gmail.com>
Subject: Re: [PATCH 1/2] kill-the-bkl/reiserfs: acquire the inode mutex safely
Date: Sat, 30 May 2009 12:07:57 -0600
Message-ID: <9b1675090905301107t4884caccn937b0ccfd100d6aa@mail.gmail.com>
References: <1242496922-6330-1-git-send-email-fweisbec@gmail.com>
	 <1242496922-6330-2-git-send-email-fweisbec@gmail.com>
	 <9b1675090905292005p2b53de7dy9e36f84368d76f01@mail.gmail.com>
	 <20090530032253.GA5999@nowhere>
	 <9b1675090905292123l7c3de4b6w897e153d60e5a469@mail.gmail.com>
	 <20090530134132.GA5969@nowhere>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=jYqG220vt7VpZEXKLjMKxLHiyIoh60HBb0k7NsnblYQ=;
        b=x4mu5JwVygxAfAQhywLzopmZjk8AfUyk/eX82+hlA2WmHIyil5X/wkfhACC3tLjxEz
         GxSXgpWQo0Gj2YDAlsgE61kvh8u687sJirEbrHTdvrpEJUqIdlhS3fMhI5G4OwTNpbqT
         IwbDL1cFZyj+uti6IJUnbBqbLzjD2J0d5LsuE=
In-Reply-To: <20090530134132.GA5969@nowhere>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Frederic Weisbecker <fweisbec@gmail.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Reiserfs <reiserfs-devel@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Jeff Mahoney <jeffm@suse.com>, Chris Mason <chris.mason@oracle.com>, Ingo Molnar <mingo@elte.hu>, Alexander Beregalov <a.beregalov@gmail.com>

On Sat, May 30, 2009 at 7:41 AM, Frederic Weisbecker <fweisbec@gmail.co=
m> wrote:
> On Fri, May 29, 2009 at 10:23:44PM -0600, Trenton D. Adams wrote:
>>
>> I was trying to imply that the patch might fix the problem I saw, no=
t
>> that it was the cause. =A0I only though that because it mentioned a
>> potential deadlock, and it seems like that is what the problem I saw
>> was.
>
>
> Ah ok. No it's part of a tree which reworks the reiserfs locking sche=
me
> by removing the old one based on the legacy and obsolete bkl (big ker=
nel
> lock). In this tree I had to fix several deadlocks or at least unsafe
> lock states because the bkl is converted into a mutex and some new lo=
ck
> dependencies were borned after that. But these issues had nothing
> to deal with upstream problems.
>
> BTW, would you be interested in giving a try with this reiserfs bkl
> removal tree? I really lack testing and feedbacks from users.

Well, the problem is that I only use reiserfs on my usb stick at the
moment.  So, the amount of testing I could do would be minimal at the
moment.  However, if I change my local filesystems to reiserfs, I will
remember to check back here for your patch.

Thanks.
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
