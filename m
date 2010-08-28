From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Problems with the 'flush-8:0' process in 2.6.35.3
Date: Sat, 28 Aug 2010 12:15:49 +0200
Message-ID: <4C78E1D5.80101@gmail.com>
References: <4C789044.3020403@podzimek.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=oH0sR7eoX9mtYJY2DCLxzLWj8IlqXX3XtWzRdYZYHxk=;
        b=KTFyV/Slv+F65debfSfBFSHR7i180SbmdOEnPOPt6mT0IPZ2xJtuwnO3NeUssxUDgT
         H2Y+lEWUubEcf+pNTptNcNnlUYmiSy8IqRl6+YUpicniAFV0taf+AWNQS5SJL+RNsYrE
         HE1pX247A1Ah6VrmGkPDpeUmtK9TJPZ5vkGnM=
In-Reply-To: <4C789044.3020403@podzimek.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrej Podzimek <andrej@podzimek.org>
Cc: reiserfs-devel@vger.kernel.org

Andrej Podzimek wrote:
> Hello,

Hello.

>
> I use a 2.6.35.3 kernel and Reiser4 as the root file system. In a
> couple of minutes after boot, a kernel process called 'flush-8:0'
> takes up all the available CPU time. From that moment on, it is
> impossible to sync filesystems (and suspend, hibernate or reboot).
> (The 'sync' command halts indefinitely.) In some cases it is even
> impossible to log in. Existing sessions seem to work fine, to an extent.
>
> I first thought this was related to the GTT chipset coherency patch.
> (This patch fixes a one-year-old bug that caused all the Intel 855
> class GPUs to be totally unusable.) However, removing the patch and
> testing with only a vanilla kernel (and Reiser4, of course) showed
> that 'flush-8:0' will eventually go mad, no matter if the GPU-related
> patch is present or not.
>
> The machine is an Asus M2400N laptop with a 100GB Seagate Momentus.
>
> Is this a known issue?

Um, nop..

> How could I track this down?

Could you try to catch sysrq-t output to take a look what the flush-8:0
doing?

> In fact I don't even know whether this is related to Reiser4 or not.

Which kernel version did you have before upgrade?

Thanks,
Edward.

> It may be a bug in VFS. I don't use 'noflushd' or anything of that
> kind. (Some people reported similar problems related to noflushd. So
> this is not the case.) If this is unrelated to Reiser4, where should I
> report it?
>
> Andrej
>

