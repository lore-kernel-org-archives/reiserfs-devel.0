From: "Yiannis Mavroukakis" <yiannis@jaguarfreight.com>
Subject: Does this look right?
Date: Mon, 29 Nov 2004 13:48:13 -0000
Message-ID: <77912E9FD42896419D1CEF15E1C397A58AFC45@london.jaguarfreightservices.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22615-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Class: urn:content-classes:message
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


Am=20I=20completely=20loosing=20it=20?

Using=202.6.10-rc2-mm3=20allows=20me=20to=20go=20into=20a=20file=20as=20a=20=
directory=20when
the=20file=20has=20the=20executable=20flag...that=20shouldn't=20be=20happe=
ning,=20should
it?

root@firewall:~#=20ls=20-l=20file
-rwxr-xr-x=20=201=20root=20root=200=202004-11-29=2013:50=20file
root@firewall:~#=20cd=20file
root@firewall:~/file#=20ls
ls:=20reading=20directory=20.:=20Not=20a=20directory


Yiannis.

Note:__________________________________________________________________
This=20message=20is=20for=20the=20named=20person's=20use=20only.=20It=20ma=
y=20contain
confidential,=20proprietary=20or=20legally=20privileged=20information.=20N=
o
confidentiality=20or=20privilege=20is=20waived=20or=20lost=20by=20any=20mi=
stransmission.
If=20you=20receive=20this=20message=20in=20error,=20please=20immediately=20=
delete=20it=20and
all=20copies=20of=20it=20from=20your=20system,=20destroy=20any=20hard=20co=
pies=20of=20it=20and
notify=20the=20sender.=20You=20must=20not,=20directly=20or=20indirectly,=20=
use,=20disclose,
distribute,=20print,=20or=20copy=20any=20part=20of=20this=20message=20if=20=
you=20are=20not=20the
intended=20recipient.=20Jaguar=20Freight=20Services=20and=20any=20of=20its=
=20subsidiaries
each=20reserve=20the=20right=20to=20monitor=20all=20e-mail=20communication=
s=20through=20its
networks.
Any=20views=20expressed=20in=20this=20message=20are=20those=20of=20the=20i=
ndividual=20sender,
except=20where=20the=20message=20states=20otherwise=20and=20the=20sender=20=
is=20authorized
to=20state=20them=20to=20be=20the=20views=20of=20any=20such=20entity.
________________________________________________________________________
This=20e-mail=20has=20been=20scanned=20for=20all=20viruses=20by=20Star=20I=
nternet.=20The
service=20is=20powered=20by=20MessageLabs.
