From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 for Linux-2.6.36
Date: Sun, 21 Nov 2010 19:08:59 +0100
Message-ID: <4CE9603B.7050103@gmail.com>
References: <4CE87674.4090909@gmail.com> <4CE93CEB.8050504@ya.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=3vorzjmDiWleiU6kMGpkYJrJFCPn3DJiledO5ByWaT8=;
        b=lKkF93T8gft3o89PVTQch9DacrUAASHACEe46Znmb6nkFdKkMOXmuhzmYz2jeXlfb3
         mn9y3jlNewOuN5x2ZpEkF+vvfU8WQoW13v49vrdN77CndUyzaoPCLmxCTAokv6IcJ1Gh
         hTxwp2BCC7N1B4+1biLMvXjKCx3H7e9AjnQko=
In-Reply-To: <4CE93CEB.8050504@ya.ru>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: dimas000@ya.ru
Cc: Reiserfs mailing list <reiserfs-devel@vger.kernel.org>

dimas wrote:
> that sounds good! but as i remember, you've mentioned some issues abo=
ut 2.6.35
> earlier, which were to be fixed. among them there was the troble with=
 loop
> devices. how about this?

yes, this has been fixed in .36

>  and there was a mail here where author complained about
> problems after moving from 34 to 35. is 36 version more stable or it =
is better
> to still rely on 34.7, which works nice for me?
>  =20

I think that moving to .36 is a must, however I don't test
released stuff well enough, so, please keep a possibility
to roll back to previous stuff and report, if any problems.

> Edward Shishkin =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>  =20
>> Changes since 2.6.35:
>>
>> . Fixed ->write_end() method: the old one didn't update i_size, and =
this
>>  resulted in empty files and "orphan" items. The problem took place =
only
>>  for splice users (loop devices, pipe2, etc).
>>
>> . Implemented ->sync_fs() method of super operations. Since introduc=
ing a
>>  new per-bdi flushing stuff reiser4 wasn't able to perform sync on u=
mount.
>>  Now such sync is performed by reiser4_sync_fs().
>>
>> . Fixed an old bug which led to non-deletable directories.
>>
>> . Fixed an old bug in tail conversion, which led to data corruption =
when
>>  running in disk space pressure situations.
>>
>> Please, find at
>> http://www.kernel.org/pub/linux/kernel/people/edward/reiser4/reiser4=
-for-2.6/
>>    =20
>
>  =20

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
