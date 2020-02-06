From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH] reiser4: prevent system lockups
Date: Thu, 6 Feb 2020 21:04:43 +0100
Message-ID: <54056db9-4013-dad5-dbd0-d9d0e350c17c@gmail.com>
References: <20200206141241.DE8584E43813@huitzilopochtli.metztli-it.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=ssLOk1hJ8PWYpoMSkhRiq3ccs7pg/MrHErCZjZOPj+E=;
        b=LHvptJCEzpw+nZd4C2zdNZL1QsC0tYW/8AIApd/W+TE+G6YbEu5XLKcXkizLBtRknD
         b+OsGpvfugXz+2CJDS4TIJeydLZXo9Ta23DEio4md9YDTtodEk128cDSuQl0WlEsbMcq
         zXRlVqrL9jgLgYq0DHECDSd6WX/SrmgJqnW5zeUZj1UI1yxkPWbLMayzb5EkBLeZECQa
         Tou2XMctqszt390hrnRz22t6vBhcAHhd0i6ye+WDrkdlbCZuZvMjPAzO0IQMt0cwvdOG
         mXC3vnH0yNTgs7uDlzDn8IwP2Ddto24uqwgKFOADdnSTahftqma6PYYV7IwVE/Vd5N3V
         g5pw==
In-Reply-To: <20200206141241.DE8584E43813@huitzilopochtli.metztli-it.com>
Content-Language: en-US
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Metztli Information Technology <jose.r.r@metztli.com>, reiserfs-devel@vger.kernel.org

On 02/06/2020 03:12 PM, Metztli Information Technology wrote:
> That is 'one hell of' a shrewd finding, Ed!
>> On Tue, Feb 4, 2020 at 4:24 PM Edward Shishkin <edward.shishkin@gmail.com> wrote:
>>
>> Hi all,
>>
>> Starting from Linux-4.15, VFS introduces optimizations, which
>> are incompatible with Reiser4 (as well as with any FS possessing
>> an advanced transaction manager). Here is the problematic commit:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=aa65c29ce1b6e1990cd2c7d8004bbea7ff3aff38
> Indeed, I knew *something* had changed but I focused heavily on confirming the validity of my reiser4 hacks; additionally, I began
> examining attentively multiple Debian packaging for Linux major.minor changes, custom debian patches, as well as the packaging custom default .config
> --believing the Debian Kernel Team modifications might have had introduced the hanging issue, Sir.
>> The attached patch fixes the problem. This patch is against
>> Linux-5.4+reiser4. Please, apply.
> 5.4.6 [?]

Yes, against Linux-5.4.X+reiser4-for-5.4.6.

Also I've uploaded reiser4-for-5.4.17, which already contains that fixup:
https://sourceforge.net/projects/reiser4/files/reiser4-for-linux-5.x/

Edward.

>
>> Later I'll prepare backports for all the mentioned kernels and will
>> put them on Sourceforge.
> Cool! I was notified of your latest reiser4-for-5.4.17.patch.gz release.
>
>> If someone urgently needs a backport, then
>> let me know.
>>
>> Thanks,
>> Edward.
> Your dedication and outsized efforts toward maintaining and enhancing REISER4 are MUCH ADMIRED and APPRECIATED, Ed, THANK YOU!
>
>
> Best Professional Regards.

