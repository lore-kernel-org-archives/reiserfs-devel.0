From: Paul Wagland <paul@wagland.net>
Subject: Re: reiser4 and megaraid problems with debian 2.6.5
Date: Wed, 14 Apr 2004 16:03:13 +0200
Message-ID: <783DFD2F-8E1C-11D8-A41D-000A95CD704C@wagland.net>
References: <36927C82-8DE0-11D8-A41D-000A95CD704C@wagland.net> <20040414090547.GB13578@raptus.homelinux.org> <6699459A-8E10-11D8-A41D-000A95CD704C@wagland.net> <16509.14375.539110.986025@laputa.namesys.com> <295743F0-8E17-11D8-A41D-000A95CD704C@wagland.net> <1081950306.8626.122.camel@tribesman.namesys.com>
Mime-Version: 1.0 (Apple Message framework v613)
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha1; boundary="Apple-Mail-43-564978444"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17933-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1081950306.8626.122.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Vladimir Saveliev <vs@Namesys.COM>
Cc: reiserfs-list@Namesys.COM

--Apple-Mail-43-564978444
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII; format=flowed

Hi Vladimir,

On Apr 14, 2004, at 15:45, Vladimir Saveliev wrote:

> On Wed, 2004-04-14 at 17:25, Paul Wagland wrote:
>> On Apr 14, 2004, at 15:09, Nikita Danilov wrote:
>>>
>>> Is there anything in the logs?
>>
>> Sadly I forgot to check... though I will check again tonight since the
>> problem is quite reproducible for me. Will report
>
> Would you also mind to try on another device, please?

Sadly, I can't, since I only have two machines that I can play with, 
one which is quite averse to 2.6 (not sure why, but it is going away 
soon so I haven't looked into it) and the one with the megaraid device, 
and this machine only has disks exported through that card. I can try 
it with the stock 2.6.5 driver, and will do so if the "Jiffies|1" fix 
doesn't help.

Cheers,
Paul

--Apple-Mail-43-564978444
content-type: application/pgp-signature; x-mac-type=70674453;
	name=PGP.sig
content-description: This is a digitally signed message part
content-disposition: inline; filename=PGP.sig
content-transfer-encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (Darwin)

iD8DBQFAfUSktch0EvEFvxURAjjLAJ9Qz302Who3KYCFyCT4XKYZHHAhMACgwMIm
mg+/pmmT14+PupUujPJM/f8=
=1SKv
-----END PGP SIGNATURE-----

--Apple-Mail-43-564978444--

