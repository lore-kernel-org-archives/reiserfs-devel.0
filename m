From: Ross Biro <ross.biro@gmail.com>
Subject: Re: -mm -> 2.6.13 merge status
Date: Thu, 23 Jun 2005 15:56:20 -0400
Message-ID: <8783be66050623125612b19b32@mail.gmail.com>
References: <20050620235458.5b437274.akpm@osdl.org.suse.lists.linux.kernel>
	 <p73d5qgc67h.fsf@verdi.suse.de> <42B86027.3090001@namesys.com>
	 <20050621195642.GD14251@wotan.suse.de> <42B8C0FF.2010800@namesys.com>
	 <84144f0205062223226d560e41@mail.gmail.com>
	 <42BA67C9.7060604@namesys.com>
	 <1119543302.4115.141.camel@tribesman.namesys.com>
	 <20050623162325.GA21971@dspnet.fr.eu.org>
Reply-To: Ross Biro <ross.biro@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-24510-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050623162325.GA21971@dspnet.fr.eu.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Olivier Galibert <galibert@pobox.com>, Vladimir Saveliev <vs@namesys.com>, Pekka Enberg <penberg@gmail.com>, Alexander Zarochentcev <zam@namesys.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

On 6/23/05, Olivier Galibert <galibert@pobox.com> wrote:

> No, I think he means the traditional:
>=20
> reiser4_fill_super()
> {
>    if (init_a())
>      goto failed_a;
.
.
.

IMO this works very well when the initialization always completes or
fails totally in a single routine.  When your init routine can leave
something partially inited, then putting all of the cleanup code in a
single function and using the enums eliminates duplicate code and
makes things easier to read.  (it's a state machine like many device
drivers and network stacks).

Also, perhaps a compromise on the asserts at the beggining of
functions.  If they are moved into a header file, say
resier4_contracts.h and replaced with a single macro, you get most of
the benefits and elminate most of the clutter.  If properly done,
there may even be some advantages gained by auto generating the
conttact.h file(s) from some sort of formal spec or design doc.

    Ross
