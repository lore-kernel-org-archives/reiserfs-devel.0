From: Marko Asplund <aspa@kronodoc.fi>
Subject: Re: tuning a fs for large number of small files
Date: Wed, 6 Nov 2002 17:25:29 +0200 (EET)
Message-ID: <Pine.LNX.4.44.0211061711290.2873-100000@gamay.kronodoc.fi>
References: <20021106160733.T23227@vestdata.no>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11932-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021106160733.T23227@vestdata.no>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: reiserfs-list@namesys.com
Cc: =?ISO-8859-1?Q?Ragnar_Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>

On Wed, 6 Nov 2002, Ragnar Kj=F8rstad wrote:

> ...
> If you have the chance you can tar together all the files, and extract
> them again. This will help in two ways:
> - reduce fragmentation
> - write files to the filesystem in reiserfs-optimal order.
>   If you create the files in the increasing hash-order access will
>   typlicly be much faster. If you create a tar of the files from a
>   reiserfs-filesystem (with the same hash) you will accomplish just
>   that.

i was thinking about using something like the following method for=20
migrating the files to the new filesystem:
tar clf - /mnt/oldext3fs | tar xf -

this should reduce fragmentation but will it write the files in
filesreiserfs-optimal order?

> What hash-function to use doesn't really matter unless you have a lot of
> files in a single directory. Do you have that? Is there any typlical
> "pattern" for the filenames, and the order they are created in?

there shouldn't be particularly many files in a single directory. the
filesystem is actually a hierarchy "database" for our backup system
(Arkeia) and it replicates the filesystem trees of the machines being
backed up. i can't come up with a typical file naming or creation order
patterns. most of the directory hierarchies are quite static except for
the home directories perhaps.

best regards,
--=20
	aspa

