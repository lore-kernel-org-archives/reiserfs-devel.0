From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: XATTR bugs
Date: Tue, 09 Dec 2003 21:10:46 -0500
Message-ID: <3FD680A6.9090403@suse.com>
References: <16323.62343.428966.858580@pc7.dolda2000.com>	<3FD65B57.8040603@suse.com> <16342.30028.148943.409122@pc7.dolda2000.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16311-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16342.30028.148943.409122@pc7.dolda2000.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Fredrik Tolf <fredrik@dolda2000.com>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Fredrik Tolf wrote:
| These are not the greatest problems with the XATTR patches,
| though; they were only what I discovered initially. The greatest
| problem (I don't know if this might not appear on 2.4 kernels, but it
| certainly did occur on all my 2.6 kernels) is that ACLs can suddenly
| "disappear".
|
| I don't know exactly what it was that happened, but sometimes (without
| any pattern that I could notice), the ACLs would simply become
| ineffective. The XATTR for the ACLs was still there, but it was as if
| it wasn't taken into account for any kind of operation. When checking
| with getfattr, the ACL attribute was still there and looked just as it
| did before whatever happened happened, but in every other aspect it
| was as if it wasn't there anymore. The only way to solve it was to run
| "setfacl -b" on the affected file and then recreate the ACL.
|
| In fact, this forced me to abandon ReiserFS in favor of XFS.
| Regrettable as it may be, I didn't want to live without ACLs, and I
| had too much on my hands to start debugging it... :-(

This is the first I've heard of this behavior. Do you have a reliable
way of reproducing it? I realize that you said you didn't find a
pattern, but what was the workload you were applying to the ACLs?

Thanks.

- -Jeff

- --
Jeff Mahoney
SuSE Labs
jeffm@suse.com
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQE/1oCmLPWxlyuTD7IRAopKAJ0V7DIfSG833p53CTSStnVwOOZJtgCgmDah
GpNUM39k2JSRvpFoEqCcRIQ=
=7suS
-----END PGP SIGNATURE-----
