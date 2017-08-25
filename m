From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4[StorageManager(2383)]: lzo1_alloc
Date: Fri, 25 Aug 2017 18:22:05 +0200
Message-ID: <9cff1013-fc3c-ea1b-8fd4-6f0ca0c0c698@gmail.com>
References: <20170825044258.9CC6C399950@huitzilopochtli.metztli-it.com>
 <CAMDqdwxyR7nFy66chkkfVCRVHKA_PHoTosMrynXvvRRiDB-q7Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=isKzzSftFgBwEnqmpwy/xA7EjB10wJ2+moQbfI5wKdA=;
        b=TqAV4YnLEtDGg0FnInLAVT5rkAi/Ux7lBXVlMx1d0v+qtacSCBVK2fyYg7+NpzJTRW
         7SDGr9J7bkDHwUgFUMkvi1WaUbRXC8cEzXBXJX3KQGtOQPKVNomgC99qL4XMSJLkSlBk
         Phy/OeBu6HzAv9eDPSFq33RZhNJIDuG9HaQi/UDjinfY8sMQrTYb93Hk6wv9VnuAmTw0
         G5b1sjwGlm4nVOOcz9RNTJG2EWl0c1WStBWyz6Fk9LpePOMPNAV5XvRWROA5DKe/tFe0
         GwnzOsQ3dKy1is0v5i4NFGwR+CNkgf4cZ8Igtp/Bs8hTEY1Zzx8XjMyfOjTAtVeRp5yo
         jesQ==
In-Reply-To: <CAMDqdwxyR7nFy66chkkfVCRVHKA_PHoTosMrynXvvRRiDB-q7Q@mail.gmail.com>
Content-Language: en-US
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?UTF-8?Q?Mathieu_B=c3=a9langer?= <b747xx@gmail.com>, Metztli Information Technology <jose@huitzilopochtli.metztli-it.com>
Cc: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

As a possible fixup we can leave data uncompressed.
I think it is rather rare event (the flood of warnings is because
of inability to allocate workspace for the same chunk of data.

Edward.

On 08/25/2017 06:49 AM, Mathieu B=C3=A9langer wrote:
> I did have that bug specifically with Chromium too, I did initial try=20
> to test by disabling ALSR (I was suspecting the Ryzen silicon bug that=20
> finally can be RMA).
> But disabling ALSR caused more problem so ...
>
> I did "fix" the issue by recompiling Chromium with -O2 instead of -O3.
>
> And I do have similar problem with Firefox 57 compiled with -O3 (Again=20
> -O2 fix it and Firefox 55 with -O3 is not affected)
>
> On Thu, Aug 24, 2017 at 11:42 PM, Metztli Information Technology=20
> <jose@huitzilopochtli.metztli-it.com=20
> <mailto:jose@huitzilopochtli.metztli-it.com>> wrote:
>
>
>
>     On Thu, Aug 24, 2017 at 6:01 AM, Edward Shishkin
>     <edward.shishkin@gmail.com <mailto:edward.shishkin@gmail.com>> wrote:
>     > So, memory allocation policy got changed in the upstream,
>     > and we need to perform pre-allocation to not fail at flush time.
>     > I am sorry, but right now I don't have a time for this..
>     No worries, sir. I simply fulfilled your request for feedback.
>
>     Background for this test was to evaluate 2TB maximum slice allowed
>     by Google Compute Engine in cloud instances, specifically Debian
>     with transparent compression reiser4.
>
>     Currently, (default) transparent compression reiser4 formatting is
>     not available[1] in my custom Debian-Installer (d-i) but planned
>     to make available in a future implementation.
>
>     >
>     >
>     > On 08/24/2017 06:59 AM, Metztli Information Technology wrote:
>     >>
>     >> Much appreciated, Ed-
>     >>
>     >> Noticed improvement, notwithstanding...
>     >>
>     >> Context:
>     >>
>     >> uname -a
>     >> Linux huitzilopochtli 4.12.0-1+reiser4.0.1-amd64 #1 SMP Debian
>     >> 4.12.6-3+reiser4.0.1 (2017-08-14) x86_64 GNU/Linux
>     >>
>     >> (I have reinstalled same kernel two times after patching so the
>     above
>     >> string retained the older original kernel installation date.
>     >> but
>     >> uname -v
>     >> #1 SMP Debian 4.12.6-3...[means upgrade '-3' reflects fact that
>     I rebuilt
>     >> fs with your latest two(2) patches to address the issue.])
>     >>
>     >>
>     >>   ls -ltc /lib/modules/4.12.0-1*64/kernel
>     >> total 18
>     >> drwxr-xr-x 14 root root 16 Aug 23 02:14 sound/
>     >> drwxr-xr-x  5 root root 24 Aug 23 02:13 lib/
>     >> drwxr-xr-x  2 root root  4 Aug 23 02:13 mm/
>     >> drwxr-xr-x 60 root root 62 Aug 23 02:13 fs/
>     >> drwxr-xr-x  3 root root 73 Aug 23 02:13 crypto/
>     >> drwxr-xr-x  2 root root  4 Aug 23 02:13 block/alloc workspace
>     >> drwxr-xr-x 51 root root 51 Aug 18 17:02 net/
>     >> drwxr-xr-x  3 root root  3 Aug 18 17:02 virt/
>     >> drwxr-xr-x 70 root root 70 Aug 18 17:02 drivers/
>     >> drwxr-xr-x  3 root root  3 Aug 18 17:02 arch/
>     >>
>     >> After applying (fs/) patches and rebooting, I began to apply
>     load to the
>     >> machine where with previous kernel I had already built
>     GCC-5-branch and
>     >> Apache OpenOffice. Memory is limited to 16Gb RAM; copy
>     operations were
>     >> started from 1TB USB disk to local reiser4 transparent
>     compression, a  16Gb
>     >> data copy to same local filesystem, began a 2Gb svn download,
>     etc.; I had
>     >> Firefox open with several tabs open and launched chromium
>     browser -- which
>     >> began producing relevant feedback. I have set a two(2) thousand
>     lines limit
>     >> output in my shell so that is the reason *all* of the below
>     WARNINGS repeat
>     >> that number of times.
>     >>
>     >> Chromium browser launched but app did not open in the GUI and
>     got stuck
>     >> with un-killable processes (memory starvation?):
>     >>
>     >> % kill -9 $(pgrep chromium)
>     >> % pgrep chromium
>     >> 6320
>     >> 6743
>     >> 6814
>     >> 7050
>     >>
>     >> Subsequently dmesg showed (<process number>) none necessarily
>     in the order
>     >> below as dmesg alternated in producing sequence:
>     >>
>     >> [ 6175.145234] reiser4[chromium(7050)]: lzo1_alloc
>     >>
>     (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compres=
s.c:241)[edward-878]:
>     >>                 WARNING: alloc workspace for lzo1 (tfm action =3D
>     1) failed
>     >>
>     >> [ 6175.145248] reiser4[chromium(7050)]: lzo1_alloc
>     >>
>     (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compres=
s.c:241)[edward-878]:
>     >>                 WARNING: alloc workspace for lzo1 (tfm action =3D
>     1) failed
>     >>
>     >> [ 6175.145261] reiser4[chromium(7050)]: lzo1_alloc
>     >>
>     (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compres=
s.c:241)[edward-878]:
>     >>                 WARNING: alloc workspace for lzo1 (tfm action =3D
>     1) failed
>     >>
>     >> [ 6175.145275] reiser4[chromium(7050)]: lzo1_alloc
>     >>
>     (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compres=
s.c:241)[edward-878]:
>     >>                 WARNING: alloc workspace for lzo1 (tfm action =3D
>     1) failed
>     >>
>     >> (snip)
>     >>
>     >> [ 7116.052780] reiser4[TaskSchedulerBa(6793)]: lzo1_alloc
>     >>
>     (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compres=
s.c:241)[edward-878]:
>     >>                 WARNING: alloc workspace for lzo1 (tfm action =3D
>     1) failed
>     >>
>     >> [ 7116.053021] reiser4[TaskSchedulerBa(6793)]: lzo1_alloc
>     >>
>     (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compres=
s.c:241)[edward-878]:
>     >>                 WARNING: alloc workspace for lzo1 (tfm action =3D
>     1) failed
>     >>
>     >> [ 7116.053044] reiser4[TaskSchedulerBa(6793)]: lzo1_alloc
>     >>
>     (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compres=
s.c:241)[edward-878]:
>     >>                 WARNING: alloc workspace for lzo1 (tfm action =3D
>     1) failed
>     >>
>     >> [ 7116.055925] reiser4[TaskSchedulerBa(6793)]: lzo1_alloc
>     >>
>     (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compres=
s.c:241)[edward-878]:
>     >>                 WARNING: alloc workspace for lzo1 (tfm action =3D
>     1) failed
>     >>
>     >> (snip)
>     >>
>     >> [ 7309.117294] reiser4[Chrome_DBThread(6796)]: lzo1_alloc
>     >>
>     (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compres=
s.c:241)[edward-878]:
>     >>                 WARNING: alloc workspace for lzo1 (tfm action =3D
>     1) failed
>     >>
>     >> [ 7309.117305] reiser4[Chrome_DBThread(6796)]: lzo1_alloc
>     >>
>     (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compres=
s.c:241)[edward-878]:
>     >>                 WARNING: alloc workspace for lzo1 (tfm action =3D
>     1) failed
>     >>
>     >> [ 7309.117316] reiser4[Chrome_DBThread(6796)]: lzo1_alloc
>     >>
>     (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compres=
s.c:241)[edward-878]:
>     >>                 WARNING: alloc workspace for lzo1 (tfm action =3D
>     1) failed
>     >>
>     >> [ 7309.117327] reiser4[Chrome_DBThread(6796)]: lzo1_alloc
>     >>
>     (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compres=
s.c:241)[edward-878]:
>     >>                 WARNING: alloc workspace for lzo1 (tfm action =3D
>     1) failed
>     >>
>     >> [ 7309.117338] reiser4[Chrome_DBThread(6796)]: lzo1_alloc
>     >>
>     (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compres=
s.c:241)[edward-878]:
>     >>                 WARNING: alloc workspace for lzo1 (tfm action =3D
>     1) failed
>     >>
>     >> (snip)
>     >>
>     >> [ 7550.849425] reiser4[Chrome_HistoryT(6828)]: lzo1_alloc
>     >>
>     (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compres=
s.c:241)[edward-878]:
>     >>                 WARNING: alloc workspace for lzo1 (tfm action =3D
>     1) failed
>     >>
>     >> [ 7550.849436] reiser4[Chrome_HistoryT(6828)]: lzo1_alloc
>     >>
>     (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compres=
s.c:241)[edward-878]:
>     >>                 WARNING: alloc workspace for lzo1 (tfm action =3D
>     1) failed
>     >>
>     >> [ 7550.849446] reiser4[Chrome_HistoryT(6828)]: lzo1_alloc
>     >>
>     (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compres=
s.c:241)[edward-878]:
>     >>                 WARNING: alloc workspace for lzo1 (tfm action =3D
>     1) failed
>     >>
>     >> [ 7550.849457] reiser4[Chrome_HistoryT(6828)]: lzo1_alloc
>     >>
>     (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compres=
s.c:241)[edward-878]:
>     >>                 WARNING: alloc workspace for lzo1 (tfm action =3D
>     1) failed
>     >> (snip)
>     >>
>     >>
>     >> On Tue, Aug 22, 2017 at 11:49 AM, Edward Shishkin
>     >> <edward.shishkin@gmail.com <mailto:edward.shishkin@gmail.com>>
>     wrote:
>     >>>
>     >>> Hello,
>     >>>
>     >>> Please, try the attached patches.
>     >>> The first patch improves responsiveness to vm subsystem
>     >>> (modified version of ->migratepage() from Ivan Shapovalov).
>     >>> The second patch performs memory allocation in the critical
>     >>> place with __GFP_NOFAIL flag.
>     >>> Let us know about results.
>     >>>
>     >>> Thanks,
>     >>> Edward.
>     >>
>     >> []
>     >>>>
>     >>>> Your input would be greatly appreciated:
>     >>>>
>     >>>> [ 3449.944653] reiser4[StorageManager(2383)]: lzo1_alloc
>     >>>>
>     >>>>
>     (/mnt/chiucuetetl/usr/src/linux/fs/reiser4/plugin/compress/compress.c=
:241)[edward-878]:
>     >>>>                  WARNING: alloc workspace for lzo1 (tfm
>     action =3D 1)
>     >>>> failed
>     >>>>
>     >>>> [ 3449.944674] reiser4[StorageManager(2383)]: lzo1_alloc
>     >>>>
>     >>>>
>     (/mnt/chiucuetetl/usr/src/linux/fs/reiser4/plugin/compress/compress.c=
:241)[edward-878]:
>     >>>>                  WARNING: alloc workspace for lzo1 (tfm
>     action =3D 1)
>     >>>> failed
>     >>>>
>     >>>> [ 3449.944694] reiser4[StorageManager(2383)]: lzo1_alloc
>     >>>>
>     >>>>
>     (/mnt/chiucuetetl/usr/src/linux/fs/reiser4/plugin/compress/compress.c=
:241)[edward-878]:
>     >>>>                  WARNING: alloc workspace for lzo1 (tfm
>     action =3D 1)
>     >>>> failed
>     >>>>
>     >>>> [ 3449.944715] reiser4[StorageManager(2383)]: lzo1_alloc
>     >>>>
>     >>>>
>     (/mnt/chiucuetetl/usr/src/linux/fs/reiser4/plugin/compress/compress.c=
:241)[edward-878]:
>     >>>>                  WARNING: alloc workspace for lzo1 (tfm
>     action =3D 1)
>     >>>> failed
>     >>>>
>     >>>> [snip]
>     >>
>     >> This time dmesg did not output any references to
>     [StorageManager(<pid>)]
>     >>
>     >>
>     [1] but default reiser4 formatting can be performed from the
>     command line in another virtual terminal.
>
>     Best Professional Regards.
>
>     --
>     Jose R R
>     http://metztli.it
>     ---------------------------------------------------------------------=
------------------------
>     Download Metztli Reiser4: Debian Stretch with Linux 4.12
>     ---------------------------------------------------------------------=
------------------------
>     for AMD64 https://sf.net/projects/metztli-reiser4/
>     <https://sf.net/projects/metztli-reiser4/>
>     ---------------------------------------------------------------------=
------------------------
>     Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
>     ---------------------------------------------------------------------=
------------------------
>     from our GitHub http://Nepohualtzintzin.com repository. Cloud the
>     easy way!
>     --
>     To unsubscribe from this list: send the line "unsubscribe
>     reiserfs-devel" in
>     the body of a message to majordomo@vger.kernel.org
>     <mailto:majordomo@vger.kernel.org>
>     More majordomo info at http://vger.kernel.org/majordomo-info.html
>     <http://vger.kernel.org/majordomo-info.html>
>
>

