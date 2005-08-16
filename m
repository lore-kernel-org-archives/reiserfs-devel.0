From: David Masover <ninja@slaphack.com>
Subject: Re: where is the journal kept?
Date: Tue, 16 Aug 2005 17:30:12 -0500
Message-ID: <430268F4.8020100@slaphack.com>
References: <20050815115310.GA28630@tranquility.scriptkitchen.com>	 <20050815125025.GA29390@tranquility.scriptkitchen.com>	 <43009184.2080201@namesys.com> <200508150812.40382.pat@patdouble.com>	 <4300A603.2050602@namesys.com>	 <d9a6586e05081509195017d679@mail.gmail.com>	 <4300D240.7010109@namesys.com>	 <d9a6586e0508151108431fabba@mail.gmail.com>	 <4302458E.9070604@namesys.com> <d9a6586e05081613275071c00a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25528-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <d9a6586e05081613275071c00a@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shawn Rutledge <shawn.t.rutledge@gmail.com>
Cc: Hans Reiser <reiser@namesys.com>, "Vladimir V. Saveliev" <vs@namesys.com>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Shawn Rutledge wrote:
> On 8/16/05, Hans Reiser <reiser@namesys.com> wrote:
> 
>>Reiser4 does a very nice job of packing the tree tightly, which is
>>independent of seeks.  Ditto for compression plugin.
>>He merely needs to ignore some code, he is not harmed by it.  If he
>>wants to write a new block allocator, sure, why not, we have allocator
>>plugins yes?   His will just be simpler.....
> 
> 
> But the most important thing is to reduce the number of writes as low
> as possible.

Something Reiser4 does very well.  If you have enough RAM, it's possible
to avoid any reads/writes at all -- given enough RAM, it behaves as a
ramdisk, which is why I wish I knew how to tell Gentoo to *not* mount
tmpfs over /dev.

One other thing you might try is disabling the write-twice behavior.
Currently, if you've got a huge, fairly well-sorted file that you're
making lots of tiny writes to, such as a database, it makes sense to
write twice to keep the file from getting fragmented.  But,
fragmentation isn't nearly as much an issue on truly random-access
media, so you'd want the default small-file behavior to be used
everywhere -- first write the data to the new location, then atomically
update the pointer to it as you deallocate the old location.

Am I right about this?  I'm not feeling very lucid today...
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQwJo9HgHNmZLgCUhAQK92BAAk68ZQsOMyS3TTKmu3//gkC+/RHzrNXey
UR2YxH+FdC7BDR3Py2Mmot3F7Ch5ykdT3gRzbMQ3vTQoRDlcmIVOuQ4VqfJ4vN2a
CVWVxc0X38fF7QVMoHnlwX6mRlr7PTd64BZEmYJ8cdDkPmAUrlCe0/+vLmorc2Oo
3Wwz3rtLotu+7Z4sjWvboqyXFoX8hvt0iSo+45UnQI7bNwdbWCpFZBTsbU9SsI4J
NnplO/IG1d5jQq+Vdmo7lL0XB+Zv71s9u0l/QNe5eahLNUfzghrTVTZSpJT/+h3b
xSPMy2xVurG7p2jp3Rg8sN0YMiAGaQtVr9yhvcinZnmVOY9HK272Epihg3eUHYIX
LiKkCLblLaUiwJs6DKSCoCsF3oWELH/SsYC31R4fSWEVehObRIoU/Kz4TRtOeA0G
SakH4s+Hiju4GPTL7AKaMMi2TbeZgGg7BlZof+zC5HgQf7d2t0/sb2613X0R5agH
tQyiX7PDg+zQr4KXC8Rb3kwwcgURMcAUWw6gcJ+hTbFrLtlkvK9k1VJNmllH7j8J
aYTsz3FCgGo5a7zq4iogFt7GgnHeTJ3ErxjohK0uE3J10l68DvVa3TqaanGXdhDK
pqhfduXM+pt8FLoXuHVkp1c4VpZMzj4WWKPNOhH+FTxCVJee6ZeMckV+9AUbZkkW
ja3lcplEEMM=
=B2OX
-----END PGP SIGNATURE-----
