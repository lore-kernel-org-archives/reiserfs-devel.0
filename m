From: Zan Lynx <zlynx@acm.org>
Subject: Reiser4, 2.6.28-rc2-mm1 and prepare_write / commit_write
Date: Thu, 30 Oct 2008 10:53:50 -0600
Message-ID: <4909E69E.6070202@acm.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs mailing list <reiserfs-devel@vger.kernel.org>, Edward Shishkin <edward.shishkin@gmail.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

It looks like 2.6.28 committed the removal of prepare_write and
commit_write.  They are apparently replaced with write_begin and write_end.

I thought about trying to convert Reiser4 myself but it was already past
midnight and it looked like it might be six hour job.

The conversion does not look too complicated, but there may be some
tricky issues.

I am wondering if you are already working on this, Edward?
- --
Zan Lynx
zlynx@acm.org

"Knowledge is Power.  Power Corrupts.  Study Hard.  Be Evil."
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.8 (Darwin)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEARECAAYFAkkJ5p4ACgkQolqWs/Y4NLwwxQCfVE8j11jDXHiLC8NVYzLmqFfV
BAIAn0N5154aMz6TIqof+p6D3T277NXo
=DREw
-----END PGP SIGNATURE-----
