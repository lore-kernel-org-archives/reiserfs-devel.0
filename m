From: Jeff Mahoney <jeffm@suse.com>
Subject: ReiserFS XATTR/ACL on 2.5
Date: Thu, 12 Jun 2003 10:25:38 -0400
Message-ID: <3EE88D62.6050602@suse.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enigECAF9F6B87938A698EBA41B0"
Return-path: <reiserfs-list-return-14516-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: Reiserfs List <reiserfs-list@namesys.com>

--------------enigECAF9F6B87938A698EBA41B0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hello all -

I previously posted that I have ported my xattr/acl patches from the 
SuSE kernel to the vanilla kernel. They were available for 2.4 only.

After receiving a few emails, I have forward ported the patches to 2.5.70.

 From the README:
    For the most part, these patches are identical to the patches for 
2.4. This means that there may well be locking and performance issues, 
but these are also the first release I've made against 2.5. I've done 
some basic stress testing (18h of stress.sh w/ a default ACL set), but 
beyond that, they're new to the world.

     The main difference is that, in contrast to Andreas' 2.4 patches, 
trusted and user xattrs are implied to be enabled if xattrs are enabled. 
Trusted xattrs, as before, are enabled at runtime if xattrs are compield 
in. User xattrs, as before, need to have the user_xattr mount option set.

     The original patches have been part of the SuSE kernel for some 
time, but haven't really seen testing on a vanilla kernel. Use at your 
own risk.

The patches are available at: 
ftp://ftp.suse.com/pub/people/jeffm/reiserfs/aclea/2.5.70

-Jeff

-- 
jeffm@suse.com
jeffm@csh.rit.edu

--------------enigECAF9F6B87938A698EBA41B0
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQE+6I1mLPWxlyuTD7IRAhAdAJ9WU4LsjK+K59LECN1YGepNQOYMjwCdHmEz
p22u5cmHEWGS1rnOcnSJfKI=
=lcsG
-----END PGP SIGNATURE-----

--------------enigECAF9F6B87938A698EBA41B0--

