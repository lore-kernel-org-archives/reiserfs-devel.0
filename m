From: "Mathieu" <matt@minas-morgul.org>
Subject: Re: mount issue with kernels >2.6.11
Date: Wed, 07 Sep 2005 14:44:09 +0200
Message-ID: <87y869yrmu.fsf@barad-dur.minas-morgul.org>
References: <431EDBF0.3080701@darthvader.us>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25891-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <431EDBF0.3080701@darthvader.us> (Yiannis Mavroukakis's message
	of "Wed, 07 Sep 2005 13:24:16 +0100")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Yiannis Mavroukakis <jander@darthvader.us>
Cc: reiserfs-list@namesys.com

Yiannis Mavroukakis <jander@darthvader.us> disait derni=E8rement que :

> Hi,
>
> I'm running reiser4 on 2.6.11-mm4 at the moment. I compiled 2.6.13-mm1=20
> (and subsequently a few more kernel version in-between)  as a=20
> replacement, only to find out that it blows up in my face when the root=20
> fs is due to be mounted:
>
> VFS: Cannot open root device "801" or unknown-block
> Unable to mount root fs on unknown-block (8,1)

not a reiser4 error. your kernel does not see your harddrive.

> Now, I am not sure this is due to reiser4, I suspect some change in the=20
> LSI MegaRaid legacy driver
> that may be the culprit, but I wanted the opinion of the list first,=20
> before I go crying to someone else :)

you got it :)

--=20
Mathieu
