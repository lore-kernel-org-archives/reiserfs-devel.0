From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Little report on reiser4 with 2.6.35.7
Date: Fri, 12 Nov 2010 12:34:12 +0100
Message-ID: <4CDD2634.6@gmail.com>
References: <AANLkTincE-JHOYPoZkrBrbqs7eo__s8Vjn3bbEKVzGEB@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=tEtRspv5mI0Jlha8fij7eujIlAO2u6kC3UGNCuo0YzU=;
        b=Hgs/pBIMsVUqvDchAaqb7w6vMOT7WUXaGan/GgkMAIlQdfJ9X7Ddngg3Ipm0b8qNZb
         cfJomQGXpph+kzLyRK2o1OuAJ9FNwu3OcL2mYhE0gfvw6Oq0k61zY6BWpbDh/vgaZuk7
         p3wuMBJ7qOm4ZGA3YtRB8fDWHQXrmBA8MBVDE=
In-Reply-To: <AANLkTincE-JHOYPoZkrBrbqs7eo__s8Vjn3bbEKVzGEB@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Magicloud Magiclouds <magicloud.magiclouds@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Magicloud Magiclouds wrote:
> Hi,
>   

Hello.

>   I compiled 2.6.35.7 kernel with reiser4 patch on debian sid. And I
> found a serious problem. When the reiser4 fs was full, it broke down,
> which lead the module to "bus error".

Could you provide any related kernel messages?
Which subsystem complained on "bus error"?

Thanks for the report.
Edward.

>  Then I fscked it, I had to "fix"
> and "build file system". At last, I lost some files (not sure of the
> contents of the left files), which are not created right before it
> broke down.
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>   

