From: David Masover <jedi@ninja.dynup.net>
Subject: Re: A bold idea (Re: Carrying Attributes too Far)
Date: Fri, 05 Dec 2003 08:00:19 -0600
Message-ID: <3FD08F73.4070404@ninja.dynup.net>
References: <1065247084.3f7e616c94ec9@webmail.st-andrews.ac.uk>	 <3FCE3716.8000509@namesys.com>	 <1070584227.3fcfd1a3d67f4@webmail.st-andrews.ac.uk>	 <3FD00272.7040607@ninja.dynup.net> <1070617453.5605.13.camel@schlappix.schnulli.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16246-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1070617453.5605.13.camel@schlappix.schnulli.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


>If you want to have a flexible size for a filesystem, the are
>possiblities with LVM (or others) which gives you also the possibility
>to create a raid - which you normally want on such filesystems.
>Hardlinks between different partitions gives another problem: What is,
>if the other partition is not available (unmounted or crashed)? What is,
>if the other partition is an NFS-mounted partition with all the
>possiblities that can happen?
> 
>  
>
That's why I don't think there should be hardlinks across devices.  You 
can put a filesystem on a RAID, of course.  LVM is not really a 
solution, for several reasons.  For example, it seems as though it's 
actually possible to have an entire partition fragmented in the same way 
that a single file can be, and there's no way to fix that.

It also requires the user to change things.

Now, why would I use separate filesystems in the first place?  Two 
reasons:  performance and security.  Right now, it's a lot easier to 
have /var be a certain sized partition rather than trying to enforce 
disk quotas.  It also improves performance if we know that quickly 
moving data like that in /tmp is separated from slowly moving data like 
that in /usr.  However, I think both of these problems could be solved 
to the point where an intelligent filesystem would beat an intelligent 
admin on partitioning any time.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBP9CPcwisZLIF6uqOAQJePA//UIo+NjWW6AwLSNpanthF+kggKGQ5R/ha
GYim57s3BRCKOl1JSSpopCsM2jgKQvSqUzdLOJJX7BB8G1YNoGNB5/RAHaW8EmEp
bJ3rZro+ki2lkA4zAMiXP5f1Sfk3McjFA07C0ZBVOy1pC1oZ1max7YvLn/qIdJPe
JuDeWRadNYly6Tcjykehio/Lsd5FJI52TBetZZ/SMuY6ib3EB8JPLrjjBpAxcXFZ
n9vZduC7rPEsS5YWtdWtUebR6uPZg4eYNUc2er1GG3Z0beMCwKtB6lM7/NxBd0Pt
JG+JekxKxTQxZOAaL88oOJ8wpiQMh0/BP8yHMimnOY7YwPKJYjblGl5Od9lngGoY
0dLEVjmjvPjUB4qyV8m1xxI1DGWbXOmjxV8zfZzYgvj6C1BqGArzc1pKlic0CrS3
ZgvoddjzEZlSSfmndlzh9JokIxsI63vLxA6qUkLYVn0NCKKq/XecmKlhHGCOPEWD
t0FLmqjYl3p2rSrpUrcCiZXOOhjCKo5ae2NHlfT6aDJDR930i1QFROYZdSWi8L7y
/nqnlKdQOQuP7dI+cndZTAf4WvHS095TE/rsveKlkMhVpo+V4UbWse6q5xTrzU3X
CYJkggpmzhwiRF+GEscnCcY2uCIxn8cteShpWmlYjJmZZ1AofaFC8b/ChKutrPJP
SuxuINXgjhE=
=tsHB
-----END PGP SIGNATURE-----

