From: Gleb Baryshev <gleb.baryshev@gmail.com>
Subject: Re: fsck.reiser4 (libaal-1.0.5) segfault
Date: Mon, 07 Feb 2011 12:21:31 +0300
Message-ID: <4D4FB99B.80606@gmail.com>
References: <4D4B1887.3020306@gmail.com> <4D4F2079.2080407@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=k+dY/cmcBjXO2f28YyUOl3uBoi42DTODdqq+/8wAQ9s=;
        b=bQ2Du8+oMqM+syd4z8eJRyt4buKY5tdYW/zmFZaShuOaZqLpYbEvg/bGdXV8ML1Dn7
         gLobSTAy5vYqsXCUGgeyZA6cUk1P2mqt0jiqRjoD6BqG4gExbOG1sqYa835tUeWE7mMU
         IL8OXSefhJ4CQAbrvOqrYrCSVsQ1V/bnOV+j8=
In-Reply-To: <4D4F2079.2080407@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-devel@vger.kernel.org

07.02.2011 01:28, Edward Shishkin writes:
> Hello.
>
> I have taken a look at your problem on weekends.
>
> Please, apply the attached patch to reiser4progs-1.0.7,
> and check your partition again. The patched fsck after
> check phase should report about minor corruption and
> suggest to repair it with --fix option.
>
> Please, report about results.
>
> Thanks,
> Edward.

It went as expected, FS is consistent now. Thanks!

Gleb
