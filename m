From: Lars Marowsky-Bree <lmb@suse.de>
Subject: Re: reiserfs on redhat advanced server?
Date: Fri, 31 Jan 2003 13:39:43 +0100
Message-ID: <20030131123943.GH15359@marowsky-bree.de>
References: <20030130173522.3aa4d0e1.pegasus@nerv.eu.org> <3E397A19.60409@namesys.com> <20030130234142.E8448@vestdata.no> <3E3A6071.6060102@namesys.com> <20030131115333.GC15359@marowsky-bree.de> <3E3A67AE.4050601@namesys.com> <20030131122147.GE15359@marowsky-bree.de> <3E3A6D76.7080300@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12577-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3E3A6D76.7080300@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

On 2003-01-31T15:35:02,
   Hans Reiser <reiser@namesys.com> said:

> I understand and support being pissed at Linus for calling it 2.4.0 when =

> it wasn't stable enough before 2.4.18 because VM and VFS were still=20
> being changed, but Marcelo is pretty stable in all of his official=20
> releases, and it is easy to get him to take good code.

No wonder, Marcelo came 18 minors later. Those kind of release cycles would=
 be
quite inacceptable.

> >>From "buzzwords" like 'enterprise features missing' or missing support
> >>for
> >hardware to different schedulers, accomodations for IHVs/ISVs which
> >mainline doesn't want (yet) etc. The way it works seems to be that distr=
os
> >test drive a lot of code before it gets merged into mainline, at the
> >expense of mainline being slightly behind quite often.
> So it should be the mainline that is certified....

Woot? Mainline tends to crash under Oracle or SAP, for example, lacks drive=
rs
etc. Yeah, this is a problem, but don't bitch at the distros about it, but =
at
the driver developers etc.

> I am not really opposed to vendors shipping their own kernels and=20
> supporting them, but I am opposed to them not supporting an official=20
> stable Marcelo kernel unless they have a specific reason not to.=20

This is a pointless discussion. The specific argument is "Support cost". End
of discussion.


Sincerely,
    Lars Marowsky-Br=E9e <lmb@suse.de>

--=20
Principal Squirrel=20
SuSE Labs - Research & Development, SuSE Linux AG
 =20
"If anything can go wrong, it will." "Chance favors the prepared (mind)."
  -- Capt. Edward A. Murphy            -- Louis Pasteur
