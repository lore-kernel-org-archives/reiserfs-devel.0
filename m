From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: remount with open files
Date: Tue, 18 Jul 2006 13:17:25 -0400
Message-ID: <44BD17A5.6060002@suse.com>
References: <e9hvov$4dt$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29063-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <e9hvov$4dt$1@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andreas Moroder <andreas.moroder@sb-brixen.it>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Andreas Moroder wrote:
> Hello,
> 
> we have a SLES8 system with kernel 2.4.19-64GB-SMP and would like to add
> ACLs to the files system. As far as I can see the ACL options are
> compoled into the kernel. Is it possible to add the acl option to the
> /etc/fstab entry and then remount the filesystem with -o remount even
> with open files ?
> 
> When the remount is done do I have to starta another program or so or is
> this all I have to do ?

Yes, ACLs are safe to enable and disable on-the-fly with -oremount,{,no}acl.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFEvRelLPWxlyuTD7IRApAwAJ4+RNlJmHj5P0X21iZDc3HnGRGVmgCfee9s
4EM3hm3HrblEkqMXw8xBAPc=
=2Kbs
-----END PGP SIGNATURE-----
