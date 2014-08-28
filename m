From: Matt <jackdachef@gmail.com>
Subject: Re: linux-3.16.2 queue (3.16.1+)
Date: Thu, 28 Aug 2014 17:27:27 +0200
Message-ID: <CAG-aW05qkQKgntBM87XHSMECjD-GMjeRt+m0-0CkezBG_weCOg@mail.gmail.com>
References: <CAG-aW06Q9VVyW-atZEsURs0rfjysdEbxb_dC4Tm3K-tZg++tQg@mail.gmail.com>
	<20140828152205.GA18432@kroah.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=LXicsX6HvCqQF+K/DVP+xxWZojlYCWwMXlzp2L0EvRI=;
        b=lMhJeykYghRRtCysm3FCERbx9NEohc0m685dOCi5PGRrgkr7JgEEjXaWyRlcs7SHIK
         wKFVj/4rNS6nSDcfuVLyiq7BGFxpaARZpuFqyiBRBQl/EMIGGtMaefFwIgZsQukgCoe2
         m9TdzFyhdUUfj5Xw3TzBdzUnnqkmHRAtZG+M6bTKFi6Pr2aBUjJdaHuhmRdfN9nsOHZu
         ePC/jD1f63SVC22CRtLNs/kksy6Xfy671JcmhPZNZd7Ex2ze3TE1cXmqLHl27KGk5NQb
         divQUNO5got0HGFTOmuvar9vJP3cBPUZe/mHjPpbMzZ+J0dr8Zpe6KnkywU7si29o2v3
         RpVw==
In-Reply-To: <20140828152205.GA18432@kroah.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg KH <gregkh@linuxfoundation.org>
Cc: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

On Thu, Aug 28, 2014 at 5:22 PM, Greg KH <gregkh@linuxfoundation.org> wrote:
> On Thu, Aug 28, 2014 at 05:16:58PM +0200, Matt wrote:
>> Hi Greg,
>>
>>
>> please consider adding the following 2 patches to 3.16.2:
>>
>> Jan Kara (1):
>>       reiserfs: Fix use after free in journal teardown
>>
>> Jeff Mahoney (1):
>>       reiserfs: fix corruption introduced by balance_leaf refactor
>>
>>
>>
>> Reason/Related:
>>
>> https://bugzilla.kernel.org/show_bug.cgi?id=83121
>>
>> https://bugzilla.kernel.org/show_bug.cgi?id=83321
>>
>> http://forums.gentoo.org/viewtopic-t-998538-postdays-0-postorder-asc-start-0.html
>>
>>
>> Many thanks in advance
>
> I need git commit ids of these patches in Linus's tree, can you provide
> those please?
>
> thanks,
>
> greg k-h


Sure:

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=27d0e5bc85f3341b9ba66f0c23627cf9d7538c9d
reiserfs: fix corruption introduced by balance_leaf refactor


https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=01777836c87081e4f68c4a43c9abe6114805f91e
reiserfs: Fix use after free in journal teardown



are checkpatch warnings usually also fixed within stable releases ?

if yes:

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=f3fb9e27325c4e1730440820ea8a1e9d9a5af709
fs/reiserfs/xattr.c: fix blank line missing after declarations

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=17093991af4995c4b93f6d8ac63aab68fcd9e1be
fs/reiserfs: use linux/uaccess.h

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=53872ed07786714bff3642ee9ee61afd3f4eb749
fs/reiserfs: replace not-standard %Lu/%Ld


Greetings

Matt
