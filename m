From: "Yiannis Mavroukakis" <yiannis@jaguarfreight.com>
Subject: RE: Congratulations! we have got hash function screwed up
Date: Thu, 30 Dec 2004 13:24:37 -0000
Message-ID: <77912E9FD42896419D1CEF15E1C397A58AFCF2@london.jaguarfreightservices.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22949-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
content-class: urn:content-classes:message
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

>My=20reasoning=20mentioned=20a=20/required/,=20but=20not=20a=20/sufficien=
t/=20criterion.
>In=20other=20words:=20not=20before=20it=20is=20proven=20in=20the=20field=20=
will=20I=20consider=20it
for=20production=20use.
>Remember=20the=20Linux=202.2=20reiserfs=203.5=20NFS=20woes?
>Remember=20the=20early=20XFS-NFS=20woes?
>These=20are=20all=20reasons=20to=20avoid=20a=20shiny=20new=20file=20syste=
m=20for=20serious
work.

I=20agree,=20but=20you're=20generalising,=20this=20is=20not=20xfs=20and=20=
reiser4=20is=20not=203.5
;)
If=20you=20don't=20try=20out=20the=20shiny=20new=20filesystem=20yourself,=20=
how=20can=20you
possibly=20dismiss=20it=20based=20on=20the=20past=20failures
of=20other=20filesystems?=20


>For=20practical=20recovery=20reasons=20(error=20on=20root=20FS=20after=20=
a=20crash),=20ext3fs
is=20easier=20to=20handle.=20You=20can=20fsck=20the=20(R/O)=20root=20parti=
tion=20just=20fine
(e2fsck=20then=20asks=20you=20to=20reboot=20right=20away);=20for=20reiserf=
s,=20you'll=20have
to=20boot=20into=20some=20emergency=20or=20rescue=20system...

No=20biggie=20for=20me,=20just=20have=20a=20removable=20media=20of=20some=20=
sort=20with=20your
running=20kernel=20and=20some=20basic=20tools.


Y.

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
