From: michael chang <thenewme91@gmail.com>
Subject: Re: Executability problem
Date: Tue, 30 Aug 2005 14:21:48 -0400
Message-ID: <b14e81f0050830112173c03579@mail.gmail.com>
References: <20050830152859.45e0b010.Kris.VanBruwaene@vrt.be>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25731-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050830152859.45e0b010.Kris.VanBruwaene@vrt.be>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Kris.VanBruwaene@vrt.be
Cc: reiserfs-list@namesys.com

On 8/30/05, Kris Van Bruwaene <Kris.VanBruwaene@vrt.be> wrote:
> I recently discovered that scripts have become non-executable on my reise=
rfs share, even though the -x flags are set:
> root@A00012344:/home/kris# cat tst
> #! /usr/bin/perl -w
> print "Hello world\n";
> root@A00012344:/home/kris# ./tst
> bash: ./tst: /usr/bin/perl: bad interpreter: Toegang geweigerd #(=3DAcces=
s denied)

I believe the line should read
#!/usr/bin/perl -w
not=20
#! /usr/bin/perl -w

[no space between "!" and first "/"]

unless that's a typo between output and your file.

--=20
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
