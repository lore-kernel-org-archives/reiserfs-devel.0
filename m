From: Hans Reiser <reiser@namesys.com>
Subject: Re: tuning a fs for large number of small files
Date: Sun, 10 Nov 2002 12:57:52 -0800
Message-ID: <3DCEC850.5080906@namesys.com>
References: <Pine.LNX.4.44.0211061711290.2873-100000@gamay.kronodoc.fi> <1036602970.13296.254.camel@mikeb.staff.netnation.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11957-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.44.0211061711290.2873-100000@gamay.kronodoc.fi>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Mike Benoit <mikeb@netnation.com>
Cc: Marko Asplund <aspa@kronodoc.fi>, reiserfs-list@namesys.com

Mike Benoit wrote:

>On Wed, 2002-11-06 at 07:25, Marko Asplund wrote:
> =20
>
>>On Wed, 6 Nov 2002, Ragnar Kj=F8rstad wrote:
>>
>>   =20
>>
>>>...
>>>If you have the chance you can tar together all the files, and extract
>>>them again. This will help in two ways:
>>>- reduce fragmentation
>>>- write files to the filesystem in reiserfs-optimal order.
>>>  If you create the files in the increasing hash-order access will
>>>  typlicly be much faster. If you create a tar of the files from a
>>>  reiserfs-filesystem (with the same hash) you will accomplish just
>>>  that.
>>>     =20
>>>
>>i was thinking about using something like the following method for=20
>>migrating the files to the new filesystem:
>>tar clf - /mnt/oldext3fs | tar xf -
>>
>>this should reduce fragmentation but will it write the files in
>>filesreiserfs-optimal order?
>>
>>   =20
>>
>>>What hash-function to use doesn't really matter unless you have a lot of
>>>files in a single directory. Do you have that? Is there any typlical
>>>"pattern" for the filenames, and the order they are created in?
>>>     =20
>>>
>>there shouldn't be particularly many files in a single directory. the
>>filesystem is actually a hierarchy "database" for our backup system
>>(Arkeia) and it replicates the filesystem trees of the machines being
>>backed up. i can't come up with a typical file naming or creation order
>>patterns. most of the directory hierarchies are quite static except for
>>the home directories perhaps.
>>
>>   =20
>>
>
>Speak of the devil. (Arkeia) We have a similar setup to what you
>described, our Arkeia server handles about 1TB of data per full backup,
>consisting of over 25 million files. We keep the Arkeia database on
>reiserfs 3.x using these mount options:=20
>
>defaults,noatime,notail,nodiratime
>
>Though reiserfs handles all the small files without a problem, we found
>that hacking the kernel to disable fdatasync was the only way to get
>decent speeds from Arkeia. Beware though, Arkeia does like to crash
>often, so this usually means more database restores (like I'm doing
>right now), but our backup just wouldn't fit in the window otherwise.=20
>
>Regardless, Arkeia just can't handle our load well at all, it's database
>is just way to inefficient and there support is terrible at best.
>Honestly I wouldn't recommend Arkeia to my worst enemy if they need to
>backup more then a few gigs.
>
> =20
>
copy your data twice, once to reiserfs, and then again to reiserfs.=20
 This will cause objectids to be assigned in reiser3 readdir() sorted=20
order (ext3 does not sort).

