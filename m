From: Jeff Mahoney <jeffm@suse.de>
Subject: Re: circular locking dependency check in reiserfs
Date: Tue, 20 Jan 2009 10:04:14 -0500
Message-ID: <4975E7EE.9080801@suse.de>
References: <200901201549.21540.oliver@neukum.org> <4975E578.807@suse.de> <200901201604.11825.oliver@neukum.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <200901201604.11825.oliver@neukum.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oliver Neukum <oliver@neukum.org>
Cc: reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Oliver Neukum wrote:
> Am Tuesday 20 January 2009 15:53:44 schrieb Jeff Mahoney:
>> Oliver Neukum wrote:
>>> I was reading mail.
>>>
>>> 	Regards
>>> 		Oliver
>> I know, I know.
>>
>> The SUSE reiserfs patchset fixes this. I'm still tracking Novell bug
>> 399966 before submitting. I'm still unable to reproduce it, and I'm not
>> sure if it occurs on the mainline kernel. I suspect it probably does,
>> but I want to be certain.
> 
> Sorry, I should clearly stated that this was on vanilla 2.6.29-rc1 plus
> a few USB patches.

Yeah, I figured. I was referring to bnc#399966, not your bug. Your bug
is already fixed in my tree.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iEYEARECAAYFAkl15+4ACgkQLPWxlyuTD7IRngCgktNqyrKlvu7nbUksFRFouo+r
YicAn3H8TTh0lBcOr2E7cGLKGiDoxs5r
=Hkq9
-----END PGP SIGNATURE-----
