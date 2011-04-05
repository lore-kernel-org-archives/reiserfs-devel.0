From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: File copy problems kde 4.5 to 4.6.1 with reiser4 2.6.38
Date: Wed, 06 Apr 2011 00:32:21 +0200
Message-ID: <4D9B9875.60400@gmail.com>
References: <201103090918.47762.berny@dwami.com> <4D7774D7.3030908@dwami.com> <4D7FA356.1000309@gmail.com> <201104041142.42496.berny@dwami.com> <BANLkTimmZ4GDX2-K=TaNLOMUg8+C6uyWHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <BANLkTimmZ4GDX2-K=TaNLOMUg8+C6uyWHQ@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Giuseppe Argentieri <joe.silver@gmail.com>
Cc: Berny <berny@dwami.com>, reiserfs-devel@vger.kernel.org

On 04/05/2011 09:36 PM, Giuseppe Argentieri wrote:
> Hi
>
> I've also the same problem with nautilus 2.32 (kernel 2.6.38.2)
>
> Cheers,
>
> Giuseppe
>
>
> 2011/4/4 berny=AE<berny@dwami.com>
>>
>> Dear Edward, I tried the new patch for the 2.6.38 but the bug is sti=
ll there so no file copy using
>> kde file managers,

Hello.

I still have problems with reproducing this issue.

Copy of files built of tails (<16K) and extents via
splice(2) works fine for me. Unfortunately I don't
have kde and a time to install it in the near future.
Is it reproducible with gnome managers?

Thanks,
Edward.


  files are still empty till unmount.
>>
>> Thanks, Paolo
>
>
> --
>
> Giuseppe Argentieri<joe.silver@gmail.com>
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-de=
vel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
