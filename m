From: "Ryan Hope" <rmh3093@gmail.com>
Subject: Re: next major release query
Date: Wed, 20 Aug 2008 12:19:45 -0400
Message-ID: <48f7fe350808200919k69fe3793oc35fdf318a8f3350@mail.gmail.com>
References: <17724.202.168.22.19.1219239253.squirrel@webmail.velocity.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=WtD1A/0sIOXHQkNw9cfxOLRSgTNfMdYYce0u+LiXe5A=;
        b=VNq2NVcR9qMwpraqG43Z7rqnjv1u/zo/aV1dpSfme82tA2VdeJ4UfSSPowhRG25Pc/
         ifYhb0y3LKsbid6H8UX09arKqWTVa84lWn7f3SjwHEV8InlEmEqvtO/JvmThi8MiSv2k
         IaHcxreflE1lZelSVCfeEfbzfD0PBP7oTyqFc=
In-Reply-To: <17724.202.168.22.19.1219239253.squirrel@webmail.velocity.net.au>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org

If you need patch for reiser4 for 2.6.27-rc3 use this patch:
http://zen-sources.org/cgi-bin/gitweb.cgi?p=kernel.git;a=treediff_plain;h=83c4471f6ca3e92aeaf901ac2aa4b6a1fefb00fe;hb=83c4471f6ca3e92aeaf901ac2aa4b6a1fefb00fe;hpb=30a2f3c60a84092c8084dfe788b710f8d0768cd4

-Ryan

On Wed, Aug 20, 2008 at 9:34 AM,  <doiggl@velocitynet.com.au> wrote:
> Hello,
> I notice on
> http://www.kernel.org/pub/linux/kernel/people/edward/reiser4/reiser4-for-2.6/
> it is at the reiser4-for-2.6.25.* revision/level.
>
> Questions:
> - What do you think the next major revision will be ?
> - Will it include all patches up to a point in time, of your choosing ?
>
> Thanks for the info.
> Glenn
>
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
