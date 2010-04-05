From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: reiserfs + acl corruption
Date: Mon, 05 Apr 2010 11:34:43 -0400
Message-ID: <4BBA0313.4020405@suse.com>
References: <54cce25c1003280829q2a173c91p55bc3297a3163452@mail.gmail.com> <alpine.DEB.2.01.1004041324340.29272@bogon.housecafe.de> <alpine.DEB.2.01.1004041755070.29272@bogon.housecafe.de> <alpine.DEB.2.01.1004042240500.29272@bogon.housecafe.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.01.1004042240500.29272@bogon.housecafe.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christian Kujau <lists@nerdbynature.de>
Cc: Marco Gatti <marco.gatti@gmail.com>, reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 04/05/2010 01:44 AM, Christian Kujau wrote:
> On Sun, 4 Apr 2010 at 18:11, Christian Kujau wrote:
>> Got it. After a few more iterations of the testscript[0] I was hitting it 
>> at 25601 files, 25600 file were fine. Again, setting and removing *one* 
>> ACL is fine, but removing *all* ACLs lead to I/O error.
> 
> The 25601 files don't need to be in one single directory. With 25000 files in 
> one and 25000 files in another (sub-)directory, the same happens. Enabling 
> REISERFS_CHECK hasn't revealed any more information yet.

Ok. I'm able to reproduce this with your script. I _can't_ reproduce it
with 8 GB of memory, but I can reproduce it with mem=256m. That's a good
data point.

- -Jeff

- -- 
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.14 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org/

iEYEARECAAYFAku6AxMACgkQLPWxlyuTD7K5HwCfQrKlzFoLu93sfVPAolDVPsvI
gsoAmwdMU9sT4fWIlrWw+RMnFuHJDk8U
=pJCj
-----END PGP SIGNATURE-----
