From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: silent semantic changes in reiser4 (brief attempt to document the idea of what reiser4 wants to do with metafiles and why
Date: Thu, 2 Sep 2004 16:32:34 +0300
Message-ID: <20040902133234.GO26192@nysv.org>
References: <41323AD8.7040103@namesys.com> <20040831131201.GA1609@elf.ucw.cz> <200408311536.00948.christian.mayrhuber@gmx.net> <41370B17.40304@nwrk.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-21279-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <41370B17.40304@nwrk.dyndns.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-1?Q?Mika=EBl?= Cluseau <nwrk@nwrk.dyndns.org>
Cc: reiserfs-list@namesys.com

On Thu, Sep 02, 2004 at 01:59:19PM +0200, Mika=EBl Cluseau wrote:
>Why not a kernel option (accessible through /proc if needed for scripts=20
>or the like) ?

What if there has to be a patch for find so it accesses metadata as well,
it seems sort of ugly that it has to check /proc or /sys or somesuch
to access the name.

Same thing with the kernel exporting a read-only environment variable.

Hans is pretty stubborn about this and I guess we'll just have to live
with some custom-patched or default name until we see progs that are
dependant on a single name...

--=20
mjt

