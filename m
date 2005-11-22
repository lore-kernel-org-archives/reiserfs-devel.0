From: Ryan Nordman <spacerobots@gmail.com>
Subject: Reiser4 Install Guide for Ubuntu 5.10
Date: Mon, 21 Nov 2005 16:52:35 -0800
Message-ID: <27c2ef000511211652o3421b4fct762dd9b12fabafd3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_14964_28926233.1132620755877"
Return-path: <reiserfs-list-return-27062-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com
Cc: Peter van Hardenberg <pvh@pvh.ca>, Nathan Iverson <niverson@uvic.ca>, huaning <huaning@uvic.ca>, ycoady <ycoady@cs.uvic.ca>

------=_Part_14964_28926233.1132620755877
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi Hans,

Allow me to introduce myself, I'm one of Peter (aka pvh)'s colleagues here
at the University of Victoria. A while back we mentioned we'd write a
practical install guide for Reiser4 with Ubuntu 5.10. Well, here it is. Let
us know if you want us to make any changes to the format or add/remove any
steps.

All version references in this document are up to date for Ubuntu
5.10(Breezy Badger).

Prerequisites: Add the universe repository to your sources

1. Install all the software needed to compile the kernel
# apt-get build-dep linux-source-2.6.12
# apt-get install linux-source-2.6.12 checkinstall libncurses-dev

2. Use the following commands to download the latest Reiser4 kernel patch,
the Reiser4 utility programs, and required libraries.
# wget
ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.12/reiser4-for-2.6.12-3.patch=
.gz
# wget ftp://ftp.namesys.com/pub/reiser4progs/reiser4progs-1.0.5.tar.gz
# wget ftp://ftp.namesys.com/pub/reiser4progs/libaal-1.0.5.tar.gz

3. Install libaal
# tar zxf libaal-1.0.5.tar.gz
# cd libaal-1.0.5
# ./configure; make
# checkinstall
At the prompt: "Should I create a default set of package docs? [y]:" type
"y" and press enter.
You will then be prompted to input a description of the package. Enter
something like "locally built libaal" then press enter three times.
# cd ..

4. Install reiser4progs
# tar zxf reiser4progs-1.0.5.tar.gz
# cd reiser4progs-1.0.5
# ./configure; make
# checkinstall
At the prompt: "Should I create a default set of package docs? [y]:" type
"y" and press enter.
At the prompt: "Do you want me to list them? [n]:" type "n" and press enter=
.
At the prompt: "Should I exclude them from the package? (Saying yes is a
good idea) [y]:" type "y" and press enter.
You will then be prompted to input a description of the package. Type
something like "locally built libaal" then press enter three times.

5. Unzip and add the reiser4 code to the linux source
# cd /usr/src
# tar xvf linux-source-2.6.12.tar.bz2
# cd linux-source-2.6.12/
# gunzip -c ~/reiser4-for-2.6.12-3.patch.gz | patch -p1

6. Compile the kernel
# make menuconfig
Select "File systems --->" from the menu and press enter.
Select "Reiser4 (EXPERIMENTAL) (NEW)" and type "M".
Press the esc key twice.
Select "yes" at the prompt.
# make
... much time passes ...

7. Build a Debian install package for the kernel
# make-kpkg --rootcmd fakeroot --append-to-version --initrd --

8. Reboot with the new kernel, create a Reiser partition and mount it and
you're good to go!

------=_Part_14964_28926233.1132620755877
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi Hans,<br>
<br>
Allow me to introduce myself, I'm one of Peter (aka pvh)'s colleagues here =
at the
University of Victoria.&nbsp; A while back we mentioned we'd write a
practical install guide for Reiser4 with Ubuntu 5.10.&nbsp; Well, here
it is.&nbsp; Let us know if you want us to make any changes to
the format or add/remove any steps.<br>
<br>
All version references in this document are up to date for Ubuntu 5.10 (Bre=
ezy Badger).<br>
<br>
Prerequisites: Add the universe repository to your sources<br>
<br>
1. Install all the software needed to compile the kernel<br>
# apt-get build-dep linux-source-2.6.12<br>
# apt-get install linux-source-2.6.12 checkinstall libncurses-dev<br>
<br>
2. Use the following commands to download the latest Reiser4 kernel patch, =
the Reiser4 utility programs, and required libraries.<br>
# wget <a href=3D"ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.12/reiser4-=
for-2.6.12-3.patch.gz" target=3D"_blank" onclick=3D"return top.js.OpenExtLi=
nk(window,event,this)">ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.12/rei=
ser4-for-2.6.12-3.patch.gz
</a><br>
# wget <a href=3D"ftp://ftp.namesys.com/pub/reiser4progs/reiser4progs-1.0.5=
.tar.gz" target=3D"_blank" onclick=3D"return top.js.OpenExtLink(window,even=
t,this)">ftp://ftp.namesys.com/pub/reiser4progs/reiser4progs-1.0.5.tar.gz</=
a>
<br>
# wget <a href=3D"ftp://ftp.namesys.com/pub/reiser4progs/libaal-1.0.5.tar.g=
z" target=3D"_blank" onclick=3D"return top.js.OpenExtLink(window,event,this=
)">ftp://ftp.namesys.com/pub/reiser4progs/libaal-1.0.5.tar.gz</a><br>
<br>
3. Install libaal<br>
# tar zxf libaal-1.0.5.tar.gz<br>
# cd libaal-1.0.5<br>
# ./configure; make<br>
# checkinstall<br>
At the prompt: &quot;Should I create a default set of package docs? [y]:&qu=
ot; type &quot;y&quot; and press enter.<br>
You will then be prompted to input a description of the package.&nbsp;
Enter something like &quot;locally built libaal&quot; then press enter thre=
e
times.<br>
# cd ..<br>
<br>
4. Install reiser4progs<br>
# tar zxf reiser4progs-1.0.5.tar.gz<br>
# cd reiser4progs-1.0.5<br>
# ./configure; make<br>
# checkinstall<br>
At the prompt: &quot;Should I create a default set of package docs? [y]:&qu=
ot; type &quot;y&quot; and press enter.<br>
At the prompt: &quot;Do you want me to list them? [n]:&quot; type &quot;n&q=
uot; and press enter.<br>
At the prompt: &quot;Should I exclude them from the package? (Saying yes is=
 a good idea) [y]:&quot; type &quot;y&quot; and press enter.<br>
You will then be prompted to input a description of the package.&nbsp;
Type something like &quot;locally built libaal&quot; then press enter three=
 times.<br>
<br>
5. Unzip and add the reiser4 code to the linux source<br>
# cd /usr/src<br>
# tar xvf linux-source-2.6.12.tar.bz2<br>
# cd linux-source-2.6.12/<br>
# gunzip -c ~/reiser4-for-2.6.12-3.patch.gz | patch -p1 <br>
<br>
6. Compile the kernel<br>
# make menuconfig<br>
Select &quot;File systems ---&gt;&quot; from the menu and press enter.<br>
Select &quot;Reiser4 (EXPERIMENTAL) (NEW)&quot; and type &quot;M&quot;.<br>
Press the esc key twice.<br>
Select &quot;yes&quot; at the prompt.<br>
# make<br>
... much time passes ...<br>
<br>
7. Build a Debian install package for the kernel<br>
# make-kpkg --rootcmd fakeroot --append-to-version --initrd --<br>
<br>
8. Reboot with the new kernel, create a Reiser partition and mount it and y=
ou're good to go!<br>
<br>


------=_Part_14964_28926233.1132620755877--
