From: Brian Tinsley <btinsley@emageon.com>
Subject: [Fwd: Re: [ogfs-dev]Re: [Linux-ha-dev] Re: GFS with MD/LVM (Was:
 Using RAID1 SCSI disks with heartbeat)]
Date: Fri, 29 Nov 2002 21:43:02 -0600
Message-ID: <3DE833C6.3000009@emageon.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------020904030303050305080305"
Return-path: <reiserfs-list-return-12073-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com
Cc: Alan Robertson <alanr@unix.sh>


--------------020904030303050305080305
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable

  Hey guys,

Can someone clarify this please?


-------- Original Message --------
Subject: Re: [ogfs-dev]Re: [Linux-ha-dev] Re: GFS with MD/LVM (Was:=20
Using RAID1 SCSI disks with heartbeat)
Date: Fri, 29 Nov 2002 19:01:14 -0700
From: Alan Robertson <alanr@unix.sh>
Reply-To: linux-ha-dev@lists.community.tummy.com
Organization: IBM Linux Technology Center
To: linux-ha-dev@lists.community.tummy.com
CC: Greg Freemyer <Greg.Freemyer@TruStorage.com>, OpenGFS=20
<opengfs-devel@lists.sourceforge.net>
References: <20021129211032.BZIW24110.mtiwmhc13.worldnet.att.net@TAZ2>=20
<3DE7EF45.20903@unix.sh> <20021130013240.Y25901@vestdata.no>



Ragnar Kj=F8rstad wrote:
> On Fri, Nov 29, 2002 at 03:50:45PM -0700, Alan Robertson wrote:
>=20
>>I think EVMS has (or will have soon) r/w snapshots.
>>
>>
>>>WIth r/w snapshots, the process can be: snapshot, clean, mount.  I think=
 that=20
>>>could be done=20
>>>with no FS support. =20
>>
>>The FS support is still preferred because the integrity of the volume is =

>>still better (nothing held in cache).  Some filesystems can still process=
=20
>>journals on readonly filesystems.  IIRC, ReiserFS does that.
>=20
>=20
> I don't think so. Reiserfs had to be patched to work with lvm snapshots
> as well.

Originally it needed patches, but I was under the impression that those=20
patches were now in the base code.


--=20
     Alan Robertson=20

"Openness is the foundation and preservative of friendship....  Let me clai=
m=20
from you at all times your undisguised opinions." - William Wilberforce


_______________________________________________________
Linux-HA-Dev: Linux-HA-Dev@lists.community.tummy.com
http://lists.community.tummy.com/mailman/listinfo/linux-ha-dev
Home Page: http://linux-ha.org/


--=20
Brian Tinsley
Chief Systems Engineer
Emageon


--------------020904030303050305080305
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <title></title>
</head>
<body>
 Hey guys,<br>
<br>
Can someone clarify this please?<br>
<br>
<br>
-------- Original Message --------
<table cellpadding="0" cellspacing="0" border="0">
  <tbody>
    <tr>
      <th valign="baseline" align="right" nowrap="nowrap">Subject: </th>
      <td>Re: [ogfs-dev]Re: [Linux-ha-dev] Re: GFS with MD/LVM (Was: Using
RAID1 SCSI disks with heartbeat)</td>
    </tr>
    <tr>
      <th valign="baseline" align="right" nowrap="nowrap">Date: </th>
      <td>Fri, 29 Nov 2002 19:01:14 -0700</td>
    </tr>
    <tr>
      <th valign="baseline" align="right" nowrap="nowrap">From: </th>
      <td>Alan Robertson <a class="moz-txt-link-rfc2396E" href="mailto:alanr@unix.sh">&lt;alanr@unix.sh&gt;</a></td>
    </tr>
    <tr>
      <th valign="baseline" align="right" nowrap="nowrap">Reply-To: </th>
      <td><a class="moz-txt-link-abbreviated" href="mailto:linux-ha-dev@lists.community.tummy.com">linux-ha-dev@lists.community.tummy.com</a></td>
    </tr>
    <tr>
      <th valign="baseline" align="right" nowrap="nowrap">Organization: </th>
      <td>IBM Linux Technology Center</td>
    </tr>
    <tr>
      <th valign="baseline" align="right" nowrap="nowrap">To: </th>
      <td><a class="moz-txt-link-abbreviated" href="mailto:linux-ha-dev@lists.community.tummy.com">linux-ha-dev@lists.community.tummy.com</a></td>
    </tr>
    <tr>
      <th valign="baseline" align="right" nowrap="nowrap">CC: </th>
      <td>Greg Freemyer <a class="moz-txt-link-rfc2396E" href="mailto:Greg.Freemyer@TruStorage.com">&lt;Greg.Freemyer@TruStorage.com&gt;</a>,   OpenGFS <a class="moz-txt-link-rfc2396E" href="mailto:opengfs-devel@lists.sourceforge.net">&lt;opengfs-devel@lists.sourceforge.net&gt;</a></td>
    </tr>
    <tr>
      <th valign="baseline" align="right" nowrap="nowrap">References: </th>
      <td>&lt;20021129211032.BZIW24110.mtiwmhc13.worldnet.att.net@TAZ2&gt;
<a class="moz-txt-link-rfc2396E" href="mailto:3DE7EF45.20903@unix.sh">&lt;3DE7EF45.20903@unix.sh&gt;</a> <a class="moz-txt-link-rfc2396E" href="mailto:20021130013240.Y25901@vestdata.no">&lt;20021130013240.Y25901@vestdata.no&gt;</a></td>
    </tr>
  </tbody>
</table>
 <br>
<br>
<pre>Ragnar Kj&oslash;rstad wrote:
&gt; On Fri, Nov 29, 2002 at 03:50:45PM -0700, Alan Robertson wrote:
&gt; 
&gt;&gt;I think EVMS has (or will have soon) r/w snapshots.
&gt;&gt;
&gt;&gt;
&gt;&gt;&gt;WIth r/w snapshots, the process can be: snapshot, clean, mount.  I think that 
&gt;&gt;&gt;could be done 
&gt;&gt;&gt;with no FS support.  
&gt;&gt;
&gt;&gt;The FS support is still preferred because the integrity of the volume is 
&gt;&gt;still better (nothing held in cache).  Some filesystems can still process 
&gt;&gt;journals on readonly filesystems.  IIRC, ReiserFS does that.
&gt; 
&gt; 
&gt; I don't think so. Reiserfs had to be patched to work with lvm snapshots
&gt; as well.

Originally it needed patches, but I was under the impression that those 
patches were now in the base code.


-- 
     Alan Robertson <alanr @unix.sh="">

"Openness is the foundation and preservative of friendship....  Let me claim 
from you at all times your undisguised opinions." - William Wilberforce


_______________________________________________________
Linux-HA-Dev: Linux-HA-Dev@lists.community.tummy.com
http://lists.community.tummy.com/mailman/listinfo/linux-ha-dev
Home Page: http://linux-ha.org/
</alanr></pre>
<br>
<pre class="moz-signature" cols="$mailwrapcol">-- 
Brian Tinsley
Chief Systems Engineer
Emageon</pre>
</body>
</html>

--------------020904030303050305080305--

