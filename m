From: Philippe =?ISO-8859-1?B?R3JhbW91bGzp?= <philippe.gramoulle@mmania.com>
Subject: Re: Reiserfs with Samba vs NetApp Filer
Date: Fri, 11 Oct 2002 12:54:12 +0200
Message-ID: <20021011125412.2fe02af7.philippe.gramoulle@mmania.com>
References: <Pine.LNX.4.33L2.0210100853240.1670-100000@localhost.localdomain>
	<001b01c26fff$26d23850$0101a8c0@bummer>
	<20021010165854.4381ed7e.philippe.gramoulle@mmania.com>
	<3DA5B971.3040400@namesys.com>
	<20021010195338.138dffcf.philippe.gramoulle@mmania.com>
	<20021011104041.GC29452@marowsky-bree.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11652-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021011104041.GC29452@marowsky-bree.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Lars Marowsky-Bree <lmb@suse.de>
Cc: reiserfs-list@namesys.com


Hi,

On Fri, 11 Oct 2002 12:40:41 +0200
Lars Marowsky-Bree <lmb@suse.de> wrote:

  |  On 2002-10-10T19:53:38,
  |     Philippe Gramoull=E9 <philippe.gramoulle@mmania.com> said:
  | =20
  |  > Yes, that's what i meant by "not *out of the box* snapshots".
  | =20
  |  Well, LVM functionality comes out of the box with all modern distribut=
ions.

Ok let me rephrase it: First i didn't want to start a thread on pros/cons o=
f LVM.

And i only wanted to say that LVM (though part of all modern distributions)=
 doesn't
come installed out of the box,at least not on Debain , which we use mainly.
Whereas snapshots on Netapp comes out of the box with DATAONTAP.

But LVM is there of course if one needs snapshot functionnality.

  | =20
  |  > We quite never played with LVM as it adds another software layer and=
 i
  |  > didn't feel it was mature enough at the time we put everything in pr=
oduction
  |  > but given the benefits we might want to give it a try.
  | =20
  |  It is very mature in my experience.

Sure it is : We _do_ use it on databases servers , but mostly for volume ma=
nagement
but not for the snapshot features. I wanted to say that given the complexit=
y of our setup
we didn't feel the need to add another software layer : keeping everything =
in sync is already
not that easy. But sure i'd definitely recommand LVM :o)

  | =20
  |  > BTW, Hans, what you would recommand : LVM or EVMS ?
  | =20
  |  With 2.4, go with LVM1. The jury is still out whether the successor wi=
ll be
  |  EVMS or LVM2 in 2.5/2.6, but I personally have decided to quite like E=
VMS.

Thanks for the input.

  | =20
  | =20
  |  Sincerely,
  |      Lars Marowsky-Br=E9e <lmb@suse.de>
  | =20

Philippe
Lycos Europe
Paris NOC manager.
