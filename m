From: "Enric Ramos" <eramos@atlasit.com>
Subject: RE: Problem with ReiserFS + NFS + Convolo
Date: Mon, 16 Jun 2003 19:36:25 +0200
Message-ID: <9985D86E48B29B40BABD3B4A177F69261DD167@atlassrv.int.atlassolutions.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14566-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
content-class: urn:content-classes:message
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Oleg Drokin <green@namesys.com>, =?iso-8859-1?Q?Oscar_Garc=EDa?= <ogarcia@atlasit.com>
Cc: reiserfs-list@namesys.com


Hi Oleg.

My name is Enric Ramos. I'm a collegue of Oscar Garcia.

I'm contacting you because I have talked with the convolo people, and =
they told me that currently they does'nt support kernel 2.4.20, so we =
are not able to apply the patch that you gave to Oscar, and obviusly, we =
are not able to use kernel 2.4.21.

In this way... is it possible to make a patch for the 2.4.18 release in =
order to solve the "iget() race bug" ? Do you know if this patch exists =
for this release ?

As far as I know, convolo people is working hard in order to support at =
least kernel version 2.4.20, but unfortunately we don't have any =
deadline regarding this solution.  They have a beta (or maybe alpha) =
relase set of patches, but it's not a good idea to use it (until they =
release an stable version of their personalized patches)

Our costumer is having a lot of problems with this issue, and we need to =
solve that as soon as possible.=20

Do you have any alternative to solve this issue ??

Thanks in advance

Enric Ramos Mas
Atlas Internet Solutions
Telf: +34 934 452 461 - Fax: +34 934 452 145
e-mail: eramos@atlasit.com
http://www.atlassolutions.net

*
La informaci=F3n transmitida en este mensaje es CONFIDENCIAL y est=E1 =
dirigida =FAnicamente al destinatario del mensaje arriba indicado. No =
puede ser transmitida ni revelada a persona distinta del destinatario =
sin autorizaci=F3n expresa del remitente.
La recepci=F3n de este mensaje, por cualquier causa, por persona =
distinta al destinatario del mismo no le autoriza para hacer uso alguno =
de la informaci=F3n. En este caso queda prohibida, y puede ser =
il=EDcita, cualquier divulgaci=F3n, copia, distribuci=F3n y/o cualquier =
uso de la informaci=F3n. Le rogamos borre inmediatamente el mensaje de =
su sistema y, en su caso, todas las copias del mismo y lo notifique al =
remitente. Gracias.


-----Mensaje original-----
De: Oleg Drokin [mailto:green@namesys.com]=20
Enviado el: s=E1bado, 14 de junio de 2003 14:35
Para: Oscar Garc=EDa
CC: reiserfs-list@namesys.com; Enric Ramos
Asunto: Re: Problem with ReiserFS + NFS + Convolo

He;;p!

On Sat, Jun 14, 2003 at 02:29:21PM +0200, Oscar Garc?a wrote:

> I'm running  a linux cluster with convolo and two nodes. One of the =
services I offer from this cluster is nfs to a bunch of solaris =
machines. Now every so often I get an error like this:
> Jun 13 13:29:44 cluster1 kernel: 0: reiserfs_unlink
> Jun 13 13:29:44 cluster1 kernel: reiserfs[3736]: assertion !( =
!truncate && ( inode -> u.reiserfs_i.i_flags & i_link_saved_un
> link_mask ) ) failed at super.c:238:add_save_link: saved link already =
exists for unlinked inode c16f7
> And the uptime of the machine begins to go up, and up, and up... As =
soon as this happens processes begin to get blocked in the wait queue of =
the kernel, and the machine is still up but gives no service.
> 2x Compaq DL360G2, 2xPIII 14.Ghz, 2Gb RAM, 2x18Gb HDD, 1 QL2000 FC =
Adapter
> 1x External Storage of 1.4 Tb
> Running RedHat 7.2, kernel 2.4.18 #12 SMP with patches for Convolo 2.0 =
(www.missioncrtiticallinux.com)

Hm. Sounds like you was bitten by iget4() race bug.
You need to upgrade to 2.4.21 or to apply the patch I am attaching here.

Bye,
    Oleg
