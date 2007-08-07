From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [PATCH] reiserfs: > 8 TB fs support
Date: Tue, 07 Aug 2007 12:27:25 -0400
Message-ID: <46B89D6D.5040205@suse.com>
References: <46B77DAD.3030805@suse.com> <46B885DC.1030907@namesys.com> <46B88C07.5050907@suse.com> <46B8A258.6040606@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <46B8A258.6040606@namesys.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: vs@namesys.com
Cc: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Vladimir V. Saveliev wrote:
> Oops, that comment is about function parameter 'block'.
> It would be nice if we used __u32 for block disk addresses everywhere
> (which is probably not easy to do).

Ah ok. I'll change that then. I'd also love all the block references to
be the same thing. I wouldn't have had to do this part of the patch at
all if that were the case.

> Journal can be moved ast 8Tb with tunereiserfs (even it is likely that
> nobody ever did that).

Yeah, that's why I was including it anyway. :)

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.4-svn0 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFGuJ1tLPWxlyuTD7IRAjRnAJ9DZF/wpjH/Jfkte0ckaQnVqWO7pwCghkET
XFwmSbTnA/8v9OYL4jwPr8E=
=XhY5
-----END PGP SIGNATURE-----
