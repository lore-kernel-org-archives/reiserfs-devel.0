From: Soeren Sonnenburg <reiserfs@nn7.de>
Subject: Re: Linux 2.4 -> 2.6 migration
Date: Sat, 08 Nov 2003 08:09:13 +0100
Message-ID: <1068275353.27084.74.camel@localhost>
References: <m3ptg42t8l.fsf@toyland.sauerland.de>
	 <20031107160935.3f02f334.pegasus@nerv.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16013-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20031107160935.3f02f334.pegasus@nerv.eu.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

On Fri, 2003-11-07 at 16:09, Jure Pe=E8ar wrote:
> On Fri, 07 Nov 2003 14:39:06 +0100
> Sebastian Kaps <seb-keyword-reiserfs.0462a0@toyland.sauerland.de> wrote:
>=20
> > Another thing: I had to "hard reboot" my system a few times in the last
> > few months. I also experienced that sometimes parts of files were
> > overwritten with 0x00s or parts of other files. Can someone explain to
> > me how this can happen?
>=20
> Sounds to me like you'd want to check your hardware and ram. I'm dual
> booting between redhat 2.4.20-something and 2.6.0-test9 and have no probl=
ems
> wih reiserfs partitions.

Nope that is expected behaviour without data logging patches.

Soeren

