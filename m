From: Thomas Bittermann <t.bittermann@online.de>
Subject: Re: Crash Corse in Partition Recovery
Date: Fri, 20 Oct 2006 12:11:18 +0200
Message-ID: <4538A0C6.3020606@online.de>
References: <cc3fd8f30610180606n12707760h747c95d214324ed8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30079-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <cc3fd8f30610180606n12707760h747c95d214324ed8@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Corey McGuire <coreyfro@coreyfro.com>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Corey McGuire schrieb:
> Hey all,
> 
> I was updating my system's bios and my drives got reordered.  When I 
> went to nuke my Windows drive, I missed and hit my swap and reiserfs 
> drive.  I was wondering if there is a web sight that gives step by 
> step instructions for recovery, or if you guys had a silver bullet 
> method for findind the begining and ends of a partition.  I don't 
> remember the exact size of my swap, but I know it came first.
> Nothing has happened since I messed up the partition table and I ran
> "DD" so I have an image of the drive for safe exploration.
> 
> Thanks!
> 
i had some succes-stories with testdisk:

"TestDisk is a powerful free data recovery software! It was primarily
designed to help recover lost partitions and/or make non-booting disks
bootable again when these symptoms are caused by faulty software,
certain types of viruses or human error (such as accidentally deleting
your Partition Table). Partition table recovery using TestDisk is really
easy."

... found on http://www.cgsecurity.org/wiki/TestDisk
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFFOKDG3E3TGgPB70IRAkxAAJ4wFHL3dANqyFUh7k5gDh4Nw71okACeK6O6
FQYNZTJkheLlwM8aaoNzbDQ=
=AkGI
-----END PGP SIGNATURE-----
