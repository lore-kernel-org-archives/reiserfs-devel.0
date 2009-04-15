From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: Re: [tree] latest kill-the-BKL tree, v12
Date: Thu, 16 Apr 2009 02:58:44 +0400
Message-ID: <a4423d670904151558r4252c7eamd115793fb36a9163@mail.gmail.com>
References: <1239680065-25013-1-git-send-email-fweisbec@gmail.com>
	 <20090414045109.GA26908@orion> <20090414090146.GH27003@elte.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=tAH7p8uaxwTXHzJpS2RoAkgmNuDfJA4MpS9LicElWH0=;
        b=F9XCD6zBKEU9U4WA7GbUDfA2ElcyX6skXbVhuvN8bJctmsLwgZLuvpFtncL6WyB3Dk
         m935YjJ6dAhZ4h9apsvqWNnKi2LPEoYAncbsi+7y5NGir1hdinnzdp8NTGHTzH4kobN0
         1ECw4aXO2P37BM5FgoHta6+gtf6wkscV1MJKA=
In-Reply-To: <20090414090146.GH27003@elte.hu>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Ingo Molnar <mingo@elte.hu>
Cc: Frederic Weisbecker <fweisbec@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Alessio Igor Bogani <abogani@texware.it>, Jeff Mahoney <jeffm@suse.com>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Chris Mason <chris.mason@oracle.com>

2009/4/14 Ingo Molnar <mingo@elte.hu>:
>
> * Alexander Beregalov <a.beregalov@gmail.com> wrote:
>
>> On Tue, Apr 14, 2009 at 05:34:22AM +0200, Frederic Weisbecker wrote:
>> > Ingo,
>> >
>> > This small patchset fixes some deadlocks I've faced after trying
>> > some pressures with dbench on a reiserfs partition.
>> >
>> > There is still some work pending such as adding some checks to ens=
ure we
>> > _always_ release the lock before sleeping, as you suggested.
>> > Also I have to fix a lockdep warning reported by Alessio Igor Boga=
ni.
>> > And also some optimizations....
>> >
>> > Thanks,
>> > Frederic.
>> >
>> > Frederic Weisbecker (3):
>> > =C2=A0 kill-the-BKL/reiserfs: provide a tool to lock only once the=
 write lock
>> > =C2=A0 kill-the-BKL/reiserfs: lock only once in reiserfs_truncate_=
file
>> > =C2=A0 kill-the-BKL/reiserfs: only acquire the write lock once in
>> > =C2=A0 =C2=A0 reiserfs_dirty_inode
>> >
>> > =C2=A0fs/reiserfs/inode.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 10 =
+++++++---
>> > =C2=A0fs/reiserfs/lock.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0=
 26 ++++++++++++++++++++++++++
>> > =C2=A0fs/reiserfs/super.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 15 =
+++++++++------
>> > =C2=A0include/linux/reiserfs_fs.h | =C2=A0 =C2=A02 ++
>> > =C2=A04 files changed, 44 insertions(+), 9 deletions(-)
>> >
>>
>> Hi
>>
>> The same test - dbench on reiserfs on loop on sparc64.
>>
>> [ INFO: possible circular locking dependency detected ]
>> 2.6.30-rc1-00457-gb21597d-dirty #2
>
> I'm wondering ... your version hash suggests you used vanilla
> upstream as a base for your test. There's a string of other fixes
> from Frederic in tip:core/kill-the-BKL branch, have you picked them
> all up when you did your testing?
>
> The most coherent way to test this would be to pick up the latest
> core/kill-the-BKL git tree from:
>
> =C2=A0 git://git.kernel.org/pub/scm/linux/kernel/git/tip/linux-2.6-ti=
p.git core/kill-the-BKL
>

I did not know about this branch, now I am testing it and
there is no more problem with that testcase (dbench).

I will continue testing.

Thanks.
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
