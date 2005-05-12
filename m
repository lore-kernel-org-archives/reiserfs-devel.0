From: Bedros Hanounik <2bedros@gmail.com>
Subject: Re: ReiserFS IFSD for Windows
Date: Thu, 12 May 2005 10:15:26 -0700
Message-ID: <f18a8d9805051210152902b3a@mail.gmail.com>
References: <42838B75.1000605@cs.cmu.edu>
Reply-To: Bedros Hanounik <2bedros@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_524_27568198.1115918126375"
Return-path: <reiserfs-list-return-24049-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42838B75.1000605@cs.cmu.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Mark Piper <mwp@cs.cmu.edu>
Cc: reiserfs-list@namesys.com

------=_Part_524_27568198.1115918126375
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

I'll be interested in testing your code. I have an old 20GB HD which I can=
=20
play with.=20

Currently, I have a USB drive formatted in NTFS, because, I want it to be=
=20
accessible by friend's XP machine in case of emergencies. and I would=20
convert it to ReiserFS once your code is stable enough.

having a read only mode is fine with me; write mode would be a nice option,=
=20
but it's not important in my case.

My impression is Hans doesn't like the Idea, but a stripped down version of=
=20
ReiserFS driver for windows could be a good thing, and encourages more=20
people to use ReiserFS.


-Bedros


On 5/12/05, Mark Piper <mwp@cs.cmu.edu> wrote:
>=20
> This summer, I will be starting a 3.5-month project to create an
> Installable File System Driver (IFSD) to read ReiserFS under Microsoft
> Windows, similar to ext2fsd. (The project is a practicum to complete
> my degree in software engineering from Carnegie Mellon.)
>=20
> I have three questions:
>=20
> * Is anyone out there interested in using the tool as it is developed?
>=20
> * Is anyone out there interested in mentoring the development of the
> tool? (This basically consists of answering specific technical
> questions when they arise.)
>=20
> * Other than compliance to the GPL, are there any other liscensing
> factors I should be aware of?
>=20
> For anyone interested, my initial plan is to port the read-only ReiserFS
> 3 code from the GRUB bootloader, and turn it into an IFSD using the same
> techniques as in ext2fsd -- although I'd love to hear other ideas, and
> opinions of whether the project might be feasible with ReiserFS 4.
>=20
> Thanks,
> Mark Piper
>=20
>

------=_Part_524_27568198.1115918126375
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

I'll be interested in testing your code. I have an old 20GB HD which I can =
play with. <br>
<br>
Currently, I have a USB drive formatted in NTFS, because, I want it to
be accessible by friend's XP machine in case of emergencies. and I
would convert it to ReiserFS once your code is stable enough.<br>
<br>
having a read only mode is fine with me; write mode would be a nice option,=
 but it's not important in my case.<br>
<br>
My impression is Hans doesn't like the Idea, but a stripped down
version of ReiserFS driver for windows could be a good thing, and
encourages more people to use ReiserFS.<br>
<br>
<br>
-Bedros<br>
<br><br><div><span class=3D"gmail_quote">On 5/12/05, <b class=3D"gmail_send=
ername">Mark Piper</b> &lt;<a href=3D"mailto:mwp@cs.cmu.edu">mwp@cs.cmu.edu=
</a>&gt; wrote:</span><blockquote class=3D"gmail_quote" style=3D"border-lef=
t: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1=
ex;">
This summer, I will be starting a 3.5-month project to create an<br>Install=
able File System Driver (IFSD) to read ReiserFS under Microsoft<br>Windows,=
 similar to ext2fsd.&nbsp;&nbsp; (The project is a practicum to complete<br=
>my degree in software engineering from&nbsp;&nbsp;Carnegie Mellon.)
<br><br>I have three questions:<br><br>* Is anyone out there interested in =
using the tool as it is developed?<br><br>* Is anyone out there interested =
in mentoring the development of the<br>tool?&nbsp;&nbsp;(This basically con=
sists of answering specific technical
<br>questions when they arise.)<br><br>* Other than compliance to the GPL, =
are there any other liscensing<br>factors I should be aware of?<br><br>For =
anyone interested, my initial plan is to port the read-only ReiserFS<br>
3 code from the GRUB bootloader, and turn it into an IFSD using the same<br=
>techniques as in ext2fsd -- although I'd love to hear other ideas, and<br>=
opinions of whether the project might be feasible with ReiserFS 4.<br><br>
&nbsp;&nbsp;Thanks,<br>&nbsp;&nbsp;&nbsp;&nbsp; Mark Piper<br><br></blockqu=
ote></div><br>
------=_Part_524_27568198.1115918126375--
