From: David Masover <jedi@ninja.dynup.net>
Subject: reiser4 test
Date: Sun, 23 Nov 2003 00:01:53 -0600
Message-ID: <3FC04D51.10507@ninja.dynup.net>
References: <NHBBLMBAALMFLLANBMBIKECOCAAA.Stephan.Reichel@1net4you.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16146-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <NHBBLMBAALMFLLANBMBIKECOCAAA.Stephan.Reichel@1net4you.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I have a new notebook, which I back up every day because it's a 
notebook.  Recently I converted all of its partitions except /boot (to 
support grub) to Reiser4 (from 3.6).  (Converted through some heroic 
maneuvering while booting with init=/bin/bash, not by writing a 
conversion utility.)

I figure I can either suffer in silence or share my experiences.

So far, performance seems very good, and finally my problem of disk 
access is solved -- it spins down!  For 10 or 15 minutes at a time!  
Space efficiency also looks much better.  I don't know if anyone on this 
list uses Gentoo, but the directory /usr/portage typically has 60 or 70 
megabytes of mostly byte to kilobyte sized files, within two layers of 
fairly large (100 +) directories of directories.  Being prudent, I put 
it on its own half-gig partition.  With v3, it uses around 120 megs.  
With v4, 60 or 70.

Other nice things -- speed is definitely better, but it usually doesn't 
matter.  I don't see a noticeable difference with desktop apps, but most 
of the time, they are a certain size and take a certain amount of time 
to open, and after that, there's very little disk access (or even CPU 
usage -- they mostly wait for input).  I can't test much else -- music 
would not be noticeable except while ripping, and I haven't tried 
gaming.  The places that I see performance improvements are places like 
tar, rsync (that /usr/portage dir gets rsynced every day), and program 
installation (which involves automatic fetching, unpacking, compiling, 
and installing of source tarballs).  I haven't really been able to 
measure CPU usage, as I haven't actually run benchmarks -- these are 
just impressions.

Every now and then I have a crash.  It happens gradually, as it's 
locallized to the filesystem -- I can keep working in any program that 
does not access the filesystem (so you can imagine how long that 
lasts).  Once a program touches the filesystem after this "crash", it 
stops responding, so I get the _effect_ of the entire system locking up 
in about 15 or 20 seconds.  I'm not complaining -- this machine came 
with WinXP home!

Interesting looking lines in the logs (not all of them new since Reiser4):

Nov 22 18:29:10 [kernel] WARNING: Flushing like mad: 65536
Nov 22 22:46:14 [kernel] spurious 8259A interrupt: IRQ7.
Nov 22 22:50:49 [kernel] reiser4[ktxnmgrd:run(11)]: commit_current_atom 
(fs/reiser4/txnmgr.c:1184)[nikita-3176]:

(Note that these lines are not one after another -- they are fairly 
scattered.)

After these crashes, typical results are -- nothing.  I don't notice 
anything different in dmesg -- just "loading reiser4 bitmap......done 
(124 jiffies)" (the number of jiffies changes).  If I'm supposed to see 
something else, this is a bug in implementation.  If I'm not, it's a bug 
in design -- I should know when things were not unmounted cleanly.  I 
haven't seen any corruption either directly or indirectly (through the 
reaction of individual programs) -- seems like just whatever made it to 
disk, made it, and whatever didn't, didn't -- so the atomicity seems to 
work.

I've been running like this for 2 or 3 days now.  I can't reproduce the 
crash with any specific activity, just seems to happen about once a day 
(or as reliable as win2k if you don't game).  It's also been happening 
most often when I'm gone, having left long-ish builds running.  Not 
often enough to be inconvenient, just often enough to give me a little 
adrenaline rush every time I log on.

I'd welcome any patches, and I'm willing to run tests.  I can't really 
hack it now -- maybe next summer.

Looking forward to a stable version -- this technology belongs on my 
servers!
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBP8BNYQisZLIF6uqOAQKSrg//fQx+Fr6F/zaUOyranWtm+Y/idMd1j/m3
YBUeUMSlVvO+kMnGC/urUrWLx0LcYubxBrkaZ/+XTRMfa/DG2ghX44+rJG0+cepN
ulQ+eSGUlO9lvO55sB6aLgFrQmfvbmFpBGRWyOG5L88tZe9TdbSXYJ/vMoZLPQcZ
OR2tr/QInja1eJbYfKX//6CsPmUQxT1WHGeS1hWWB33Xmw+wtPOovsDJ3Cd1j+ib
akzvinihKFTo/nTpUXzAmKqckZa35jdHnZc4fuWlE+RdrCwOqtFSnfep2iTQfNFH
dmDWre9FwetmRacGJmKN2ITF648gBjdyzqM4zyrEuxFgQpXAcF3QnOXxXmcInhdm
OCgYYiNQd6fTT1wo1TS5k7OvSFMu2xenwBiXL9uOAvdWPzfvGyKFksH+For0Fqot
nYPCOhsPUVwuEfho/FC578EnWz16jF36It4JDKdO5EGu8KPUsGebPTurA2fBP8fF
wXsHPeR4NRoadfcNFu0UDzawYFuyPZ41Y3frxaq2lpSr8DmvqLSzbz7a2rCs25Ww
hWGTGhz8VZfMWJJtdPoC65flZInR8TJ1sm+Y2fbOh2AbEfAnUfGN3pGVdBNhsI2F
CJBEZdqA2NXZ0h8LsrME58hGZiQ2zllllsrsuvjZ8LLZQJzc8bgA3yUjBAbonrIK
4bypQAKNxps=
=eEjY
-----END PGP SIGNATURE-----

