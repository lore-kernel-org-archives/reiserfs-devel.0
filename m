From: Paul Wagland <paul@kungfoocoder.org>
Subject: Re: EACCESS vs ENOENT for nonexistent files-within-files
Date: Wed, 15 Sep 2004 16:16:49 +0200
Message-ID: <20040915161649.5cn00s0gw84gkwko@www.wagland.net>
References: <20040915151803.vl9es48kkosg4k88@www.wagland.net>
	<41484BDB.7060007@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=_q0zrce3vmj4";
	protocol="application/pgp-signature"; micalg="pgp-sha1"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21767-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41484BDB.7060007@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: Nikita Danilov <nikita@clusterfs.com>, evilninja <evilninja@gmx.net>, reiserfs-list@namesys.com

--=_q0zrce3vmj4
Content-Type: text/plain; charset=UTF-8; format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

On Wed 15 Sep 2004 04:04:11 PM CEST, Hans Reiser wrote:

> Paul Wagland wrote:
>
>> Does this mean (for example) that on a sgid file, only the group can see the
>> attributes? Even if the file is world readable? Does this really make sense?
>>
>> Here is the rub... you are breaking the rules of "one object - one purpose".
>> Surely this is not how it is meant to be? On a file, the execute bit 
>> is meant
>> for "can I run this file". On a dir, this bit is for "Can I see inside this
>> directory". They do not match!
>>
> Separate bits are needed for the separate purposes.  Nikita, can you
> remind what implementation details delay separating the bits?  I thought
> it was already done, sigh....

Ah good. At least then it can be considered a bug :-) Then I won't get 
too upset
anymore... ;-)

Cheers,
Paul


--=_q0zrce3vmj4
Content-Type: application/pgp-signature
Content-Description: PGP Digital Signature
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBBSE7Qtch0EvEFvxURAq9XAJ9RIdu89sj9vhHsYG3xyxLFkDYAyACgmY6t
mHNW75ZCJ82rvNLzGRSaQfI=
=3OH9
-----END PGP SIGNATURE-----

--=_q0zrce3vmj4--
