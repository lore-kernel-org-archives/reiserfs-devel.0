From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: Data-Logging Progess?!  (was: Oops with in nfsd
 - 2.4.19-pre6)
Date: Thu, 28 Nov 2002 20:23:23 +0100
Message-ID: <3DE66D2B.2060709@mb.tu-ilmenau.de>
References: <20021031210828.45F4A216991@server5.fastmail.fm>	<1036099804.14984.165.camel@tiny>	<20021112182949.45436c95.philippe.gramoulle@mmania.com>	<1037211258.288.97.camel@tiny>	<20021113194008.6dadeed5.philippe.gramoulle@mmania.com>	<1037219001.21957.151.camel@tiny>	<1037241197.288.206.camel@tiny>	<3DE530F6.3010205@mb.tu-ilmenau.de> <20021128111837.20792d49.philippe.gramoulle@mmania.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12070-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-15?Q?Philippe_Gramoull=E9?= <philippe.gramoulle@mmania.com>
Cc: Chris Mason <mason@suse.com>, reiserfs-list <reiserfs-list@namesys.com>

On 11/28/2002 11:18 AM, Philippe Gramoull=E9 wrote:
> Hi Manuel,
>=20
> We've been using the journal overflow patch sent by Chris since Nov 14t=
h, on a busy
> file server and up to this weekend it proved to solve our problems.
>=20
> But this weekend we experienced 2 crashes on this server so there still=
 might
> be some problems to be fixed. I guess that this justifies the "experime=
ntal" status
> of this patch.
>=20
> In our case , we use :
>=20
> a) NFS
> b) quotas ( as soon as a patch will be ready for this kernel version )
> c) data=3Djournal
>=20
> Thanks,
>=20
> Philippe
>=20

Hi Philippe,

Thank you for your reply.

Did you try other kernels than 2.4.20-rc1? Maybe -rc3?

I remember having had some random ugly stalls while deleting via=20
KDE2.2.2 Konqueror with -rc1 that seem to have disappered with -rc3.

IIRC I once recreated my local kernel sources via a shell script (simple =

file copy from another disk), patched them wrongly and then stalled=20
while deleting the mess via Konqueror. Everything was working except for =

this "Delete files" window. After rebooting the delete worked.

I don't know if exactly this was related to some possible race=20
conditions Chris mentioned in one of his previous mails.

Thanks,

Manuel.

