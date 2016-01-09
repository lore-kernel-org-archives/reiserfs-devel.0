From: Jose R R <Jose.r.r@metztli-it.com>
Subject: Re: Reiser4-enabled Debian Unstable (Sid) netboot iso
Date: Fri, 8 Jan 2016 19:07:05 -0800
Message-ID: <CAM12Q5QN4XtHm8MqbEKwDgVO2SSASSwAZAHWbTxSNj4xh1wWzw@mail.gmail.com>
References: <CAM12Q5QLgEgzb6uh_JPDMv69ZK18N5uceZOTaqx_dh1n1qXXag@mail.gmail.com>
	<CAM12Q5Rt-X2SXc1bSuU-h-zDxPfBUqdJkRhY2fKs4kXUYbOwAA@mail.gmail.com>
	<20160108213232.300b8242@Ulf.tvoe.tv>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metztli-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:content-type;
        bh=gj6/e4wkenLZ5czCxh9bl7SzhBj+sR8VdGmu3nOTX7I=;
        b=vt/tsLk6VhRM+/2g+iO6JgxQjkDvt2a7xbKhVdF8MAa3pHhTyMYT5S2YKMFEQ4JfnL
         T+6ZmmcOc3NlwrrbcBvSB1avFIcEje5cwFUheXPpx7WRS6cd4PLlIgHZrrX/Xqlish0r
         9hICDb7BIQD8uum1uSPpHqAKndc4GeF2NUxMf+bbZa/L68yxoDJwQBo6K9miGOqJR7BY
         XBxnsLoARatbKNngfYnfWhKPJvM6qtlVqHbckK5wY09PDdKoEPEs6jqTuR9q3bVimfPN
         0NfrkxwWsAk1lto10kkAJnQ+WEMyZulysJ+KF0+yUKkTr8XuDmrdzK52xDbYq2KeF/6C
         6zFw==
In-Reply-To: <20160108213232.300b8242@Ulf.tvoe.tv>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>, dimas000@ya.ru

On Fri, Jan 8, 2016 at 10:32 AM, dimas <dimas000@ya.ru> wrote:
> 2016-007 00:11 Jose R R <Jose.r.r@metztli-it.com> wrote:
>> And *prior* to installing the Reiser4 -enabled kernel make sure to
>> replace the older reiser4progs 1.0.9 with the newer reiser4progs
>> 1.1.0-1.1 -- which may be downloaded from previously posted link,
> what's the problem with native version? what new does 1.10 have? format41
> support or what?

That applies *only* if user decides to install Jessie (Stable) --
which Debian repositories still contain reiser4progs 1.0.9.

The Reiser4 -enabled Debian-Installer (d-i) has reiser4progs 1.1.0-1.1
UDEBs, i.e., *new* Reiser4 4.0.1 version of the utilities to match the
Reiser4 -enabled kernel. Thus, per prior Ed's email [1]...

"NOTE: after mount in the new kernel you won' t be able to
check your partition by reiser4progs-1.0.9 and older versions, so
please upgrade your reiser4progs BEFORE"

[1] http://marc.info/?l=reiserfs-devel&m=144103447029219&w=2

reiser4progs 1.1.0-1.1 are already 'native' in the Stretch and
Sid(Unstable) Debian repos.


Best Professional Regards.


-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
---------------------------------------------------------------------------------------------
