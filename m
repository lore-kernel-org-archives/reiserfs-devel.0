From: David Masover <ninja@slaphack.com>
Subject: Re: when will it end?
Date: Wed, 27 Oct 2004 01:13:16 -0500
Message-ID: <417F3C7C.2020408@slaphack.com>
References: <417EF280.10003@slaphack.com> <20041027033443.GE25932@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22192-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20041027033443.GE25932@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alex Zarochentsev <zam@namesys.com>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


| current repacker code state is 'unsupported', it is even removed from the
| latest -mm kernels.   Namesys plans are to make the repacker proprietary.

Really?

I sort of thought the priority was to get into the mainstream kernel, so
this seems an odd move.  Why do something that decreases your benchmark?
~ And how much would people be willing to pay you when most Unix
filesystems are rarely (if ever) repacked and Windows (even DOS, I
think) comes with a free repacker of its own?

The current state of the repacker suggests that the tradeoff is not
worth it.  If it takes longer than 2 days for an initial repack of a
filesystem like mine, the total amount of time I have to spend waiting
for the system while it's dog-slow and repacking is likely more than the
time I'd save by having it be slightly faster the rest of the time, or
even the time I'd have to work at minimum wage to buy more storage to
cover space the repacker could save me.

Compare this to Norton SpeedDisk, which takes about half an hour to
defrag a 20-40 gig FAT32/NTFS drive -- the first time.  After that, if
run daily, it takes 10-15 mins.

But also, is chunk_size measured in megabytes?  (mine was 512)  Does it
mean what I think it means?

If the repacker is still free next time I go on vacation, I'll try again
- -- see if a week or two will straighten things out.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQX88e3gHNmZLgCUhAQIXiQ//fnR727WKFmhkiP/9w02YhANuImptkokC
KjLVJ8LkaOtz7OHecVqrIWNP2V13FDpp/Tn5Nf+h9iDeem6wF9rw4kXM6QX2NNFk
AD5G3dYKLEMAPDkSAXYVqMv6ykI9CH61ELNHBDatfj3gBjz0uLB0kIStI6lM1nNq
Pem2FmqWcM+3SVYEvmFuN4/oBJjwWyNav7CAWt58tvBqY703BNQmsLwEQBrcMAo8
ifM07H0JRXT9qnKYCNKAbmUhInOAr8IUIN36OUTd/Wp35K3/1C6LicGyG6wDy51b
aT0y4eZd0hTRZVkG5PCJ3Naz1GA56BFIts8Kvi9JtBJeza4/y0xZAtycZjeVr7Hu
ufMjZVWgZTswiOFvNXAVFtJ6RnVDVELnKJtHI6EkFRuyJdgQKcz1oII2f//VORU0
IST7icAw1ZSSfF08dSnhpNCFVf4ZuSAz/V6VrgFup5+cerg23DGo3bZ+K5I49//3
hOVNC2wedl8hziNt2kKd7yDNU7WpaPR3PLOusrPsJi25YRAmIhXjDanwOt3XFA3c
jhlTNTApj25FqphP1oCV9PNlUR0xYJXVHCnz8Aiu9ED0Yir8ECyY8Wm9Zgs1haec
dPelzN5KioLnE5+0dLvDaYcMvewA7Vy8NwJ5z/KfcnSpD7dvH90wDE1KNbpkjZxt
nH5vzVbtgEU=
=oGZA
-----END PGP SIGNATURE-----
