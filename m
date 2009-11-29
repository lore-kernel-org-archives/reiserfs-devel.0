From: Dushan Tcholich <dusanc@gmail.com>
Subject: Re: Fw: reiser4 git repo
Date: Sun, 29 Nov 2009 22:44:24 +0100
Message-ID: <a08621850911291344gd99b9bav21d317d15c862c80@mail.gmail.com>
References: <20091127155148.dcc5cdee.buchner.johannes@gmx.at>
	 <20091127030050.GC5406@nowhere>
	 <20091128081440.36265403.buchner.johannes@gmx.at>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=5MGOSzyFY1KeX8W+G0d649RTIQ7iUnzdW0Ivgu9/QUY=;
        b=yFUz9CeJ6nwNnl4VhUSrk+GE9PsCLUzFMkTXmcpaWs0AoPz6MTjNbLFIXl6xYQ37JA
         yygduoRTzwp58x9X+czw68ww7/6JW+1enoagxqj6JexyFLpaWU6HV9XPnEJe6omjdwOF
         zJCH6jPBtio1cEjW6Lcvo1qXgK4PxMJagLf94=
In-Reply-To: <20091128081440.36265403.buchner.johannes@gmx.at>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Johannes Buchner <buchner.johannes@gmx.at>
Cc: Frederic Weisbecker <fweisbec@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

On Fri, Nov 27, 2009 at 8:14 PM, Johannes Buchner
<buchner.johannes@gmx.at> wrote:
> Hi,
>

Hello

> I had some issues with the reiser4 patch series from -mm.
> First of all, I'm not sure what release they are based on. I used
> a8a8a669e from Linus' git repository. I applied all reiser4 patches
> (except reiser4-disable of course) from
> http://userweb.kernel.org/~akpm/mmotm/, which worked fine.
>
> I think these patches are based on the reiser4-2.6.30 patch.
> I also compared them to the reiser4-2.6.31 patch, which adds some
> missing pieces ([1] reiser4-from-2.6.31-patch.patch).
>
> Additionally, some recent commits demand some changes, especially
> since current_is_pdflush and generic_sync_sb_inodes are not available
> any more (d8a8559cd7a9cc).
> [2] reiser4-pdflush-comments.patch only fixes some comments which sti=
ll
> mention pdflush.
> In [3] reiser4-generic_sync_sb_inodes.patch I tried to
> replace generic_sync_sb_inodes. I am not 100% sure that this is
> correct, but that is what I understood from the commit diff+message o=
f
> d8a8559cd7a9cc.
>
> The original patch
> 'reiser4-vfs-add-super_operationssync_inodes' introduced the call fro=
m
> sync_inodes_sb to the super operation sync_inodes(sb, NULL). This NUL=
L
> pointer is dereferenced in reiser4_sync_inodes, which is fixed by
> [4] reiser4-sync_inodes-null-dereference.patch.
>
> All 4 additional patches are attached. I can only say that it works o=
n
> my machine, before I had compilation issues and freezes on 'sync'.
>
> Cheers,
> Johannes
>
> PS: The git repo mentioned in
> http://userweb.kernel.org/~akpm/mmotm/mmotm-readme.txt is not availab=
le.
>

Yeah, you can find it now at git.zen-kernel.org. They had to switch the=
 adress.

Have fun

Dushan


> On Fri, 27 Nov 2009 04:00:51 +0100
> Frederic Weisbecker <fweisbec@gmail.com> wrote:
>
>> On Fri, Nov 27, 2009 at 03:51:48PM +1300, Johannes Buchner wrote:
>> > [ I sent this 2 days ago to linux-fsdevel@vger.kernel.org, maybe
>> > I'll get more responses in here. ]
>> >
>> > Hi!
>> >
>> > I would like to keep a git repo up to date with current kernel
>> > development, with reiser4 patched in. I am having trouble finding =
a
>> > repo that provides reiser4. Is there one?
>> >
>> > Some people may have noticed the last patch doesn't apply cleanly
>> > anymore. I made a few lines of modifications in my local repo. May=
be
>> > that repo would be interesting for others too*.
>> >
>> > I plan to catch up with changes from kernel development on a
>> > daily/weekly basis; my /home partition is reiser4, so I am fairly
>> > serious about it.
>> >
>> > At the moment, I fetch from torvalds/linux-2.6.git and
>> > stable/linux-2.6.31.y.git. Am I missing any other repositories tha=
t
>> > I should try to keep up with? (A fs subsystem maintainer repo?)
>> > next/linux-next.git is probably moving too fast for me.
>>
>>
>> You can try the -mm tree, the reiser 4 patches can be found inside:
>>
>> http://userweb.kernel.org/~akpm/mmotm/
>
> --
> Emails k=C3=B6nnen ge=C3=A4ndert, gef=C3=A4lscht und eingesehen werde=
n. Signiere oder
> versch=C3=BCssele deine Mails mit GPG.
> http://web.student.tuwien.ac.at/~e0625457/pgp.html
>
>
>
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
