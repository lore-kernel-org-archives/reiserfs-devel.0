From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: [BK] ReiserFS file write bug fix for 2.4
Date: Wed, 11 Sep 2002 19:34:11 +0200
Message-ID: <200209111934.11373.Dieter.Nuetzel@hamburg.de>
References: <3D7F7783.6030804@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11420-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3D7F7783.6030804@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Hans Reiser <reiser@namesys.com>, marcelo@conectiva.com.br, linux-kernel@vger.kernel.org, Reiserfs mail-list <Reiserfs-List@Namesys.COM>

On Wednesday 11 September 2002 19:04, Hans Reiser wrote:
> Well, at least getting the new file write code into pre6 found this bug
> for us....  please apply.

What is the "right" way to get the new block allocation going?
The mount option (-o alloc=3Dprealloc min=3D4:preallocsize=3D9) only or bet=
ter a=20
"reformat"?

Thanks,
	Dieter
--=20
Dieter N=FCtzel
Graduate Student, Computer Science

University of Hamburg
Department of Computer Science
@home: Dieter.Nuetzel at hamburg.de (replace at with @)

