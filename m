From: Todd Lyons <todd@mrball.net>
Subject: Re: ReiserFS v3 + millions of files?
Date: Tue, 28 Oct 2003 22:03:45 -0800
Message-ID: <20031029060345.GA21398@mrball.net>
References: <200310262146.28850.d.oglesby@insightbb.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15920-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200310262146.28850.d.oglesby@insightbb.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; x-action="pgp-signed"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Dan Oglesby wanted us to know:

>The array is used to store what will basically amount to more than one million 
>files with an average size of sixty kilobytes.

If I had to make an educated guess, you're doing something similar to
what I'm doing.  That's all you'll get out of me for now :-)

>During simulations for file writes, I'm seeing write performance begin to drop 
>dramatically after 800,000 files have been stored on the filesystem.

Hmmm, I did some tests that I went up to 300,000 files with an average
size of 20Kbytes.  The end application will be targeted at 6.5 million
files with the same average 20Kbyte size.

For my tests, I compared EXT3, XFS, reiser(tails), and reiser(notail).
The results are at http://www.mrball.net/file%20creation%20tests.html

After reading your post, I'm going to repartition and repeat my tests
with much larger filecounts.

>The filesystem is being mounted with the following options:  
>defaults,notail,noatime,nodiratime

I'll repeat with noatime and nodiratime, but my simple little benchmark
opens(creates), writes, and closes.  Very little affect by my
guestimation will be felt by those two.  Maybe I'm wrong though.

>The filesystem was created with default options, basically a "mkreiserfs /dev/
>sda1".

I made it a point of using slow IDE drives for my tests.  They were done
on a 5400 RPM IDE drive.
- -- 
Blue skies...	Todd 	Public key: http://www.mrball.net/todd.asc
 Favourite shell:  bash, though I also like 'init=/usr/bin/emacs'
                                                --Andrew Tridgell
Linux kernel 2.4.22-10mm.2mdk   1 user,  load average: 0.00, 0.03, 0.06
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)
Comment: http://www.mrball.net/todd.asc

iD8DBQE/n1hBIBT1264ScBURAhc7AKDkwHfhMXdbkEN14d2FVrwsb1A7YgCgymmN
bFouT/2wnIEA6N3fd4u6q3Q=
=xoll
-----END PGP SIGNATURE-----
