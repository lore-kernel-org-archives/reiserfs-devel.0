From: "John Cohorn" <elotemuygrande@gmail.com>
Subject: Re: reiser4 bug in 2.6.16-rc2-mm1
Date: Sat, 25 Feb 2006 18:58:25 +0000
Message-ID: <fdc23ba20602251058s6553eb8au93640a07c55d7426@mail.gmail.com>
References: <20060210142215.GA1714@deprez-aerts.dyndns.org>
	 <200602162317.32054.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com>
	 <fdc23ba20602170843u333d1328kbd658812692a3ea3@mail.gmail.com>
	 <1140533847.12162.28.camel@tribesman.namesys.com>
	 <fdc23ba20602211758n6e853298i7b406a3e3a6d55d8@mail.gmail.com>
	 <1140606133.12162.65.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_10443_27894238.1140893905814"
Return-path: <reiserfs-list-return-28129-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1140606133.12162.65.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: "Vladimir V. Saveliev" <vs@namesys.com>, reiserfs-list@namesys.com

------=_Part_10443_27894238.1140893905814
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Sorry for the delay.

On 2/22/06, Vladimir V. Saveliev <vs@namesys.com> wrote:
>
> Hello
>
> On Tue, 2006-02-21 at 19:58 -0600, John Cohorn wrote:
> > First off, thank you for taking the time to respond.
> >
> > Basically any heavy activity on the partition seems to trigger it.
> > Here's a short transcript:
> >
> > dually ~ # cat /proc/version
> > Linux version 2.6.16-rc2-mm1 (root@localhost) (gcc version 3.3.6
> > (Gentoo 3.3.6, ssp-3.3.6-1.0, pie-8.7.8)) #7 SMP PREEMPT Thu Feb 16
> > 21:19:53 Local time zone must be set--
> > dually ~ # mkfs.reiser4 --version
> > mkfs.reiser4 1.0.5
> > Copyright (C) 2001, 2002, 2003, 2004 by Hans Reiser, licensing
> > governed by
> > reiser4progs/COPYING.
> > dually ~ # mkfs.reiser4 /dev/sdb1 --yes
> > dually ~ # mount /dev/sdb1 /data1
> > dually ~ # klogd -d -f ~/kernel.log
> > dually ~ # cd /data1
> > dually data1 # cp -ra /usr/src/linux-2.6.16-rc2-mm1/ .
> > dually data1 # tar cf linux.bz2 linux-2.6.16-rc2-mm1/
> >
> > ...after about half a minute of activity I receive the message which
> > I've attached as a small JPEG
> > "reiser4 panicked cowardly: reiser4[tar(4078)] commit_current_atom
> > (fs/reiser4/txnmgr.c:1130) [zam-597]:".
>
> Would you please try your test on ide disk?



At your suggestion I plugged in a spare PATA IDE disk, formatted it with R4=
,
and was about to copy several copies of the Linux kernel sources to the
partition, tar them up, and move them around with no lockups or apparent
corruption.

> I can't see whether it was line 1130 or  1138.  I'll take a quick look
> > myself, but I'm completely unfamiliar with reiser4 sources and the
> > kernel sources in general.
> >
> > After this my system is completely locked up. When I mount the
> > partition after restarting it no longer contains any files. I have few
> > or no problems when creating, mounting, and working on reiser4
> > partitions when booted from the System recovery liveCD so it must be
> > something in the latest sources or in my kernel configuration
>
> IIRC, there were changes (not in reiser4) which caused kernel to notice
> i/o errors on SCSI devices where older kernels did not see any problems.


Reiser3 is completely stable on my SATA drives...is R4 simply doing more
error checking? Why should even a severe I/O error completely freeze my
machine?

So it seems as though the problem is in the interaction between R4 and the
SCSI code...are any workarounds to this apparent?


> (which is 100% stable for everything else under reiser3, but I haven't
> > bothered to perfect yet).
> >
> > Apologies about the JPEG, I could not figure out how to get the kernel
> > output logged into a file(maybe it freezes before the file can flush
> > to disk, i dunno). If you know of a way, I welcome instruction.
> >
>
> reiserfs-list@namesys.com does not accept binary attachments. Please
> send the image to zam@namesys.com and vs@namesys.com



done.


You should setup either serial or netconsole to catch kernel output.
> Please look at instructions:
> linux/Documentation/serial-console.txt
> linux/Documentation/networking/netconsole.txt
>
>
>
Thanks for the suggestions. I'll see if I can set up logging kernel message=
s
to my laptop.

------=_Part_10443_27894238.1140893905814
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Sorry for the delay.<br><br>On 2/22/06, <b class=3D"gmail_sendername">Vladi=
mir V. Saveliev</b> &lt;<a href=3D"mailto:vs@namesys.com">vs@namesys.com</a=
>&gt; wrote:<div><span class=3D"gmail_quote"></span><blockquote class=3D"gm=
ail_quote" style=3D"border-left: 1px solid rgb(204, 204, 204); margin: 0pt =
0pt 0pt 0.8ex; padding-left: 1ex;">
Hello<br><br>On Tue, 2006-02-21 at 19:58 -0600, John Cohorn wrote:<br>&gt; =
First off, thank you for taking the time to respond.<br>&gt;<br>&gt; Basica=
lly any heavy activity on the partition seems to trigger it.<br>&gt; Here's=
 a short transcript:
<br>&gt;<br>&gt; dually ~ # cat /proc/version<br>&gt; Linux version 2.6.16-=
rc2-mm1 (root@localhost) (gcc version 3.3.6<br>&gt; (Gentoo 3.3.6, ssp-3.3.=
6-1.0, pie-8.7.8)) #7 SMP PREEMPT Thu Feb 16<br>&gt; 21:19:53 Local time zo=
ne must be set--
<br>&gt; dually ~ # mkfs.reiser4 --version<br>&gt; mkfs.reiser4 1.0.5<br>&g=
t; Copyright (C) 2001, 2002, 2003, 2004 by Hans Reiser, licensing<br>&gt; g=
overned by<br>&gt; reiser4progs/COPYING.<br>&gt; dually ~ # mkfs.reiser4
 /dev/sdb1 --yes<br>&gt; dually ~ # mount /dev/sdb1 /data1<br>&gt; dually ~=
 # klogd -d -f ~/kernel.log<br>&gt; dually ~ # cd /data1<br>&gt; dually dat=
a1 # cp -ra /usr/src/linux-2.6.16-rc2-mm1/ .<br>&gt; dually data1 # tar cf=
=20
linux.bz2 linux-2.6.16-rc2-mm1/<br>&gt;<br>&gt; ...after about half a minut=
e of activity I receive the message which<br>&gt; I've attached as a small =
JPEG<br>&gt; &quot;reiser4 panicked cowardly: reiser4[tar(4078)] commit_cur=
rent_atom
<br>&gt; (fs/reiser4/txnmgr.c:1130) [zam-597]:&quot;.<br><br>Would you plea=
se try your test on ide disk?</blockquote><div><br><br>At your suggestion I=
 plugged in a spare PATA IDE disk, formatted it with R4, and was about to c=
opy several copies of the Linux kernel sources to the partition, tar them u=
p, and move them around with no lockups or apparent corruption.
<br></div><br><blockquote class=3D"gmail_quote" style=3D"border-left: 1px s=
olid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">&gt=
; I can't see whether it was line 1130 or&nbsp;&nbsp;1138.&nbsp;&nbsp;I'll =
take a quick look<br>
&gt; myself, but I'm completely unfamiliar with reiser4 sources and the<br>=
&gt; kernel sources in general.<br>&gt;<br>&gt; After this my system is com=
pletely locked up. When I mount the<br>&gt; partition after restarting it n=
o longer contains any files. I have few
<br>&gt; or no problems when creating, mounting, and working on reiser4<br>=
&gt; partitions when booted from the System recovery liveCD so it must be<b=
r>&gt; something in the latest sources or in my kernel configuration<br>
<br>IIRC, there were changes (not in reiser4) which caused kernel to notice=
<br>i/o errors on SCSI devices where older kernels did not see any problems=
.</blockquote><div><br>Reiser3 is completely stable on my SATA drives...is =
R4 simply doing more error checking? Why should even a severe I/O error com=
pletely freeze my machine?=20
<br><br>So it seems as though the problem is in the interaction between R4 =
and the SCSI code...are any workarounds to this apparent?<br>&nbsp;</div><b=
r><blockquote class=3D"gmail_quote" style=3D"border-left: 1px solid rgb(204=
, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
&gt; (which is 100% stable for everything else under reiser3, but I haven't=
<br>&gt; bothered to perfect yet).<br>&gt;<br>&gt; Apologies about the JPEG=
, I could not figure out how to get the kernel<br>&gt; output logged into a=
 file(maybe it freezes before the file can flush
<br>&gt; to disk, i dunno). If you know of a way, I welcome instruction.<br=
>&gt;<br><br><a href=3D"mailto:reiserfs-list@namesys.com">reiserfs-list@nam=
esys.com</a> does not accept binary attachments. Please<br>send the image t=
o=20
<a href=3D"mailto:zam@namesys.com">zam@namesys.com</a> and <a href=3D"mailt=
o:vs@namesys.com">vs@namesys.com</a></blockquote><div><br><br>done.<br>&nbs=
p;</div><br><blockquote class=3D"gmail_quote" style=3D"border-left: 1px sol=
id rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
You should setup either serial or netconsole to catch kernel output.<br>Ple=
ase look at instructions:<br>linux/Documentation/serial-console.txt<br>linu=
x/Documentation/networking/netconsole.txt<br><br><br></blockquote></div>
<br>Thanks for the suggestions. I'll see if I can set up logging kernel mes=
sages to my laptop.<br>

------=_Part_10443_27894238.1140893905814--
