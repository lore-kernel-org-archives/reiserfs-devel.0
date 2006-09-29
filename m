From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: icheck and ncheck on ReiserFS to convert bad sector numbers to
 filenames
Date: Thu, 28 Sep 2006 21:02:17 -0400
Message-ID: <451C7099.4050708@suse.com>
References: <60509cfa0609281651v5553d879jd65b8e6d6041b14c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29988-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <60509cfa0609281651v5553d879jd65b8e6d6041b14c@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: chris@witham.com
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Chris Witham wrote:
> I have a hard drive which has failed.  I posted about it here[1], and
> was referred to ddrescue[2] to create an image of the failed disk.
> This was successful, and I now have an image of the drive, including
> the 1688 bad sectors that couldn't be read.  The logfile lists all the
> the bad sectors, and I was referred to these[3] instructions to
> convert the bad sector numbers into filenames that are corrupted.
> 
> Unfortunately, those instructions involve debugfs, which is
> ext2/ext3-specific.  What little information I was able to find online
> about the icheck and ncheck commands used in the instructions and
> ReiserFS has led me to either complaints that they are not implemented
> for ReiserFS, or some variant of a post[4] to this mailing list that
> suggests using 'find / -type f -exec cat {} > /dev/null \;' at
> watching for the filenames that fail.
> 
> That seems like a complete brute force method (scanning over 110GB to
> locate 800kB of bad data!), and will almost certainly return
> inaccurate results because the drive is continuing to fail and will
> return more problems than it experienced initially when the drive
> image was made.  (Not to mention stress the disk further and make any
> more work I may need to do on it more difficult.)
> 
> Is there any way to do the equivalent of icheck or ncheck in ReiserFS?
> If not now, are there plans to implement this functionality anytime
> soon?

I'm afraid the icheck/ncheck way of doing things isn't much less
brute-force, it's just hidden from you. You could do what you're looking
for with a perl script that parses the debugreiserfs output.

Otherwise, I'm afraid I don't think there are any plans to implement
what you're asking for.  We accept patches. :)

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFFHHCZLPWxlyuTD7IRAj8OAJ0TWJL8FHept81jKTZljL4LYR++IQCglvaL
XVqC4ljJme98HuO4rmtD250=
=fgDc
-----END PGP SIGNATURE-----
