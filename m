From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: silent semantic changes with reiser4
Date: Wed, 01 Sep 2004 16:13:32 +0100
Message-ID: <1094051610.2777.20.camel@localhost.localdomain>
References: <Pine.LNX.4.44.0408261607070.27909-100000@chimarrao.boston.redhat.com>
	 <412E4999.1050504@sover.net>  <9FuGrTY3cDD@3247.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-21213-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <9FuGrTY3cDD@3247.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Claus =?ISO-8859-1?Q?F=E4rber?= <claus@faerber.muc.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, reiserfs-list@namesys.com, linux-fsdevel@vger.kernel.org

On Maw, 2004-08-31 at 12:01, Claus F=C3=A4rber wrote:
> A simple convention that meta data files start with, say ".$", would be =20
> enough.

POSIX/SuS don't permit this. The only "free" namespace is that starting
"//" (and not as some desktops seem to think foo://). Remember always
send GUI desktop users files called http://read.me  .. its fun 8)

The // doesn't really help because you don't want extensions at the path
top.=20

Another interesting question btw with substreams of a file is what the
semantics of fchown, fstat, fchmod, fchdir etc are, or of mounting a
file over a substream.

Alan

