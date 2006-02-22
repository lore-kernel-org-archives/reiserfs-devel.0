From: "John Cohorn" <elotemuygrande@gmail.com>
Subject: Re: reiser4 bug in 2.6.16-rc2-mm1
Date: Tue, 21 Feb 2006 19:58:48 -0600
Message-ID: <fdc23ba20602211758n6e853298i7b406a3e3a6d55d8@mail.gmail.com>
References: <20060210142215.GA1714@deprez-aerts.dyndns.org>
	 <200602162317.32054.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com>
	 <fdc23ba20602170843u333d1328kbd658812692a3ea3@mail.gmail.com>
	 <1140533847.12162.28.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_203_28272137.1140573528008"
Return-path: <reiserfs-list-return-28111-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1140533847.12162.28.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: "Vladimir V. Saveliev" <vs@namesys.com>, reiserfs-list@namesys.com

------=_Part_203_28272137.1140573528008
Content-Type: multipart/alternative; 
	boundary="----=_Part_204_5509671.1140573528008"

------=_Part_204_5509671.1140573528008
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

First off, thank you for taking the time to respond.

Basically any heavy activity on the partition seems to trigger it. Here's a
short transcript:

dually ~ # cat /proc/version
Linux version 2.6.16-rc2-mm1 (root@localhost) (gcc version 3.3.6 (Gentoo
3.3.6, ssp-3.3.6-1.0, pie-8.7.8)) #7 SMP PREEMPT Thu Feb 16 21:19:53 Local
time zone must be set--
dually ~ # mkfs.reiser4 --version
mkfs.reiser4 1.0.5
Copyright (C) 2001, 2002, 2003, 2004 by Hans Reiser, licensing governed by
reiser4progs/COPYING.
dually ~ # mkfs.reiser4 /dev/sdb1 --yes
dually ~ # mount /dev/sdb1 /data1
dually ~ # klogd -d -f ~/kernel.log
dually ~ # cd /data1
dually data1 # cp -ra /usr/src/linux-2.6.16-rc2-mm1/ .
dually data1 # tar cf linux.bz2 linux-2.6.16-rc2-mm1/

...after about half a minute of activity I receive the message which I've
attached as a small JPEG
"reiser4 panicked cowardly: reiser4[tar(4078)] commit_current_atom
(fs/reiser4/txnmgr.c:1130) [zam-597]:". I can't see whether it was line 113=
0
or  1138.  I'll take a quick look myself, but I'm completely unfamiliar wit=
h
reiser4 sources and the kernel sources in general.

After this my system is completely locked up. When I mount the partition
after restarting it no longer contains any files. I have few or no problems
when creating, mounting, and working on reiser4 partitions when booted from
the System recovery liveCD so it must be something in the latest sources or
in my kernel configuration(which is 100% stable for everything else under
reiser3, but I haven't bothered to perfect yet).

Apologies about the JPEG, I could not figure out how to get the kernel
output logged into a file(maybe it freezes before the file can flush to
disk, i dunno). If you know of a way, I welcome instruction.

On 2/21/06, Vladimir V. Saveliev <vs@namesys.com> wrote:
>
> Hello
>
> On Fri, 2006-02-17 at 10:43 -0600, John Cohorn wrote:
> > Is there a known issue with 2.6.16-xxx-mm1? I too am having severe and
> > very random, but reproducible problems which will completely lock up
> > my machine minutes after mounting an R4 partition if not seconds. I
> > did try disabling 4K stacks in my .config. Also, this is an Athlon 64
> > X2 I'm running with so maybe there are SMP issues?
>
> no, it does not look so.
>
> > One of my friends said that Reiser4 became unstable for him also when
> > he upgraded to a dual core Athlon64...but until I test for myself
> > that's just a wild theory that it's an SMP bug. This machine is
> > otherwise stable in Memtest, in Windows playing the latest games, and
> > on Linux compiling huge amounts of software.
> >
> > If there are not known issues with the latest kernels then I will
> > happily try to send detailed configurations and logs of what's
> > happening this evening. I have two shiny new 250GB SATA drives on my
> > machine and I can test freely with one of them until I need the space.
> > I'd love to help squash any bugs that I can :)
> >
>
> If you described the exact sequence of commands which makes reiser4 to
> crash - that would help a lot.
>
>
>

------=_Part_204_5509671.1140573528008
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

First off, thank you for taking the time to respond. <br><br>Basically any =
heavy activity on the partition seems to trigger it. Here's a short transcr=
ipt:<br><br>dually ~ # cat /proc/version<br>Linux version 2.6.16-rc2-mm1
 (root@localhost) (gcc version 3.3.6 (Gentoo 3.3.6, ssp-3.3.6-1.0, pie-8.7.=
8)) #7 SMP PREEMPT Thu Feb 16 21:19:53 Local time zone must be set--<br>dua=
lly ~ #=20
mkfs.reiser4 --version<br>mkfs.reiser4 1.0.5<br>Copyright (C) 2001, 2002, 2=
003, 2004 by Hans Reiser, licensing governed by <br>reiser4progs/COPYING. <=
br>dually ~ # mkfs.reiser4 /dev/sdb1 --yes<br>dually ~ # mount /dev/sdb1 /d=
ata1
<br>dually ~ # klogd -d -f ~/kernel.log<br>dually ~ # cd /data1<br>dually d=
ata1 # cp -ra /usr/src/linux-2.6.16-rc2-mm1/ .<br>dually data1 # tar cf lin=
ux.bz2 linux-2.6.16-rc2-mm1/<br><br>...after about half a minute of activit=
y I receive the message which I've attached as a small JPEG=20
<br>&quot;reiser4 panicked cowardly: reiser4[tar(4078)] commit_current_atom=
 (fs/reiser4/txnmgr.c:1130) [zam-597]:&quot;. I can't see whether it was li=
ne 1130 or&nbsp; 1138.&nbsp; I'll take a quick look myself, but I'm complet=
ely unfamiliar with reiser4 sources and the kernel sources in general.
<br><br>After this my system is completely locked up. When I mount the part=
ition after restarting it no longer contains any files. I have few or no pr=
oblems when creating, mounting, and working on reiser4 partitions when boot=
ed from the System recovery liveCD so it must be something in the latest so=
urces or in my kernel configuration(which is 100% stable for everything els=
e under reiser3, but I haven't bothered to perfect yet).
<br><br>Apologies about the JPEG, I could not figure out how to get the ker=
nel output logged into a file(maybe it freezes before the file can flush to=
 disk, i dunno). If you know of a way, I welcome instruction.<br><br><div>
<span class=3D"gmail_quote">
On 2/21/06, <b class=3D"gmail_sendername">Vladimir V. Saveliev</b> &lt;<a h=
ref=3D"mailto:vs@namesys.com" target=3D"_blank" onclick=3D"return top.js.Op=
enExtLink(window,event,this)">vs@namesys.com</a>&gt; wrote:</span><blockquo=
te class=3D"gmail_quote" style=3D"border-left: 1px solid rgb(204, 204, 204)=
; margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">


Hello<br><br>On Fri, 2006-02-17 at 10:43 -0600, John Cohorn wrote:<br>&gt; =
Is there a known issue with 2.6.16-xxx-mm1? I too am having severe and<br>&=
gt; very random, but reproducible problems which will completely lock up
<br>&gt; my machine minutes after mounting an R4 partition if not seconds. =
I<br>&gt; did try disabling 4K stacks in my .config. Also, this is an Athlo=
n 64<br>&gt; X2 I'm running with so maybe there are SMP issues?<br><br>


no, it does not look so.<br><br>&gt; One of my friends said that Reiser4 be=
came unstable for him also when<br>&gt; he upgraded to a dual core Athlon64=
...but until I test for myself<br>&gt; that's just a wild theory that it's =
an SMP bug. This machine is
<br>&gt; otherwise stable in Memtest, in Windows playing the latest games, =
and<br>&gt; on Linux compiling huge amounts of software.<br>&gt;<br>&gt; If=
 there are not known issues with the latest kernels then I will<br>&gt; hap=
pily try to send detailed configurations and logs of what's
<br>&gt; happening this evening. I have two shiny new 250GB SATA drives on =
my<br>&gt; machine and I can test freely with one of them until I need the =
space.<br>&gt; I'd love to help squash any bugs that I can :)<br>&gt;<br>


<br>If you described the exact sequence of commands which makes reiser4 to<=
br>crash - that would help a lot.<br><br><br></blockquote></div><br>



------=_Part_204_5509671.1140573528008--

------=_Part_203_28272137.1140573528008--
