From: Diego Calleja <diegocg@gmail.com>
Subject: Re: reiser4 plugins
Date: Thu, 30 Jun 2005 21:45:20 +0200
Message-ID: <20050630214520.5a939e62.diegocg@gmail.com>
References: <20050629135820.GJ11013@nysv.org>
	<200506291719.j5THJCSg011438@laptop11.inf.utfsm.cl>
	<20050630095926.GN11013@nysv.org>
	<17091.60930.633968.822210@gargle.gargle.HOWL>
	<20050630142107.GQ11013@nysv.org>
	<17092.3415.28856.827179@gargle.gargle.HOWL>
	<20050630153738.GU11013@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-24854-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050630153738.GU11013@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Markus   =?ISO-8859-15?Q?T=F6rnqvist?= <mjt@nysv.org>
Cc: nikita@clusterfs.com, doug@mcnaught.org, hubert@uhoreg.ca, mrmacman_g4@mac.com, ninja@slaphack.com, Valdis.Kletnieks@vt.edu, ltd@cisco.com, gmaxwell@gmail.com, reiser@namesys.com, jgarzik@pobox.com, hch@infradead.org, akpm@osdl.org, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

El Thu, 30 Jun 2005 18:37:38 +0300,
mjt@nysv.org (Markus   T=F6rnqvist) escribi=F3:

> If I want to access metadata with bash, do I patch bash to support
> both Gnome's and KDE's solutions? Was there one of XFCE too?
> And FooBarXyzzyWM that'll want to do it's own VFS next year?


The freedesktop people is already designing a common userspace VFS,
take a look at http://freedesktop.org/Software/dvfs . At least it looks like
there'll be a common standard, even if the standard is crappy.

Apparently one of the main reasons for DVFS to exist is "POSIX is not
enought for us".=20

This approach  is broken by design, having a second-class VFS separated
from the main VFS (what libc functions see, etc) is wrong, IMO.

The Mockup project (they try to bring a BeOS-like API to linux, I think) is
something similar to DVFS but using FUSE.
Take a look at  http://wiki.mockup.org
(currently down, google cache at
http://66.249.93.104/search?q=3Dcache:OnvclDCpwOwJ:wiki.mockup.org/UserSpac=
eVFS+mockup+wiki+VFS&hl=3Des&lr=3D&client=3Dfirefox&strip=3D1 )
