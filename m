From: Lars Marowsky-Bree <lmb@suse.de>
Subject: Re: Snapshots a la NetApp?
Date: Sun, 23 Mar 2003 12:18:31 +0100
Message-ID: <20030323111831.GF12916@marowsky-bree.de>
References: <200303221822.34401.phma@webjockey.net> <33433.10.20.2.148.1048390681.squirrel@alpha>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-13346-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <33433.10.20.2.148.1048390681.squirrel@alpha>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: kend@xanoptix.com, reiserfs-list@namesys.com

On 2003-03-22T22:38:01,
   kend@xanoptix.com said:

> I'm just wondering if there's any development being done on NetApp-like
> snapshots.  (This differs from LVM snapshots in that it's file-by-file,
> instead of volume based.)  If not, has anyone given it any consideration?=
=20
> It would be a huge win for the RAID-in-a-box folks, and, speaking as a
> sysadmin, is something about which I dream frequently.

Well, implementing it at the LVM level isn't entirely bad though. What kind=
 of
advantage would have implementing at the filesystem level have? It would ne=
ed
to compensate at least the disadvantage of being less general.


Sincerely,
    Lars Marowsky-Br=E9e <lmb@suse.de>

--=20
SuSE Labs - Research & Development, SuSE Linux AG
 =20
"If anything can go wrong, it will." "Chance favors the prepared (mind)."
  -- Capt. Edward A. Murphy            -- Louis Pasteur
