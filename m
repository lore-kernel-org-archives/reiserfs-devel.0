From: claus@xn--frber-gra.muc.de (=?ISO-8859-1?Q?Claus_F=E4rber?=)
Subject: Re: silent semantic changes with reiser4
Date: 03 Sep 2004 15:23:00 +0200
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <9G9vIAK3cDD@gmane.3247.org>
References: <Pine.LNX.4.44.0408261607070.27909-100000@chimarrao.boston.redhat.com>
	<412E4999.1050504@sover.net> <9FuGrTY3cDD@3247.org>
	<1094051610.2777.20.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel=40m.gmane.org-S269880AbUIDLJn@vger.kernel.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-kernel@vger.kernel.org
Cc: reiserfs-list@namesys.com, linux-fsdevel@vger.kernel.org

Alan Cox <alan@lxorguk.ukuu.org.uk> schrieb/wrote:
> On Maw, 2004-08-31 at 12:01, Claus F=E4rber wrote:
>> A simple convention that meta data files start with, say ".$", would
>> be enough.

> POSIX/SuS don't permit this. The only "free" namespace is that starti=
ng
> "//" (and not as some desktops seem to think foo://). Remember always
> send GUI desktop users files called http://read.me  .. its fun 8)

Well, the problem is that one does want the metadata to be in the
ordinary namespace so that they are accessible with POSIX tools.
(The current version of) POSIX does not have a "unified" namespace so a
unified namespace can't be POSIX.

I wonder if it makes sense to have an environment variable (maybe
POSIXLY_CORRECT) to switch between POSIX and the unified namespace
model. Of course, this would mean that all of this is handled in
userspace (e.g. libc), whereas the kernel and filesystems export more
"traditional" (e.g. with openat) interfaces. Accessing metadata as
ordinary files would then work with other filesystems, too.

Claus
--=20
http://www.faerber.muc.de

