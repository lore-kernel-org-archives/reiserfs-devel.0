From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [PATCH 2/2] reiserfs: Add mount counting
Date: Mon, 03 Dec 2007 15:40:24 -0500
Message-ID: <475469B8.4050004@suse.com>
References: <474B4BCF.1000905@suse.com> <47545D0D.6080608@suse.com> <5c7c368b0712031236i33abc7bdtd7a14354c67169b3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <5c7c368b0712031236i33abc7bdtd7a14354c67169b3@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>, Edward Shishkin <edward@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Edward Shishkin wrote:
> Hi Jeff.
> 
> Personally, I don't object.
> What does official reservation mean?
> I can send a request to Hans, but I guess
> we'll receive his "yes" or "no" with substantial delay..

I just mean that those 12 bytes in the superblock are guaranteed not to
be used for something else. Given the pace of reiserfs development, I
don't expect this to be a problem as there are 76 more of them. :)

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.4-svn0 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFHVGm4LPWxlyuTD7IRAlnYAJ96feQvRpbLlOtPoxPbziOb1BgsQQCgnmrI
GC9Hxg0FnQnBAXtOwvri+SE=
=Gfxe
-----END PGP SIGNATURE-----
