From: Ryan Nordman <spacerobots@gmail.com>
Subject: Re: Reiser4 Install Guide for Ubuntu 5.10
Date: Mon, 21 Nov 2005 21:13:02 -0800
Message-ID: <27c2ef000511212113x2ada6042n46366063bebd2300@mail.gmail.com>
References: <27c2ef000511211652o3421b4fct762dd9b12fabafd3@mail.gmail.com>
	 <4382742D.2090509@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_2121_32308587.1132636382787"
Return-path: <reiserfs-list-return-27064-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4382742D.2090509@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: Alexander Lyamin aka FLX <flx@namesys.com>, reiserfs-list@namesys.com, Peter van Hardenberg <pvh@pvh.ca>, Nathan Iverson <niverson@uvic.ca>, huaning <huaning@uvic.ca>, ycoady <ycoady@cs.uvic.ca>

------=_Part_2121_32308587.1132636382787
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Great! I should note credit is due to Peter van Hardenburg as the author as
well.

On 11/21/05, Hans Reiser <reiser@namesys.com> wrote:
>
> Flx, please add this to our website under an appropriate location
> (install I imagine). Ryan, if it is not added in 3 days, please complain.
>
> flx, please list Ryan at the top as the author.
>
> Oh, and thanks much Ryan!
>
> Hans
>
> Ryan Nordman wrote:
>
> > Hi Hans,
> >
> > Allow me to introduce myself, I'm one of Peter (aka pvh)'s colleagues
> > here at the University of Victoria. A while back we mentioned we'd
> > write a practical install guide for Reiser4 with Ubuntu 5.10. Well,
> > here it is. Let us know if you want us to make any changes to the
> > format or add/remove any steps.
> >
> > All version references in this document are up to date for Ubuntu 5.10
> > (Breezy Badger).
> >
> > Prerequisites: Add the universe repository to your sources
> >
> > 1. Install all the software needed to compile the kernel
> > # apt-get build-dep linux-source-2.6.12
> > # apt-get install linux-source-2.6.12 checkinstall libncurses-dev
> >
> > 2. Use the following commands to download the latest Reiser4 kernel
> > patch, the Reiser4 utility programs, and required libraries.
> > # wget
> >
> ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.12/reiser4-for-2.6.12-3.pat=
ch.gz
> > <
> ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.12/reiser4-for-2.6.12-3.pat=
ch.gz
> >
> > # wget ftp://ftp.namesys.com/pub/reiser4progs/reiser4progs-1.0.5.tar.gz
> > # wget ftp://ftp.namesys.com/pub/reiser4progs/libaal-1.0.5.tar.gz
> >
> > 3. Install libaal
> > # tar zxf libaal-1.0.5.tar.gz
> > # cd libaal-1.0.5
> > # ./configure; make
> > # checkinstall
> > At the prompt: "Should I create a default set of package docs? [y]:"
> > type "y" and press enter.
> > You will then be prompted to input a description of the package.
> > Enter something like "locally built libaal" then press enter three
> times.
> > # cd ..
> >
> > 4. Install reiser4progs
> > # tar zxf reiser4progs-1.0.5.tar.gz
> > # cd reiser4progs-1.0.5
> > # ./configure; make
> > # checkinstall
> > At the prompt: "Should I create a default set of package docs? [y]:"
> > type "y" and press enter.
> > At the prompt: "Do you want me to list them? [n]:" type "n" and press
> > enter.
> > At the prompt: "Should I exclude them from the package? (Saying yes is
> > a good idea) [y]:" type "y" and press enter.
> > You will then be prompted to input a description of the package. Type
> > something like "locally built libaal" then press enter three times.
> >
> > 5. Unzip and add the reiser4 code to the linux source
> > # cd /usr/src
> > # tar xvf linux-source-2.6.12.tar.bz2
> > # cd linux-source-2.6.12/
> > # gunzip -c ~/reiser4-for-2.6.12-3.patch.gz | patch -p1
> >
> > 6. Compile the kernel
> > # make menuconfig
> > Select "File systems --->" from the menu and press enter.
> > Select "Reiser4 (EXPERIMENTAL) (NEW)" and type "M".
> > Press the esc key twice.
> > Select "yes" at the prompt.
> > # make
> > ... much time passes ...
> >
> > 7. Build a Debian install package for the kernel
> > # make-kpkg --rootcmd fakeroot --append-to-version --initrd --
> >
> > 8. Reboot with the new kernel, create a Reiser partition and mount it
> > and you're good to go!
> >
>
>

------=_Part_2121_32308587.1132636382787
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Great!&nbsp; I should note credit is due to Peter van Hardenburg as the aut=
hor as well.<br><br><div><span class=3D"gmail_quote">On 11/21/05, <b class=
=3D"gmail_sendername">Hans Reiser</b> &lt;<a href=3D"mailto:reiser@namesys.=
com">reiser@namesys.com
</a>&gt; wrote:</span><blockquote class=3D"gmail_quote" style=3D"border-lef=
t: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1=
ex;">Flx, please add this to our website under an appropriate location<br>(=
install I imagine).&nbsp;&nbsp;Ryan, if it is not added in 3 days, please c=
omplain.
<br><br>flx, please list Ryan at the top as the author.<br><br>Oh, and than=
ks much Ryan!<br><br>Hans<br><br>Ryan Nordman wrote:<br><br>&gt; Hi Hans,<b=
r>&gt;<br>&gt; Allow me to introduce myself, I'm one of Peter (aka pvh)'s c=
olleagues
<br>&gt; here at the University of Victoria.&nbsp;&nbsp;A while back we men=
tioned we'd<br>&gt; write a practical install guide for Reiser4 with Ubuntu=
 5.10.&nbsp;&nbsp;Well,<br>&gt; here it is.&nbsp;&nbsp;Let us know if you w=
ant us to make any changes to the
<br>&gt; format or add/remove any steps.<br>&gt;<br>&gt; All version refere=
nces in this document are up to date for Ubuntu 5.10<br>&gt; (Breezy Badger=
).<br>&gt;<br>&gt; Prerequisites: Add the universe repository to your sourc=
es
<br>&gt;<br>&gt; 1. Install all the software needed to compile the kernel<b=
r>&gt; # apt-get build-dep linux-source-2.6.12<br>&gt; # apt-get install li=
nux-source-2.6.12 checkinstall libncurses-dev<br>&gt;<br>&gt; 2. Use the fo=
llowing commands to download the latest Reiser4 kernel
<br>&gt; patch, the Reiser4 utility programs, and required libraries.<br>&g=
t; # wget<br>&gt; <a href=3D"ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.=
12/reiser4-for-2.6.12-3.patch.gz">ftp://ftp.namesys.com/pub/reiser4-for-2.6=
/2.6.12/reiser4-for-2.6.12-3.patch.gz
</a><br>&gt; &lt;<a href=3D"ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.1=
2/reiser4-for-2.6.12-3.patch.gz">ftp://ftp.namesys.com/pub/reiser4-for-2.6/=
2.6.12/reiser4-for-2.6.12-3.patch.gz</a>&gt;<br>&gt; # wget <a href=3D"ftp:=
//ftp.namesys.com/pub/reiser4progs/reiser4progs-1.0.5.tar.gz">
ftp://ftp.namesys.com/pub/reiser4progs/reiser4progs-1.0.5.tar.gz</a><br>&gt=
; # wget <a href=3D"ftp://ftp.namesys.com/pub/reiser4progs/libaal-1.0.5.tar=
.gz">ftp://ftp.namesys.com/pub/reiser4progs/libaal-1.0.5.tar.gz</a><br>&gt;
<br>&gt; 3. Install libaal<br>&gt; # tar zxf libaal-1.0.5.tar.gz<br>&gt; # =
cd libaal-1.0.5<br>&gt; # ./configure; make<br>&gt; # checkinstall<br>&gt; =
At the prompt: &quot;Should I create a default set of package docs? [y]:&qu=
ot;
<br>&gt; type &quot;y&quot; and press enter.<br>&gt; You will then be promp=
ted to input a description of the package.<br>&gt; Enter something like &qu=
ot;locally built libaal&quot; then press enter three times.<br>&gt; # cd ..
<br>&gt;<br>&gt; 4. Install reiser4progs<br>&gt; # tar zxf reiser4progs-1.0=
.5.tar.gz<br>&gt; # cd reiser4progs-1.0.5<br>&gt; # ./configure; make<br>&g=
t; # checkinstall<br>&gt; At the prompt: &quot;Should I create a default se=
t of package docs? [y]:&quot;
<br>&gt; type &quot;y&quot; and press enter.<br>&gt; At the prompt: &quot;D=
o you want me to list them? [n]:&quot; type &quot;n&quot; and press<br>&gt;=
 enter.<br>&gt; At the prompt: &quot;Should I exclude them from the package=
? (Saying yes is
<br>&gt; a good idea) [y]:&quot; type &quot;y&quot; and press enter.<br>&gt=
; You will then be prompted to input a description of the package.&nbsp;&nb=
sp;Type<br>&gt; something like &quot;locally built libaal&quot; then press =
enter three times.
<br>&gt;<br>&gt; 5. Unzip and add the reiser4 code to the linux source<br>&=
gt; # cd /usr/src<br>&gt; # tar xvf linux-source-2.6.12.tar.bz2<br>&gt; # c=
d linux-source-2.6.12/<br>&gt; # gunzip -c ~/reiser4-for-2.6.12-3.patch.gz
 | patch -p1<br>&gt;<br>&gt; 6. Compile the kernel<br>&gt; # make menuconfi=
g<br>&gt; Select &quot;File systems ---&gt;&quot; from the menu and press e=
nter.<br>&gt; Select &quot;Reiser4 (EXPERIMENTAL) (NEW)&quot; and type &quo=
t;M&quot;.
<br>&gt; Press the esc key twice.<br>&gt; Select &quot;yes&quot; at the pro=
mpt.<br>&gt; # make<br>&gt; ... much time passes ...<br>&gt;<br>&gt; 7. Bui=
ld a Debian install package for the kernel<br>&gt; # make-kpkg --rootcmd fa=
keroot --append-to-version --initrd --
<br>&gt;<br>&gt; 8. Reboot with the new kernel, create a Reiser partition a=
nd mount it<br>&gt; and you're good to go!<br>&gt;<br><br></blockquote></di=
v><br>

------=_Part_2121_32308587.1132636382787--
