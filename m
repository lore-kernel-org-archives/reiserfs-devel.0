From: Paul Wagland <paul@wagland.net>
Subject: Re: reiser4 and megaraid problems with debian 2.6.5
Date: Sat, 17 Apr 2004 09:38:00 +0200
Message-ID: <26F302F3-9042-11D8-8B4A-000A95CD704C@wagland.net>
References: <20040416203937.GY14134@nysv.org>
Mime-Version: 1.0 (Apple Message framework v613)
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha1; boundary="Apple-Mail-17-801065258"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18019-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040416203937.GY14134@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Markus TXrnqvist <mjt@nysv.org>
Cc: reiserfs-list@namesys.com

--Apple-Mail-17-801065258
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII; format=flowed


On Apr 16, 2004, at 22:39, Markus TXrnqvist wrote:

> Paul Wagland wrote:
>
>> Bonnie: drastic I/O error (re write(2)): No such file or directory
>
> I applied http://mjt.nysv.org/reiser/bonnie.patch which may or may
> not help. Nikita gave it on IRC, but without either of us having
> time at the moment to do much about it (so it'll wait until Monday,
> at least).
>
> Guess the point of this email is that I won't forget the results I
> got by then :)

As such, I will also add my results to this thread... please note that 
I am not with my main machine at the moment, so can't post the numbers 
:-\

Anyway, I also have applied the above patch, and rerun my bonnie test, 
but this time on a 4GB partition.

I am still getting failures, but nothing is being printed in dmesg or 
/var/log/kern.log

What happens is that the character output works, and creates four 
files, 3x1Gb and 1x512MB. In another window I have a df loop running, 
and I can see that there is about 495MB free. So far so good :-) Now 
the "intelligent writing" starts, and after about 10 seconds it fails 
with the "drastic IO error...no such file or directory" error, looking 
at the df window I can see that when it fails there is 3.5GB free on 
that disk, I.e. about 480MB had been used. Since it is a one second 
loop in both cases then I am imagining that bonnie was able to write 
out 4GB of data.

What I think is happening in this case is that reiser4 is that although 
the old files have been deleted, and the online disk maps have been 
updated to show that there is enough free disk, the logs used to create 
those original files have not been freed. Does that make sense? Maybe 
it might help some of the more knowledgeable in determining what is 
happening?

Let me know if I can run any further tests to further determine what is 
happening.

Cheers,
Paul

--Apple-Mail-17-801065258
content-type: application/pgp-signature; x-mac-type=70674453;
	name=PGP.sig
content-description: This is a digitally signed message part
content-disposition: inline; filename=PGP.sig
content-transfer-encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (Darwin)

iD8DBQFAgN7dtch0EvEFvxURAuYMAJ9tRLP0Z2txUkuGfRztOn/U2u3YvQCfbh7s
74lB2JvWy9i25vo5yA1udpY=
=IGR6
-----END PGP SIGNATURE-----

--Apple-Mail-17-801065258--

