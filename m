From: "Dushan Tcholich" <dusanc@gmail.com>
Subject: Re: Reiser4 Maintainer
Date: Thu, 19 Jun 2008 21:39:44 +0200
Message-ID: <a08621850806191239x22204374m59022dbfe545648d@mail.gmail.com>
References: <1CCA8592-A78B-4DC8-AF53-ACD69CAE14C4@jasonandannette.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=6o++6ar2kgft4+oC2YAfXzfXGdOOgM86qY9bS9DiVbY=;
        b=rCUwqDfTKqFtg3d3HfPYrLdSujad55iTnb2/EBRUet3CYvA+3tib7xkCaTD9WNh1qR
         ckkJ9T25tHm3x4VYucvIheiXVGtWhlrj9ikMdtVHpZTamPf8d1ZzY363aKvdAMoCp9s8
         64Zyzm2IE+MFuSTMg6AuqO1d8bSbZLluBnA8g=
In-Reply-To: <1CCA8592-A78B-4DC8-AF53-ACD69CAE14C4@jasonandannette.us>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "J. Todd Slack" <mailinglists@jasonandannette.us>
Cc: reiserfs-devel@vger.kernel.org

On Thu, Jun 19, 2008 at 7:09 PM, J. Todd Slack
<mailinglists@jasonandannette.us> wrote:
> Hello All,
>
Hi

> I have spend a long time over the last years studying Reiser 3 and Reiser4.
>
> How would I go about becoming the new Reiser maintainer?
>
> I would like to work on changing Reiser appropriately to get accepted in the
> the kernel. I am sure that I am not aware of all issues at this point, but I
> have known of some issues.
>
> I have attempted to contact Edward Shishkin, but no response.
>
> Would anyone have thoughts?
>

You have a TODO list for inclusion if you're interested at
http://marc.info/?l=reiserfs-devel&m=120173123713322&w=2
Also some review/comments of code would be nice. PPC64 testing too.
Gentoo has a vibrant reiser4 users community, you can try to solve
theirs reiser4 problems in bugzilla and on forums.
Benchmarking of various reiser4 versions from old kernels till current
should be usefull.

> Where can one get the latest source at this point, the source base I have is
> not current?
>
> Thanks!
>
> -Jason
>
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
