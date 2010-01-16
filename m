From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: FYI r4 patches in http://lkml.org/lkml/2010/1/15/271
Date: Sat, 16 Jan 2010 02:13:19 +0100
Message-ID: <4B5112AF.6040403@gmail.com>
References: <7ed5587f1fb48265e55e78f6f58f34d8@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=m22FI7uigDQppF0A+AcUNMkCWRGxddURv7w9NS1YWvc=;
        b=UJboN1auP/VoNEjDO3WUUuDp/VuD+fib41D+p1GN1WQytto31U7kpso/Xbgifn22J0
         P3BH+KQXmAYRzLXstgb1PDCtwcAicZzF8yzaYTYCHQiDakG9RWMzSi4fCN8BFyOPB9iv
         K7C8TE/RlKmRLXUcCk4XZDfTDfCzumFRnCmrs=
In-Reply-To: <7ed5587f1fb48265e55e78f6f58f34d8@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org

doiggl@velocitynet.com.au wrote:
> FYI: Saw this announcement at http://lkml.org/lkml/2010/1/15/271
> Cheers Glenn
>
> The mm-of-the-moment snapshot 2010-01-15-15-34 has been uploaded to
>
>    http://userweb.kernel.org/~akpm/mmotm/
>
> and will soon be available at
>
>    git://zen-kernel.org/kernel/mmotm.git
> It contains the following patches against 2.6.33-rc4:
> .
> .
> .
>   
[...]
>                                                  
> reiser4-vfs-add-super_operationssync_inodes-2.patch

will not work
 
>                                                  
> reiser4.patch        
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>   

