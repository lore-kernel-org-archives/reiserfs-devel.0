From: Chris Mason <mason@suse.com>
Subject: Re: Oops with in nfsd - 2.4.19-pre6
Date: 14 Nov 2002 12:46:51 -0500
Message-ID: <1037296011.20553.285.camel@tiny>
References: <20021031210828.45F4A216991@server5.fastmail.fm>
	<1036099804.14984.165.camel@tiny>
	<20021112182949.45436c95.philippe.gramoulle@mmania.com>
	<1037211258.288.97.camel@tiny>
	<20021113194008.6dadeed5.philippe.gramoulle@mmania.com>
	<1037219001.21957.151.camel@tiny>
	<20021114170409.5f9b9108.philippe.gramoulle@mmania.com>
	<1037291572.287.277.camel@tiny> 
	<20021114184153.3298a89b.philippe.gramoulle@mmania.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11996-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021114184153.3298a89b.philippe.gramoulle@mmania.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Philippe =?ISO-8859-1?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Cc: reiserfs-list@namesys.com, jack@ucw.cz

On Thu, 2002-11-14 at 12:41, Philippe Gramoull=E9 wrote:

>   |  Now that I've looked at it, I think the only reject is that parisc-3=
2
>   |  already has one hunk applied, and x86-64 needs to have quotav2 suppo=
rt
>   |  added.  Neither one affects i386, but I'll do some tests here.  Jan,=
 am
>   |  I missing something?
>=20
> There was indeed some rejects in parisc-32 but there were lot more than t=
hat.
> Rejects were when applying reiserfs-quota-22.diff.
> (using vanilla 2.4.20rc1 + ftp.suse.com:/pub/people/mason/patches/reiserf=
s/quota-2.4/2.4.19 quota
> patches)

Those are conflicts between the reiserfs quota and the data logging.=20
But, I already have data-logging quota patches, so I'm only really
worried about Jan's base quota patch.

-chris



