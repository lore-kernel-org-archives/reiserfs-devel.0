From: jose@huitzilopochtli.metztli-it.com (Metztli Information Technology)
Subject: Re: reiser4[StorageManager(2383)]: lzo1_alloc
Date: Sat, 26 Aug 2017 00:15:42 -0700 (PDT)
Message-ID: <20170826071542.2E2333BC3E6@huitzilopochtli.metztli-it.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mixtli.metztli.it; q=dns/txt;
 s=mx; t=1503731748; h=From: Date: Message-Id: To: Subject: Sender;
 bh=pRBsbXk7svzxl0chZP+/MNh6F0wpr2yVvnyv1eB7e8c=; b=jbtRWfuFIOQEFz7zI9YfBY2krURS/yyihIDgbG7sL1GH/g7+2VDDas38cO8H8kg91cy2bbcb
 xjfMY93ea45/G2Tr2uB5CHjRtyoqGSsHAxW8Tg5md2mLSRbVlVsEF1pTlTLDjiqPldpPer56
 cONecrRGYjUCmkXgCZDeJv2c1bY=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: edward.shishkin@gmail.com, b747xx@gmail.com, reiserfs-devel@vger.kernel.org

On Fri, Aug 25, 2017 at 9:22 AM, Edward Shishkin <edward.shishkin@gmail.com=
> wrote:
> As a possible fixup we can leave data uncompressed.
> I think it is rather rare event (the flood of warnings is because
> of inability to allocate workspace for the same chunk of data.

If left unfixed in subsequent reiser4 kernel patches, (unseen) stream of 'f=
lood of warnings' has the potential to crash the kernel.

>
> Edward.
>
> On 08/25/2017 06:49 AM, Mathieu B=C3=A9langer wrote:
>>
>> I did have that bug specifically with Chromium too, I did initial try to
>> test by disabling ALSR (I was suspecting the Ryzen silicon bug that fina=
lly
>> can be RMA).
>> But disabling ALSR caused more problem so ...
>>
>> I did "fix" the issue by recompiling Chromium with -O2 instead of -O3.
>>
>> And I do have similar problem with Firefox 57 compiled with -O3 (Again -=
O2
>> fix it and Firefox 55 with -O3 is not affected)

Thing is pre-built Firefox from Debian repositories did not produce warning=
s -- as far as random captured 2,000 chunks of dmesg output log showed -- o=
nly Chromium did.
>>
>> On Thu, Aug 24, 2017 at 11:42 PM, Metztli Information Technology
>> <jose@huitzilopochtli.metztli-it.com
>> <mailto:jose@huitzilopochtli.metztli-it.com>> wrote:
>>
>>
>>
>>     On Thu, Aug 24, 2017 at 6:01 AM, Edward Shishkin
>>     <edward.shishkin@gmail.com <mailto:edward.shishkin@gmail.com>> wrote:
>>     > So, memory allocation policy got changed in the upstream,
>>     > and we need to perform pre-allocation to not fail at flush time.
>>     > I am sorry, but right now I don't have a time for this..
>>     No worries, sir. I simply fulfilled your request for feedback.
>>
>>     Background for this test was to evaluate 2TB maximum slice allowed
>>     by Google Compute Engine in cloud instances, specifically Debian
>>     with transparent compression reiser4.
>>
>>     Currently, (default) transparent compression reiser4 formatting is
>>     not available[1] in my custom Debian-Installer (d-i) but planned
>>     to make available in a future implementation.
>>
>>     >
>>     >
>>     > On 08/24/2017 06:59 AM, Metztli Information Technology wrote:
>>     >>
>>     >> Much appreciated, Ed-
>>     >>
>>     >> Noticed improvement, notwithstanding...
>>     >>
>>     >> Context:
>>     >>
>>     >> uname -a
>>     >> Linux huitzilopochtli 4.12.0-1+reiser4.0.1-amd64 #1 SMP Debian
>>     >> 4.12.6-3+reiser4.0.1 (2017-08-14) x86_64 GNU/Linux
>>     >>
>>     >> (I have reinstalled same kernel two times after patching so the
>>     above
>>     >> string retained the older original kernel installation date.
>>     >> but
>>     >> uname -v
>>     >> #1 SMP Debian 4.12.6-3...[means upgrade '-3' reflects fact that
>>     I rebuilt
>>     >> fs with your latest two(2) patches to address the issue.])
>>     >>
>>     >>
>>     >>   ls -ltc /lib/modules/4.12.0-1*64/kernel
>>     >> total 18
>>     >> drwxr-xr-x 14 root root 16 Aug 23 02:14 sound/
>>     >> drwxr-xr-x  5 root root 24 Aug 23 02:13 lib/
>>     >> drwxr-xr-x  2 root root  4 Aug 23 02:13 mm/
>>     >> drwxr-xr-x 60 root root 62 Aug 23 02:13 fs/
>>     >> drwxr-xr-x  3 root root 73 Aug 23 02:13 crypto/
>>     >> drwxr-xr-x  2 root root  4 Aug 23 02:13 block/alloc workspace
>>
>>     >> drwxr-xr-x 51 root root 51 Aug 18 17:02 net/
>>     >> drwxr-xr-x  3 root root  3 Aug 18 17:02 virt/
>>     >> drwxr-xr-x 70 root root 70 Aug 18 17:02 drivers/
>>     >> drwxr-xr-x  3 root root  3 Aug 18 17:02 arch/
>>     >>
>>     >> After applying (fs/) patches and rebooting, I began to apply
>>     load to the
>>     >> machine where with previous kernel I had already built
>>     GCC-5-branch and
>>     >> Apache OpenOffice. Memory is limited to 16Gb RAM; copy
>>     operations were
>>     >> started from 1TB USB disk to local reiser4 transparent
>>     compression, a  16Gb
>>     >> data copy to same local filesystem, began a 2Gb svn download,
>>     etc.; I had
>>     >> Firefox open with several tabs open and launched chromium
>>     browser -- which
>>     >> began producing relevant feedback. I have set a two(2) thousand
>>     lines limit
>>     >> output in my shell so that is the reason *all* of the below
>>     WARNINGS repeat
>>     >> that number of times.
>>     >>
>>     >> Chromium browser launched but app did not open in the GUI and
>>     got stuck
>>     >> with un-killable processes (memory starvation?):
>>     >>
>>     >> % kill -9 $(pgrep chromium)
>>     >> % pgrep chromium
>>     >> 6320
>>     >> 6743
>>     >> 6814
>>     >> 7050
>>     >>
>>     >> Subsequently dmesg showed (<process number>) none necessarily
>>     in the order
>>     >> below as dmesg alternated in producing sequence:
>>     >>
>>     >> [ 6175.145234] reiser4[chromium(7050)]: lzo1_alloc
>>     >>
>>   =20
>> (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compress.c=
:241)[edward-878]:
>>     >>                 WARNING: alloc workspace for lzo1 (tfm action =3D
>>     1) failed
>>     >>
>>     >> [ 6175.145248] reiser4[chromium(7050)]: lzo1_alloc
>>     >>
>>   =20
>> (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compress.c=
:241)[edward-878]:
>>     >>                 WARNING: alloc workspace for lzo1 (tfm action =3D
>>     1) failed
>>     >>
>>     >> [ 6175.145261] reiser4[chromium(7050)]: lzo1_alloc
>>     >>
>>   =20
>> (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compress.c=
:241)[edward-878]:
>>     >>                 WARNING: alloc workspace for lzo1 (tfm action =3D
>>     1) failed
>>     >>
>>     >> [ 6175.145275] reiser4[chromium(7050)]: lzo1_alloc
>>     >>
>>   =20
>> (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compress.c=
:241)[edward-878]:
>>     >>                 WARNING: alloc workspace for lzo1 (tfm action =3D
>>     1) failed
>>     >>
>>     >> (snip)
>>     >>
>>     >> [ 7116.052780] reiser4[TaskSchedulerBa(6793)]: lzo1_alloc
>>     >>
>>   =20
>> (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compress.c=
:241)[edward-878]:
>>     >>                 WARNING: alloc workspace for lzo1 (tfm action =3D
>>     1) failed
>>     >>
>>     >> [ 7116.053021] reiser4[TaskSchedulerBa(6793)]: lzo1_alloc
>>     >>
>>   =20
>> (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compress.c=
:241)[edward-878]:
>>     >>                 WARNING: alloc workspace for lzo1 (tfm action =3D
>>     1) failed
>>     >>
>>     >> [ 7116.053044] reiser4[TaskSchedulerBa(6793)]: lzo1_alloc
>>     >>
>>   =20
>> (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compress.c=
:241)[edward-878]:
>>     >>                 WARNING: alloc workspace for lzo1 (tfm action =3D
>>     1) failed
>>     >>
>>     >> [ 7116.055925] reiser4[TaskSchedulerBa(6793)]: lzo1_alloc
>>     >>
>>   =20
>> (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compress.c=
:241)[edward-878]:
>>     >>                 WARNING: alloc workspace for lzo1 (tfm action =3D
>>     1) failed
>>     >>
>>     >> (snip)

It is not only Chromium, as 'TaskSchedulerBa...' aggregated to the warning =
stream. Accordingly, application(s) generating the warning may vary.  It ju=
st happened that I decided to launch Chromium in this particular instance f=
or elaboration.

>>     >>
>>     >> [ 7309.117294] reiser4[Chrome_DBThread(6796)]: lzo1_alloc
>>     >>
>>   =20
>> (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compress.c=
:241)[edward-878]:
>>     >>                 WARNING: alloc workspace for lzo1 (tfm action =3D
>>     1) failed
>>     >>
>>     >> [ 7309.117305] reiser4[Chrome_DBThread(6796)]: lzo1_alloc
>>     >>
>>   =20
>> (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compress.c=
:241)[edward-878]:
>>     >>                 WARNING: alloc workspace for lzo1 (tfm action =3D
>>     1) failed
>>     >>
>>     >> [ 7309.117316] reiser4[Chrome_DBThread(6796)]: lzo1_alloc
>>     >>
>>   =20
>> (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compress.c=
:241)[edward-878]:
>>     >>                 WARNING: alloc workspace for lzo1 (tfm action =3D
>>     1) failed
>>     >>
>>     >> [ 7309.117327] reiser4[Chrome_DBThread(6796)]: lzo1_alloc
>>     >>
>>   =20
>> (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compress.c=
:241)[edward-878]:
>>     >>                 WARNING: alloc workspace for lzo1 (tfm action =3D
>>     1) failed
>>     >>
>>     >> [ 7309.117338] reiser4[Chrome_DBThread(6796)]: lzo1_alloc
>>     >>
>>   =20
>> (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compress.c=
:241)[edward-878]:
>>     >>                 WARNING: alloc workspace for lzo1 (tfm action =3D
>>     1) failed
>>     >>
>>     >> (snip)
>>     >>
>>     >> [ 7550.849425] reiser4[Chrome_HistoryT(6828)]: lzo1_alloc
>>     >>
>>   =20
>> (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compress.c=
:241)[edward-878]:
>>     >>                 WARNING: alloc workspace for lzo1 (tfm action =3D
>>     1) failed
>>     >>
>>     >> [ 7550.849436] reiser4[Chrome_HistoryT(6828)]: lzo1_alloc
>>     >>
>>   =20
>> (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compress.c=
:241)[edward-878]:
>>     >>                 WARNING: alloc workspace for lzo1 (tfm action =3D
>>     1) failed
>>     >>
>>     >> [ 7550.849446] reiser4[Chrome_HistoryT(6828)]: lzo1_alloc
>>     >>
>>   =20
>> (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compress.c=
:241)[edward-878]:
>>     >>                 WARNING: alloc workspace for lzo1 (tfm action =3D
>>     1) failed
>>     >>
>>     >> [ 7550.849457] reiser4[Chrome_HistoryT(6828)]: lzo1_alloc
>>     >>
>>   =20
>> (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compress.c=
:241)[edward-878]:
>>     >>                 WARNING: alloc workspace for lzo1 (tfm action =3D
>>     1) failed
>>     >> (snip)
>>     >>
>>     >>
>>     >> On Tue, Aug 22, 2017 at 11:49 AM, Edward Shishkin
>>     >> <edward.shishkin@gmail.com <mailto:edward.shishkin@gmail.com>>
>>
>>     wrote:
>>     >>>
>>     >>> Hello,
>>     >>>
>>     >>> Please, try the attached patches.
>>     >>> The first patch improves responsiveness to vm subsystem
>>     >>> (modified version of ->migratepage() from Ivan Shapovalov).
>>     >>> The second patch performs memory allocation in the critical
>>     >>> place with __GFP_NOFAIL flag.
>>     >>> Let us know about results.
>>     >>>
>>     >>> Thanks,
>>     >>> Edward.
>>     >>
>>     >> []
>>     >>>>
>>     >>>> Your input would be greatly appreciated:
>>     >>>>
>>     >>>> [ 3449.944653] reiser4[StorageManager(2383)]: lzo1_alloc
>>     >>>>
>>     >>>>
>>   =20
>> (/mnt/chiucuetetl/usr/src/linux/fs/reiser4/plugin/compress/compress.c:24=
1)[edward-878]:
>>     >>>>                  WARNING: alloc workspace for lzo1 (tfm
>>     action =3D 1)
>>     >>>> failed
>>     >>>>
>>     >>>> [ 3449.944674] reiser4[StorageManager(2383)]: lzo1_alloc
>>     >>>>
>>     >>>>
>>   =20
>> (/mnt/chiucuetetl/usr/src/linux/fs/reiser4/plugin/compress/compress.c:24=
1)[edward-878]:
>>     >>>>                  WARNING: alloc workspace for lzo1 (tfm
>>     action =3D 1)
>>     >>>> failed
>>     >>>>
>>     >>>> [ 3449.944694] reiser4[StorageManager(2383)]: lzo1_alloc
>>     >>>>
>>     >>>>
>>   =20
>> (/mnt/chiucuetetl/usr/src/linux/fs/reiser4/plugin/compress/compress.c:24=
1)[edward-878]:
>>     >>>>                  WARNING: alloc workspace for lzo1 (tfm
>>     action =3D 1)
>>     >>>> failed
>>     >>>>
>>     >>>> [ 3449.944715] reiser4[StorageManager(2383)]: lzo1_alloc
>>     >>>>
>>     >>>>
>>   =20
>> (/mnt/chiucuetetl/usr/src/linux/fs/reiser4/plugin/compress/compress.c:24=
1)[edward-878]:
>>     >>>>                  WARNING: alloc workspace for lzo1 (tfm
>>     action =3D 1)
>>     >>>> failed
>>     >>>>
>>     >>>> [snip]
>>     >>
>>     >> This time dmesg did not output any references to
>>     [StorageManager(<pid>)]
>>     >>
>>     >>
>>     [1] but default reiser4 formatting can be performed from the
>>     command line in another virtual terminal.
>>

In other developments, I am engaged in a GRUB2 hack quest which, if success=
ful, has the potential to add native reiser4 boot detection to GRUB2; that =
way, a separate ext2 /boot partition will not be required.


Best Professional Regards.

--=20
Jose R R
http://metztli.it
---------------------------------------------------------------------------=
------------------
Download Metztli Reiser4: Debian Stretch with Linux 4.12
---------------------------------------------------------------------------=
------------------
for AMD64 https://sf.net/projects/metztli-reiser4/
---------------------------------------------------------------------------=
------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------=
------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
