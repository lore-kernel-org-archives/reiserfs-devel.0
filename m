From: dimas <dimas000@ya.ru>
Subject: Re: Reiser4 for Linux-2.6.36
Date: Sun, 21 Nov 2010 18:39:10 +0300
Message-ID: <4CE93D1E.6040408@ya.ru>
References: <4CE87674.4090909@gmail.com>
Reply-To: dimas000@ya.ru
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1290353951; bh=100U8J/t89jLk5X8hxmO8dbuvQQhZDgioykSKzuZDms=;
	h=Message-ID:Date:From:Reply-To:MIME-Version:To:Subject:References:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=iA5J4lX9sjLqY/UjmT7BjxwQbLiKwdhAeWsOe/N8KfOTmbDGjN8tnVM5qthcrXoW1
	 LgZ0JxM9aMNjpBqXKZyJ8EL+qqgmrm+UIlKiZhCrLRYmbyETRuu2lIiFt0prueiENd
	 fPJLedJLV0GBqbfrbxu+r4IxQr0qcB8iuR40RaSE=
In-Reply-To: <4CE87674.4090909@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>

that sounds good! but as i remember, you've mentioned some issues about=
 2.6.35
earlier, which were to be fixed. among them there was the troble with l=
oop
devices. how about this? and there was a mail here where author complai=
ned about
problems after moving from 34 to 35. is 36 version more stable or it is=
 better
to still rely on 34.7, which works nice for me?

Edward Shishkin =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> Changes since 2.6.35:
>=20
> . Fixed ->write_end() method: the old one didn't update i_size, and t=
his
>  resulted in empty files and "orphan" items. The problem took place o=
nly
>  for splice users (loop devices, pipe2, etc).
>=20
> . Implemented ->sync_fs() method of super operations. Since introduci=
ng a
>  new per-bdi flushing stuff reiser4 wasn't able to perform sync on um=
ount.
>  Now such sync is performed by reiser4_sync_fs().
>=20
> . Fixed an old bug which led to non-deletable directories.
>=20
> . Fixed an old bug in tail conversion, which led to data corruption w=
hen
>  running in disk space pressure situations.
>=20
> Please, find at
> http://www.kernel.org/pub/linux/kernel/people/edward/reiser4/reiser4-=
for-2.6/

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
