From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4: mv command lost folder.
Date: Fri, 28 May 2010 11:45:13 +0200
Message-ID: <4BFF90A9.2050209@gmail.com>
References: <AANLkTilTr_Yt0OWx1ED8pt2pM0rZc4FCg9obrNKVX2w9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=qz/sslkYPpm2nmUA2+Ap0FNdZY19PfMvyEQXyvcLOwo=;
        b=AJ3+As0Z42ntBj2Kd9mbCIXL6B0K6ra4prbIeeZ9Zfryuh1uipm5Lnz506P2qP/xCx
         zpWPUB43/jWt3mLGiqijLeBhmCQD1ZU0dcvbb/WiklhJgLfZTEL9IAm6Lgciurx3I5bM
         rJSzuNtzT+AmwosbTda66AZsX8xZAMXgfeeMU=
In-Reply-To: <AANLkTilTr_Yt0OWx1ED8pt2pM0rZc4FCg9obrNKVX2w9@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Danila Beketov <danila.beketov@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Danila Beketov wrote:
> Hello,
>   
Hello
> Need help to return my lost folder, that has disappeared after mv
> command execution by magic way.
>   

Interesting. Just has disappeared without any kernel complaints?

> Execution of fsck.reiser4 --build-fs shows the follow:
>   

[...]

> CHECKING THE SEMANTIC TREE
> Error: Entry "lost_name_1002b:6d757369630000:106e5" already exists.
> Error: Can't add entry lost_name_1002b:6d757369630000:106e5 to
> 1002b:6d757369630000:106e5.
>   
This is fsck bug.

Would you please pack the metadata by
debugfs.reiser4 -P /dev/xxx | gzip > meta.gz
and let me download the file meta.gz

Thanks,
Edward.

>         Found 12142 objects.
>         Lost&found 1 objects.
>         Time interval: Fri May 28 09:17:12 2010 - Fri May 28 09:17:13 2010
> ***** fsck.reiser4 finished at Fri May 28 09:17:13 2010
> Closing fs...done
>
> Operational error occurred while fscking.
>
> but there's no lost_name_1002b:6d757369630000:106e5 file on the partition.
>
> Does anyone know how to repair my partition?
>
> beda ~ # uname -a
> Linux beda 2.6.31-gentoo-r10 #1 PREEMPT Sun May 23 11:29:07 MSD 2010
> i686 Intel(R) Pentium(R) 4 CPU 2.40GHz GenuineIntel GNU/Linux
>
> beda ~ # fsck.reiser4 --version
> fsck.reiser4 1.0.7
> Copyright (C) 2001-2005 by Hans Reiser, licensing governed by
> reiser4progs/COPYING
>
> Danila.
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>   

