From: David Masover <ninja@slaphack.com>
Subject: Re: The situation at hand and in the future
Date: Mon, 31 May 2004 16:23:09 -0500
Message-ID: <40BBA23D.7000109@slaphack.com>
References: <20040527200127.GS4990@nysv.org> <200405272105.i4RL5LDh026210@turing-police.cc.vt.edu> <40B6670D.9060408@slaphack.com> <20040528063324.GT4990@nysv.org> <40B89C9C.5050307@slaphack.com> <873c5j0zm3.fsf@uhoreg.ca>            <40B91A65.2060302@slaphack.com> <200405311827.i4VIRdlS001316@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18939-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200405311827.i4VIRdlS001316@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Valdis.Kletnieks@vt.edu
Cc: Hubert Chan <hubert@uhoreg.ca>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



Valdis.Kletnieks@vt.edu wrote:
| On Sat, 29 May 2004 18:19:01 CDT, David Masover said:
|
|
|>Files are not encrypted by default, so encrypted files should allow a
|>passphrase to be checked by default.  In balancing security and
|>convenience, make convenience the default.
|
|
| Note that if 98% of the files on a file system are plaintext, then
| somebody can infer quite a bit merely by knowing what 2% are
| in fact encrypted.  If they're all encrypted, an attacker can't
| leverage that knowledge.

Fine, so some people will encrypt the entire filesystem, except perhaps
the scripts necessary for entering the passphrase.  But then you're
vulnerable because people can figure out exactly what size all of your
files are, or at least what size they are when compressed...

For most of us, well, I don't give a flying ... er, purple people eater
... whether people know that my pgp key is encrypted, or my ssh keys, or
a little folder called "secret".

Also, I'm not sure how relevent it is today, but I know the Germans
limited the length of an Enigma message, because a longer message means
more redundancy.

But back to the point.  No encryption by default.  My grandmother would
wonder why  her computer is so slow, and if you told her it's so that
the FBI can't read anything when they sieze her computer, she wouldn't
be happy.  Except for the fact that my grandmother is a very patient
woman, so she might not care that it's slow.  But my brother would, and
he plays games, so...

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQLuiPXgHNmZLgCUhAQLeWQ/8DCs+jdS2OeKwbeDOqk8t6SnfOY9SMVpx
uqHOgOMYupAL1gkKnXLLVz3JKK23OK/QXmbVRj54g6oX4vNDsAFonbQ5O6DHlDTP
3uSBLFbYFKROIhIW4+DaSlsDBPPUdP0HSNQ+HvBVmhFQluNOcJHvuO+1QO2UBM54
u53PjlEpgLRTTzYl9IjCAOHO/6Do62DOgjKa2l3b1pUob/BMXJd42lpaks5h0NS3
PZPktA/EYEiTwCmPMIGAZW6skxu4P5CFx+YveTbn43bPQt1yVH+KTBqhphoMScwB
sMpVR5FACBSHsS/xM3sZYMQUoV2jpRJZXL2ACdq7R7HiCmvykrtqW0xVPcuPnXMH
7DUqHGaFt2j0QcdY2+pQ55KdpuiwR1Bhlf5q78QYOkbY0F5eD+wmBUvVZEJYrjfy
oVLYihPs6m08qq5Q2yvkaqLPwQIzIynQzUdYC+BoV+scJkM8OMuzjc87vGNgHRs5
tQa9uEWZn5kYRR6iaOaixhCrEeJMQCWxz0ppq1G5VxbX/Pf0SaCXPIt3HmjjajMn
Vpk605Slln6b14hJ4pJfQogYV/CNcO+aKkCX5Wz42/qvlnx7XykQ1jSh18A5LE1c
m8j85Glt8FbfwgalMLSVV6UV2G61IeJfU/6VblTkRDodW8UrFs574/kqg76V7hRC
ALWqFagD0Cw=
=wOXX
-----END PGP SIGNATURE-----
