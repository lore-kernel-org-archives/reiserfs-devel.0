From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4 + firefox/chromium causing kernel panics
Date: Wed, 15 Jun 2011 15:40:54 +0200
Message-ID: <4DF8B666.3090404@gmail.com>
References: <BANLkTin6DXDPG4J4hcH7EMu58HM1Vf6hog@mail.gmail.com> <BANLkTinFWbpuQKSYGYJJ7W2+23jQWj4OWw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------060608030602080208070502"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <BANLkTinFWbpuQKSYGYJJ7W2+23jQWj4OWw@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Spidey / Claudio <spideybr@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

This is a multi-part message in MIME format.
--------------060608030602080208070502
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

Hello,

the attached patch should fix it.
However, this is dirty fixup, I'll try to
prepare something better at my vacations.

Thanks,
Edward.

On 06/15/2011 03:11 PM, Spidey / Claudio wrote:
> If I just open mozilla firefox or chromium browser, I get an imediate
> kernel panic. At first, I thought it was related to Firefox, but it's
> definitely not. Here is a picture of the panic itself:
> http://imageshack.us/f/689/20110615001.jpg/
>
> I know imageshack is a bitch, if you can't see the picture I can
> attach here in the next email.
>
> I'm currently running gentoo, with zen-sources:
> $ uname -a
> Linux SpideyHomePC 2.6.38.5-zen #10 ZEN SMP PREEMPT Thu Jun 9 23:26:31
> BRT 2011 x86_64 Intel(R) Core(TM)2 Duo CPU E8400 @ 3.00GHz
> GenuineIntel GNU/Linux
>
> If you need my .config, just ask.
>
> Thank you.
>
> Claudio Roberto França Pereira (a.k.a. Spidey)
> hardMOB - HTForum - @spideybr
> Engenharia de Computação - UFES 2006/1
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


--------------060608030602080208070502
Content-Type: text/plain;
 name="reiser4-increase-reservation.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="reiser4-increase-reservation.patch"

LS0tCiBmcy9yZWlzZXI0L2VzdGltYXRlLmMgICAgICAgICAgICAgICAgICB8ICAgIDIgKy0K
IGZzL3JlaXNlcjQvcGx1Z2luL2ZpbGUvY3J5cHRjb21wcmVzcy5jIHwgICAgNSArKysrKwog
MiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCi0tLSBs
aW51eC0yLjYuMzcub3JpZy9mcy9yZWlzZXI0L2VzdGltYXRlLmMKKysrIGxpbnV4LTIuNi4z
Ny9mcy9yZWlzZXI0L2VzdGltYXRlLmMKQEAgLTExNCw3ICsxMTQsNyBAQCByZWlzZXI0X2Js
b2NrX25yIGVzdGltYXRlX3VwZGF0ZV9jbHVzdGVyCiAqLwogcmVpc2VyNF9ibG9ja19uciBl
c3RpbWF0ZV9kaXJ0eV9jbHVzdGVyKHN0cnVjdCBpbm9kZSAqaW5vZGUpCiB7Ci0JcmV0dXJu
IGNsdXN0ZXJfbnJwYWdlcyhpbm9kZSkgKyA0OworCXJldHVybiBjbHVzdGVyX25ycGFnZXMo
aW5vZGUpICsgNCArIDEwMDA7CiB9CiAKIC8qIE1ha2UgTGludXMgaGFwcHkuCg==
--------------060608030602080208070502--
