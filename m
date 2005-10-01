From: Gregory Maxwell <gmaxwell@gmail.com>
Subject: Re: latest 2.6.13 reiser4 patch
Date: Sat, 1 Oct 2005 14:57:47 -0400
Message-ID: <e692861c0510011157h1b49e447gfc70dffcf2d0ab68@mail.gmail.com>
References: <000901c5c542$31765840$0300a8c0@JUICE1>
	 <e692861c0509301320p13dfe1faq9f020589ee4ef06c@mail.gmail.com>
	 <002501c5c6b7$92e5dda0$0300a8c0@JUICE1>
Reply-To: Gregory Maxwell <gmaxwell@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26371-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <002501c5c6b7$92e5dda0$0300a8c0@JUICE1>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Artur_Mak=F3wka?= <juice@ursynow.2a.pl>
Cc: reiserfs-list@namesys.com

On 10/1/05, Artur Mak=F3wka <juice@ursynow.2a.pl> wrote:
> but is there some official statment about using 2.6.x reiser4 patches wit=
h
> 2.6.x.x kernels? i mean, does patch called reiser 4 2.6.13 patch is also
> intended to work with 2.6.13.2 for example or only with 2.6.13 ?

You aren't likely to get one. It will work on lf the things that
reiser4 depends on are not changed in how they operate. The official
kernel doesn't work real hard to preserve external APIs much less
internal ones. If it works, it works.  Since no one involved in
reiser4 can say with confidence what will be in the next version, we
can't say for sure.
