From: =?utf-8?B?Sm9uw6HFoSBWaWRyYQ==?= <vidra.jonas@seznam.cz>
Subject: Re: Is there any reason reiser4 took this long on a large file delete
 process.
Date: Sat, 05 Feb 2011 10:13:10 +0100
Message-ID: <op.vqfaj8lghogzsi@g17b>
References: <9af190a7cd5249f4cd484b1cfc20b89e@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <9af190a7cd5249f4cd484b1cfc20b89e@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed	delsp=yes"
To: doiggl@velocitynet.com.au
Cc: ReiserFS mailing list <reiserfs-devel@vger.kernel.org>

On Sat, 05 Feb 2011 04:14:41 +0100 <doiggl@velocitynet.com.au> wrote:

> Hello,
> Is there any reason reiser4 took this long on a large file delete pro=
cess
>
> - File size 4,237,037,568 openSUSE-DVD-Build0957-i586.iso
>
> # time rm /media/disk/iso/openSUSE-DVD-Build0957-i586.iso
>
> real    12m4.027s
> user    0m0.000s
> sys     1m10.132s

You use cryptcompress, right? A compressed file is AFAIK split into man=
y
small fragments, which means that lots of records in the tree have to b=
e
changed while deleting the file.

--=20
Jon=C3=A1=C5=A1 Vidra, vidra.jonas@seznam.cz
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
