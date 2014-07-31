From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: reiser4: FITRIM ioctl -- where to place the handler?
Date: Fri, 01 Aug 2014 02:09:42 +0400
Message-ID: <3068350.OYcdkFahEG@intelfx-laptop>
References: <1888625.Xe1HFmG7T5@intelfx-laptop> <53DAB71E.5020303@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart234484090.oPzO4zPXoL"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=Dm/RzEaP/phDLdb9p1luH1R+fDy1GGKNI/oqhSCbyTA=;
        b=llSo8Gv+GESxQz5hrMYhYCUIRlauNbXflN1aLVkZ/xPOvoUiEUEbBzahCntwtBbpzm
         14sJpqjzLMbAC7zlztRjqxAucj/Zc/MqJCJNWoKkhnuFAP7bjxQb7qIvW7W5O1xxyYbT
         KzKEEWc0DHSYlEtOpjmHBuL3XgaHkQP9FKLscuZWNUAUXt0io8Y3lRPR+sq7yYOhHyqa
         e7SyGPhjJRCSYcrzRM8F+YU9HPo6ov6XTqcGGZLKwfbCKDghxRPUA2ZinrqKRDaWiF3b
         GljS2hnlgnbdBq+g9rSMsYZonlaVp77i16juudZZXFHdNr/SgwDQ7bj7vWF83zj0SMvE
         HXSg==
In-Reply-To: <53DAB71E.5020303@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


--nextPart234484090.oPzO4zPXoL
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Thursday 31 July 2014 at 23:37:34, Edward Shishkin wrote:=09
> Do we really need this ioctl?
> If we implement precise discard (with garbage collection),
> then I don't see any applications for this ioctl..
>=20
> Edward.

I think that we need it: think of unclean unmounts, fs corruptions (fsc=
k does
not discard new free space), forgotten 'discard' mount option, etc...

Having as much discarded space as possible is important not only for ha=
ving
faster writes, but also for the background firmware-based wear leveling=
 to
function efficiently.

=2D-=20
Ivan Shapovalov / intelfx /
>=20
>=20
> On 07/31/2014 04:23 PM, Ivan Shapovalov wrote:
> > Hi,
> >
> > I've started to iterate on the batch mode discard implementation fo=
r reiser4,
> > and the first question is -- where to place the ioctl handler?
> >
> >  From what I've been able to understand, we need something like
> > reiser4_ioctl_dir_common() in plugin/file_ops.c, pointer to which s=
hould
> > become ->{unlocked,compat}_ioctl() of directory_f_ops in plugin/obj=
ect.c.
> >
> > However, in this case, what is DIRECTORY_FILE_PLUGIN_ID and corresp=
onding
> > entry in file_plugins array in plugin/object.c? How is it related t=
o
> > directories?
> >
> > I see that its ->{inode,file,as}_ops are empty, so it probably does=
 not
> > participate in dispatching ioctls, but I'd like to make sure this i=
s the case.
> >
> > Thanks,
> 
--nextPart234484090.oPzO4zPXoL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlPavqYACgkQxUKljSIMAnDx6wD+Jpu4bACS0iEdIo4Two8kechl
ffNAX4kGll6Gs6ehPtIA/0Y7IjbyH803F8CR0zvEnu+P0HiJ2U5xmuYTUofan0bg
=vods
-----END PGP SIGNATURE-----

--nextPart234484090.oPzO4zPXoL--

