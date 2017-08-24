From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4[StorageManager(2383)]: lzo1_alloc
Date: Thu, 24 Aug 2017 15:01:29 +0200
Message-ID: <910d6d52-537f-1f9d-57f9-51c988b152ff@gmail.com>
References: <20170824045935.D455636BEE9@huitzilopochtli.metztli-it.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=I8l5LTLk/DHmWL8R9dXH6GdqpTvtalKByhb/TB1VzNw=;
        b=tvxddytRmOL3niBBCWczCg8Xy+xSOrHlG8KfyO4lEvW1G/aF2Y3cs2WdrnmxW1a586
         BXgA8qaD2mLsT/EmLmSgz5llvQ0wfJFobUbUGjLtib8fe/UyaH6mhnrQOdtKwFG0diEo
         TTxst4MFTJZs/HbOxtyHbdM7aDpcNK72ivb8xgXZQx1G1OifZs6hXzWfVGK6TwSxB1iu
         XKF0a9jZ2CPbA/H+KC4D1Sa7XjME3+ltwXpy06D1bqyY1lDIVXaTvlwguv4jNcJNf87L
         nBnmOAIp0nl+l91TsENZpbD+J1duGjajSrWyvD3VKYbNqC0ix8cC5IfPw6WRu2Zhr91L
         +T9w==
In-Reply-To: <20170824045935.D455636BEE9@huitzilopochtli.metztli-it.com>
Content-Language: en-US
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Metztli Information Technology <jose@huitzilopochtli.metztli-it.com>, reiserfs-devel@vger.kernel.org

So, memory allocation policy got changed in the upstream,
and we need to perform pre-allocation to not fail at flush time.
I am sorry, but right now I don't have a time for this..

Thanks,
Edward.

On 08/24/2017 06:59 AM, Metztli Information Technology wrote:
> Much appreciated, Ed-
>
> Noticed improvement, notwithstanding...
>
> Context:
>
> uname -a
> Linux huitzilopochtli 4.12.0-1+reiser4.0.1-amd64 #1 SMP Debian 4.12.6-3+reiser4.0.1 (2017-08-14) x86_64 GNU/Linux
>
> (I have reinstalled same kernel two times after patching so the above string retained the older original kernel installation date.
> but
> uname -v
> #1 SMP Debian 4.12.6-3...[means upgrade '-3' reflects fact that I rebuilt fs with your latest two(2) patches to address the issue.])
>
>
>   ls -ltc /lib/modules/4.12.0-1*64/kernel
> total 18
> drwxr-xr-x 14 root root 16 Aug 23 02:14 sound/
> drwxr-xr-x  5 root root 24 Aug 23 02:13 lib/
> drwxr-xr-x  2 root root  4 Aug 23 02:13 mm/
> drwxr-xr-x 60 root root 62 Aug 23 02:13 fs/
> drwxr-xr-x  3 root root 73 Aug 23 02:13 crypto/
> drwxr-xr-x  2 root root  4 Aug 23 02:13 block/
> drwxr-xr-x 51 root root 51 Aug 18 17:02 net/
> drwxr-xr-x  3 root root  3 Aug 18 17:02 virt/
> drwxr-xr-x 70 root root 70 Aug 18 17:02 drivers/
> drwxr-xr-x  3 root root  3 Aug 18 17:02 arch/
>
> After applying (fs/) patches and rebooting, I began to apply load to the machine where with previous kernel I had already built GCC-5-branch and Apache OpenOffice. Memory is limited to 16Gb RAM; copy operations were started from 1TB USB disk to local reiser4 transparent compression, a  16Gb data copy to same local filesystem, began a 2Gb svn download, etc.; I had Firefox open with several tabs open and launched chromium browser -- which began producing relevant feedback. I have set a two(2) thousand lines limit output in my shell so that is the reason *all* of the below WARNINGS repeat that number of times.
>
> Chromium browser launched but app did not open in the GUI and got stuck with un-killable processes (memory starvation?):
>
> % kill -9 $(pgrep chromium)
> % pgrep chromium
> 6320
> 6743
> 6814
> 7050
>
> Subsequently dmesg showed (<process number>) none necessarily in the order below as dmesg alternated in producing sequence:
>
> [ 6175.145234] reiser4[chromium(7050)]: lzo1_alloc (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
>                 WARNING: alloc workspace for lzo1 (tfm action = 1) failed
>
> [ 6175.145248] reiser4[chromium(7050)]: lzo1_alloc (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
>                 WARNING: alloc workspace for lzo1 (tfm action = 1) failed
>
> [ 6175.145261] reiser4[chromium(7050)]: lzo1_alloc (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
>                 WARNING: alloc workspace for lzo1 (tfm action = 1) failed
>
> [ 6175.145275] reiser4[chromium(7050)]: lzo1_alloc (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
>                 WARNING: alloc workspace for lzo1 (tfm action = 1) failed
>
> (snip)
>
> [ 7116.052780] reiser4[TaskSchedulerBa(6793)]: lzo1_alloc (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
>                 WARNING: alloc workspace for lzo1 (tfm action = 1) failed
>
> [ 7116.053021] reiser4[TaskSchedulerBa(6793)]: lzo1_alloc (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
>                 WARNING: alloc workspace for lzo1 (tfm action = 1) failed
>
> [ 7116.053044] reiser4[TaskSchedulerBa(6793)]: lzo1_alloc (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
>                 WARNING: alloc workspace for lzo1 (tfm action = 1) failed
>
> [ 7116.055925] reiser4[TaskSchedulerBa(6793)]: lzo1_alloc (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
>                 WARNING: alloc workspace for lzo1 (tfm action = 1) failed
>
> (snip)
>
> [ 7309.117294] reiser4[Chrome_DBThread(6796)]: lzo1_alloc (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
>                 WARNING: alloc workspace for lzo1 (tfm action = 1) failed
>
> [ 7309.117305] reiser4[Chrome_DBThread(6796)]: lzo1_alloc (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
>                 WARNING: alloc workspace for lzo1 (tfm action = 1) failed
>
> [ 7309.117316] reiser4[Chrome_DBThread(6796)]: lzo1_alloc (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
>                 WARNING: alloc workspace for lzo1 (tfm action = 1) failed
>
> [ 7309.117327] reiser4[Chrome_DBThread(6796)]: lzo1_alloc (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
>                 WARNING: alloc workspace for lzo1 (tfm action = 1) failed
>
> [ 7309.117338] reiser4[Chrome_DBThread(6796)]: lzo1_alloc (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
>                 WARNING: alloc workspace for lzo1 (tfm action = 1) failed
>
> (snip)
>
> [ 7550.849425] reiser4[Chrome_HistoryT(6828)]: lzo1_alloc (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
>                 WARNING: alloc workspace for lzo1 (tfm action = 1) failed
>
> [ 7550.849436] reiser4[Chrome_HistoryT(6828)]: lzo1_alloc (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
>                 WARNING: alloc workspace for lzo1 (tfm action = 1) failed
>
> [ 7550.849446] reiser4[Chrome_HistoryT(6828)]: lzo1_alloc (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
>                 WARNING: alloc workspace for lzo1 (tfm action = 1) failed
>
> [ 7550.849457] reiser4[Chrome_HistoryT(6828)]: lzo1_alloc (/usr/src/build/kernel/build/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
>                 WARNING: alloc workspace for lzo1 (tfm action = 1) failed
> (snip)
>
>
> On Tue, Aug 22, 2017 at 11:49 AM, Edward Shishkin <edward.shishkin@gmail.com> wrote:
>> Hello,
>>
>> Please, try the attached patches.
>> The first patch improves responsiveness to vm subsystem
>> (modified version of ->migratepage() from Ivan Shapovalov).
>> The second patch performs memory allocation in the critical
>> place with __GFP_NOFAIL flag.
>> Let us know about results.
>>
>> Thanks,
>> Edward.
> []
>>> Your input would be greatly appreciated:
>>>
>>> [ 3449.944653] reiser4[StorageManager(2383)]: lzo1_alloc
>>> (/mnt/chiucuetetl/usr/src/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
>>>                  WARNING: alloc workspace for lzo1 (tfm action = 1) failed
>>>
>>> [ 3449.944674] reiser4[StorageManager(2383)]: lzo1_alloc
>>> (/mnt/chiucuetetl/usr/src/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
>>>                  WARNING: alloc workspace for lzo1 (tfm action = 1) failed
>>>
>>> [ 3449.944694] reiser4[StorageManager(2383)]: lzo1_alloc
>>> (/mnt/chiucuetetl/usr/src/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
>>>                  WARNING: alloc workspace for lzo1 (tfm action = 1) failed
>>>
>>> [ 3449.944715] reiser4[StorageManager(2383)]: lzo1_alloc
>>> (/mnt/chiucuetetl/usr/src/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
>>>                  WARNING: alloc workspace for lzo1 (tfm action = 1) failed
>>>
>>> [snip]
> This time dmesg did not output any references to [StorageManager(<pid>)]
>
>
> Best Professional Regards.
>

