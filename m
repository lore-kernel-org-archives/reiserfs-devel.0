From: Denic Sinisa <sdenic@yandex.ru>
Subject: reiser4->grub
Date: Mon, 05 Oct 2009 12:24:01 +0400
Message-ID: <6721254731041@webmail58.yandex.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Hallo,Edward.
I sent you reiser4progs(1.05.,1.06.1.07) tree grep results a few days a=
go, you probably didn't see it...(haven't any responce of you).
I've got an idea, about these linking problems.Want to hear your opinio=
n.=20
Is it posible that linking errors between grub-reiser4 and reiser4progs=
 accure due the toolchain incompatibility?
Maybe grub-reiser4-2005 and reiser4progs aren't supposed to be compiled=
 together, with an x86_64 gcc compiler(linker), I haven't try x86 one y=
et. =20

Sinisa
--=20
=D0=A1=D0=B8=D0=BB=D1=8C=D0=BD=D0=B0=D1=8F =D0=BF=D0=BE=D1=87=D1=82=D0=B0=
 =D0=BD=D0=B0=D1=85=D0=BE=D0=B4=D0=B8=D1=82=D1=81=D1=8F =D0=B7=D0=B4=D0=
=B5=D1=81=D1=8C: http://mail.yandex.ru/promo/new/attachments
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
