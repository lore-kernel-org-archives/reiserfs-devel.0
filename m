From: =?utf-8?B?Sm9uw6HFoSBWaWRyYQ==?= <vidra.jonas@seznam.cz>
Subject: Re: fsck.reiser4 --build-fs /dev/sdb report
Date: Wed, 18 May 2011 12:56:08 +0200
Message-ID: <op.vvobbux1hogzsi@g17b>
References: <5c3c4d6d36bc2aba8b9562c21ecbd080@mail.velocitynet.com.au>
 <4DC6F1B0.8060808@gmail.com>
 <33cb751bd18934214c9a3b1115ae673d@mail.velocitynet.com.au>
Reply-To: "ReiserFS mailing list" <reiserfs-devel@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <33cb751bd18934214c9a3b1115ae673d@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed	delsp=yes"
To: doiggl@velocitynet.com.au
Cc: ReiserFS mailing list <reiserfs-devel@vger.kernel.org>

On Wed, 18 May 2011 12:48:55 +0200 <doiggl@velocitynet.com.au> wrote:

> Hello,
> In relation to
>> Have smaller volumes for reiser4, if possible.
> Question: What size smaller volumes for reiser4 would be safe to use =
?
> Glven disk is 2000.4 GB

It isn't safer, but fsck is (obviously) faster on smaller partitions.
=46ilesystem checks of large volumes can prevent an entire system from
starting up for hours.

--=20
Jon=C3=A1=C5=A1 Vidra, vidra.jonas@seznam.cz
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
