From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: a question on lock ordering in write_ordered_buffers()
Date: Thu, 20 Aug 2009 16:16:33 +0200
Message-ID: <4A8D5AC1.1010707@gmail.com>
References: <2014bcab0908200055w10aa616h2c779c3b5690b792@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <2014bcab0908200055w10aa616h2c779c3b5690b792@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?B?7ZmN7IugIHNoaW4gaG9uZw==?= <hongshin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Hello.

=ED=99=8D=EC=8B=A0 shin hong wrote:
> Hi. I have a question on lock ordering
> while I read ReiserFS code in Linux 2.6.30.4.
>
> At write_ordered_buffers() function in reiserfs/journal.c,
>
> What is the lock ordering between spin_lock(lock) and lock_buffer(bh)=
?
>
> It seems that the lock ordering between spin_lock(lock) and
> lock_buffer(bh) is inconsistent.
> At line 858, the lock ordering is spin_lock(lock) =E2=86=92 lock_buff=
er(bh).
>  =20

Nup, at line 858 we have trylock_buffer, which is not the same as
lock_buffer: in our case the process won't wait for the lock to be
released.

> However, at line 881, lock_buffer(bh) =E2=86=92 spin_lock(lock)  sinc=
e add_to_chunk()
> releases and re-takes spin_lock(lock).
>
> Is it necessary that the ordering between two locks is consistent?
>  =20

This is sufficient, but not necessary condition to prevent deadlock.

However, breaking a lock ordering is ugly, and  you will need to defend
every such case explaining why there is no way to keep the ordering,
and writing a lot of (unclear) comments why the deadlock is impossible =
:)
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
