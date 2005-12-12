From: Bedros Hanounik <2bedros@gmail.com>
Subject: Re: Reiserfsck can't fix FS
Date: Mon, 12 Dec 2005 10:22:39 -0800
Message-ID: <f18a8d980512121022j614f431dv62adbbc3caf5a6eb@mail.gmail.com>
References: <1129303303.3370.4.camel@desktop>
	 <200510142008.42253.vitaly@namesys.com>
	 <1129484435.16949.1.camel@desktop>
	 <b14e81f00510171234l4addda48kf73e962b384be6e6@mail.gmail.com>
	 <53246.213.249.155.242.1129721262.squirrel@213.249.155.242>
	 <b14e81f00510201255x3ee436afveb8222f43f69f8a@mail.gmail.com>
	 <10442.195.137.105.19.1134285670.squirrel@195.137.105.19>
Mime-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_26262_26140916.1134411759101"
Return-path: <reiserfs-list-return-27273-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <10442.195.137.105.19.1134285670.squirrel@195.137.105.19>
List-Id: <reiserfs-devel.vger.kernel.org>
To: lordvan@lordvan.com
Cc: michael chang <thenewme91@gmail.com>, reiserfs-list@namesys.com

------=_Part_26262_26140916.1134411759101
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

I had the exact same problem on a 300GB hard drive over USB with ReiserFS

by running resiserfsck, the tools suggested running it again with
--rebuild-tree option and it was a mistake.

reiserfsck --rebuild-tree screwed things  up big time; but I had a backup
copy of my stuff, so I reformatted the HD.

I would probably never use the option --rebuild-tree, only --fix-fixable.

I'm not sure if the partition actually was corrupted. I was able to access
it, but on start when mounting the partition it gave me error messages;
something like "file system not clean"

On 12/10/05, Thomas Raschbacher <lordvan@lordvan.com> wrote:
>
> Hi,
>
> Finally got my new HDD (300 GB UDMA133 :D no usb anymore ..)
> i backed up my data and ran reiserfsck on one of the other partitions
> which were supposedly damaged.
> it didn't work out (stopped at same point always)
>
> then i made a backup copy of my backup copy and ran reiserfsck on that an=
d
> it worked just fine.
>
> -> it seems that my filesystems never had errors in the first place but
> running reiserfsck on my USB hdd caused the problems in the first place.
> fortunately i could recover all my digital camera photos (which i will
> definitely back up on DVD from now on!
> some mp3's lost the filenames but who really cares about that anyway.
>
> i suggest adding to the reiserfsck docs that running it on usb-hdds might
> cause problems due to usb hdd driver bugs or whatever .. or at least a
> note that if it fails on usb-hdd copy it to a non usb hdd and try again.
>
> Regards,
>   Thomas R
> P.S.: I never enforced bandwidth allocation. but i still dont' know what
> the problem is with this stupid USB2 storage stuffs .. it worked fine wit=
h
> some old kernel (either early 2.6 or still 2.4 ..) any ideas what can
> cause this kind of problems with usb hdds? or should i post to some kerne=
l
> mailing list/newsgroup?
>
>
> --
> -----BEGIN GEEK CODE BLOCK-----
> GCS/CC/E/M/MU/S d- s: a--- C++++(++) UL++++ P+ L++++ E W+++ N+++ o-- K w-=
-
> O
> M-- V- PS+ PE-- Y++ PGP+++ t+++ 5+ X- R tv b++++ DI- D+ G++ e-->+++++ h--
> !r
> z-
> ------END GEEK CODE BLOCK------
>
> On Thu, October 20, 2005 19:55, michael chang said:
> > On 10/19/05, Thomas Raschbacher <lordvan@lordvan.com> wrote:
> >> Actually I did send it SIGUSR1 signals to get the progress so it reall=
y
> >> seems to work fine.
> >> I intend to get another HDD (internal) and see if i can copy the FS an=
d
> >> then fix it there.
> >> how would I best copy the filesystem? DD ?
> >> (The PRoblems I had before with this disc are USB-storage related wher=
e
> >> the disc does stop working if one reads/writes too much data at once o=
n
> >> USB2)
> >
> > The USB2 data loss thing sounds like a bandwidth-allocation problem;
> > since it's not always advisible to enforce it by default (well, I
> > don't know about that, but I don't enforce it in any of my hand-built
> > kernels).  What you are doing next sounds reasonable, please inform us
> > how well it goes.
> >
> > --
> > ~Mike
> >  - Just my two cents
> >  - No man is an island, and no man is unable.
> >
>
>
>

------=_Part_26262_26140916.1134411759101
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

I had the exact same problem on a 300GB hard drive over USB with ReiserFS<b=
r><br>by running resiserfsck, the tools suggested running it again with --r=
ebuild-tree option and it was a mistake. <br><br>reiserfsck --rebuild-tree =
screwed things&nbsp; up big time; but I had a backup copy of my stuff, so I=
 reformatted the HD.
<br><br>I would probably never use the option --rebuild-tree, only --fix-fi=
xable. <br><br>I'm
not sure if the partition actually was corrupted. I was able to access
it, but on start when mounting the partition it gave me error messages;
something like &quot;file system not clean&quot;
<br><br><div><span class=3D"gmail_quote">On 12/10/05, <b class=3D"gmail_sen=
dername">Thomas Raschbacher</b> &lt;<a href=3D"mailto:lordvan@lordvan.com">=
lordvan@lordvan.com</a>&gt; wrote:</span><blockquote class=3D"gmail_quote" =
style=3D"border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8=
ex; padding-left: 1ex;">
Hi,<br><br>Finally got my new HDD (300 GB UDMA133 :D no usb anymore ..)<br>=
i backed up my data and ran reiserfsck on one of the other partitions<br>wh=
ich were supposedly damaged.<br>it didn't work out (stopped at same point a=
lways)
<br><br>then i made a backup copy of my backup copy and ran reiserfsck on t=
hat and<br>it worked just fine.<br><br>-&gt; it seems that my filesystems n=
ever had errors in the first place but<br>running reiserfsck on my USB hdd =
caused the problems in the first place.
<br>fortunately i could recover all my digital camera photos (which i will<=
br>definitely back up on DVD from now on!<br>some mp3's lost the filenames =
but who really cares about that anyway.<br><br>i suggest adding to the reis=
erfsck docs that running it on usb-hdds might
<br>cause problems due to usb hdd driver bugs or whatever .. or at least a<=
br>note that if it fails on usb-hdd copy it to a non usb hdd and try again.=
<br><br>Regards,<br>&nbsp;&nbsp;Thomas R<br>P.S.: I never enforced bandwidt=
h allocation. but i still dont' know what
<br>the problem is with this stupid USB2 storage stuffs .. it worked fine w=
ith<br>some old kernel (either early 2.6 or still 2.4 ..) any ideas what ca=
n<br>cause this kind of problems with usb hdds? or should i post to some ke=
rnel
<br>mailing list/newsgroup?<br><br><br>--<br>-----BEGIN GEEK CODE BLOCK----=
-<br>GCS/CC/E/M/MU/S d- s: a--- C++++(++) UL++++ P+ L++++ E W+++ N+++ o-- K=
 w-- O<br>M-- V- PS+ PE-- Y++ PGP+++ t+++ 5+ X- R tv b++++ DI- D+ G++ e--&g=
t;+++++ h-- !r
<br>z-<br>------END GEEK CODE BLOCK------<br><br>On Thu, October 20, 2005 1=
9:55, michael chang said:<br>&gt; On 10/19/05, Thomas Raschbacher &lt;<a hr=
ef=3D"mailto:lordvan@lordvan.com">lordvan@lordvan.com</a>&gt; wrote:<br>&gt=
;&gt; Actually I did send it SIGUSR1 signals to get the progress so it real=
ly
<br>&gt;&gt; seems to work fine.<br>&gt;&gt; I intend to get another HDD (i=
nternal) and see if i can copy the FS and<br>&gt;&gt; then fix it there.<br=
>&gt;&gt; how would I best copy the filesystem? DD ?<br>&gt;&gt; (The PRobl=
ems I had before with this disc are USB-storage related where
<br>&gt;&gt; the disc does stop working if one reads/writes too much data a=
t once on<br>&gt;&gt; USB2)<br>&gt;<br>&gt; The USB2 data loss thing sounds=
 like a bandwidth-allocation problem;<br>&gt; since it's not always advisib=
le to enforce it by default (well, I
<br>&gt; don't know about that, but I don't enforce it in any of my hand-bu=
ilt<br>&gt; kernels).&nbsp;&nbsp;What you are doing next sounds reasonable,=
 please inform us<br>&gt; how well it goes.<br>&gt;<br>&gt; --<br>&gt; ~Mik=
e<br>&gt;&nbsp;&nbsp;- Just my two cents
<br>&gt;&nbsp;&nbsp;- No man is an island, and no man is unable.<br>&gt;<br=
><br><br></blockquote></div><br>

------=_Part_26262_26140916.1134411759101--
