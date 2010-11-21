From: Matt <jackdachef@gmail.com>
Subject: Re: Reiser4 for Linux-2.6.36
Date: Sun, 21 Nov 2010 12:17:11 +0100
Message-ID: <AANLkTikMa3JRRvdD4pMh9WG8aCXT7+9B38WZY5FyBy=q@mail.gmail.com>
References: <4CE87674.4090909@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=SKwQ+UZWmSvj0AW2z8EJrmmIPcGN6kKb1NIaHIJrcFk=;
        b=Iqo0u6jvejqJbtnMkLMfByQDFijohS62CPh5nMKYawlc55KpVtQyflN705tFt7WZwS
         Vw/wcXAW9d71flYiuEyq6WOV9COMPr1cYttt+DuUbkHW9JdqrIW7gHqn7nks69iHYZvD
         uUrM/2IZb6Eqs90FUdsfNMei2kfBokdItlQgw=
In-Reply-To: <4CE87674.4090909@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

On Sun, Nov 21, 2010 at 2:31 AM, Edward Shishkin
<edward.shishkin@gmail.com> wrote:
> Changes since 2.6.35:
>
> . Fixed ->write_end() method: the old one didn't update i_size, and t=
his
> =A0resulted in empty files and "orphan" items. The problem took place=
 only
> =A0for splice users (loop devices, pipe2, etc).
>
> . Implemented ->sync_fs() method of super operations. Since introduci=
ng a
> =A0new per-bdi flushing stuff reiser4 wasn't able to perform sync on =
umount.
> =A0Now such sync is performed by reiser4_sync_fs().
>
> . Fixed an old bug which led to non-deletable directories.
>
> . Fixed an old bug in tail conversion, which led to data corruption w=
hen
> =A0running in disk space pressure situations.
>
> Please, find at
> http://www.kernel.org/pub/linux/kernel/people/edward/reiser4/reiser4-=
for-2.6/
>
> Thanks,
> Edward.
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-de=
vel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

Hi Edward,

thank you very much ! :)

Regards

Matt
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
