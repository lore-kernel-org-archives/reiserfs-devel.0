From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: quicker mount
Date: Thu, 27 Apr 2006 10:42:38 -0400
Message-ID: <4450D85E.50109@suse.com>
References: <20060427143635.GA5949@gelma.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28532-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060427143635.GA5949@gelma.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrea Gelmini <dislessico@gmail.com>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Andrea Gelmini wrote:
> Hi all,
> 	mounting 1.9TB partitions (latest stable kernel), takes 3m33s.
> 	What can I do to make it quicker?

It takes so long to mount since ReiserFS reads all the bitmaps before
mounting. The larger the file system, the longer it takes.

I have patches that dynamically load the bitmaps, which makes the mount
nearly instantaneous, but I haven't finished debugging them.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFEUNhdLPWxlyuTD7IRAq7nAJ9gwm52meieN9sb2aQ+q4BczIZTEQCfXPGp
VIe3X23Uy20b33CfjC+AJh8=
=Di4u
-----END PGP SIGNATURE-----
