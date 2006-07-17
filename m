From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [PATCH] reiserfs: fix handling of device names with /'s in them
Date: Mon, 17 Jul 2006 14:16:32 -0400
Message-ID: <44BBD400.3060504@suse.com>
References: <6xQ4C-6NB-43@gated-at.bofh.it> <6xQea-6ZX-13@gated-at.bofh.it> <E1G1QFx-0001IO-K6@be1.lrz> <44B7D97B.20708@suse.com> <44B9E6D5.2040704@namesys.com> <44BA61A2.5090404@suse.com> <44BA8214.7040005@namesys.com> <44BABB14.6070906@suse.com> <44BAE619.9010307@namesys.com> <44BAECE2.8070301@suse.com>            <44BAFDC3.7020301@namesys.com> <200607171808.k6HI8kjL018161@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751123AbWGQSPp@vger.kernel.org>
In-Reply-To: <200607171808.k6HI8kjL018161@turing-police.cc.vt.edu>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Valdis.Kletnieks@vt.edu
Cc: Hans Reiser <reiser@namesys.com>, 7eggert@gmx.de, Eric Dumazet <dada1@cosmosbay.com>, ReiserFS List <reiserfs-list@namesys.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@osdl.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Valdis.Kletnieks@vt.edu wrote:
> On Sun, 16 Jul 2006 20:02:27 PDT, Hans Reiser said:
> 
>> Create a mountpoint which knows how to resolve a/b without using a
>> "directory".
> 
> And said mountpoint gets past the '/' interpretation in the VFS, how, exactly?
> 
> fs/namei.c, do_path_lookup() does magic on a '/' on about the 3rd line.
> So you're going to get handed 'a'.

That's where he started talking about how BSD gets namei() right by
allowing each file system to deal with it how it chooses.

Personally, I think it's insane. On occasion, I've started to port
ReiserFS to BSD-like systems, and I get so fed up with how you have to
reinvent the wheel for everything. There's something to be said for
replaceable-anything semantics, but personally I like the Linux model
and having an agreed-upon framework to work with.

I also think it's insane to come up with a reisermetafs to export procfs
information when a simple s#/#!# _on a single directory name_ will do
the job.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFEu9QALPWxlyuTD7IRAqHbAKCVknPt6Gr43YHyrUZVtmuuEWX9UgCfdw74
tXwbWr5AhupA868D96lw9Eo=
=NvUr
-----END PGP SIGNATURE-----
