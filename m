From: Newsmail <newsmail@satimex.tvnet.hu>
Subject: Re: what data resides on a given block
Date: Wed, 05 Jun 2002 16:04:35 +0100
Message-ID: <5.0.2.1.2.20020605155413.01ba34b8@pop.tvnet.hu>
References: <5.0.2.1.2.20020605145712.01ba40f0@pop.tvnet.hu>
 <5.0.2.1.2.20020605145712.01ba40f0@pop.tvnet.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10522-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020605170657.A19597@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: reiserfs-list@namesys.com

thx Oleg for your fast answer, I have another question too concerning this:=
=20
actually I used badblocks as described on the reiserfs page. so now I know=
=20
which blocks are bad, and I would like to use the utility add-bad-block.=20
actually the exemple tells me to make a new reiserfs filesystem, then make=
=20
whatever file I want, and 'assign those bad blocks to that file'. Actually=
=20
I dont have the possibility to reformat my drive, and I have some files=20
residings on the bad blocks. I would like to know what will happen if I use=
=20
the add-bad-block program on my filesystem where those bad blocks are=20
occupied by an already existing file. actually I'M aware of some files that=
=20
are on those bad blocks, but I'm sure there are others that I dont know=20
about. so if I use the add-bad-block program, will this work just fine, and=
=20
will the bad blocks be deactived 'forever' or it will just wont work at=20
all, for exemple when I try to delete afterwards a file that contained=20
those blocks before. sorry if I have a bad english,
regards,
greg

ps: is there a possibility yet to set a different block size then the=20
default, or this will only be implemented in reiser4.
At 14:06 2002. 06. 05.=AD, you wrote:
>Hello!
>
>    If you want to look at the contents, you can extract the content into
>    a file with dd and then view it.
>    If you want to know if the block represents some FS metadata,
>    you can use debugreiserfs -1 blocknumber
>    and it will print the content of metadata block (if it will recognise
>    block contents as metadata)
>
>    This only applies to reiserfs, of course.
>
>Bye,
>     Oleg
>On Wed, Jun 05, 2002 at 02:58:20PM +0100, Newsmail wrote:
> > I would like to know, if I know the blocknumber, is there any way to see
> > what data I have on it?
> > greg
> >
> >


