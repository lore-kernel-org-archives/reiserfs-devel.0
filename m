From: Philippe =?ISO-8859-15?Q?Gramoull=E9?= <pgramoul@nerim.net>
Subject: Re: 2.4.21-rc3
Date: Fri, 23 May 2003 16:13:56 +0200
Message-ID: <20030523161356.7986c5d6.pgramoul@nerim.net>
References: <200305232256.17604.russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14228-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200305232256.17604.russell@coker.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Russell Coker <russell@coker.com.au>
Cc: reiserfs <reiserfs-list@namesys.com>


Hello Russell,

On Fri, 23 May 2003 22:56:17 +1000
Russell Coker <russell@coker.com.au> wrote:

  | I've noticed that the modules ide-taskfile.o and ide-io.o depend on eac=
h other=20
  | if you compile the 2.4.21-rc3 with IDE as modules.
  |=20
  | Is this a bug in the kernel or are we supposed to use a new module load=
er that=20
  | can resolve such things?

IIRC, according to Alan Cox, on LKML, IDE shouldn't even work as a module, =
well, if you value
your data.

So why don't you include IDE statically in your kernel ?

Thanks,

Philippe

--=20

Philippe Gramoull=E9
philippe.gramoulle@mmania.com
Lycos Europe - NOC France

