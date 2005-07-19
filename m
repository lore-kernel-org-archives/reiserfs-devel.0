From: Ragnar =?iso-8859-15?Q?Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>
Subject: Re: Fastest way to "find / -mtime +7".....
Date: Tue, 19 Jul 2005 22:09:02 +0200
Message-ID: <20050719200902.GM1508@vestdata.no>
References: <FD5AA849-D432-4881-B70F-E71369520749@surfcity.net> <1121798933.15596.13.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25203-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1121798933.15596.13.camel@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jonathan Briggs <jbriggs@esoft.com>
Cc: Ed Walker <ewalker@surfcity.net>, reiserfs-list@namesys.com

On Tue, Jul 19, 2005 at 12:48:53PM -0600, Jonathan Briggs wrote:
> > this is pretty slow on reiser, at least compared with ext2/3, and I =20
> > understand that it may be because the find command returns the names =20
> > in a non-optimal order (ie readdir order?).
>=20
> I think Reiser3 is slow more because with mtime, find has to stat each
> file.=20

The two issues are related.

Readdir will return the filenames in hash order. Find will then go and
stat each file, still in hash order.

Problem is, the inodes are not sorted in directory hash order on the
disk. They tend to be in approximate creation order. So, the disk access
pattern is nearly random access, meaning every stat is likely to touch a
new block and readahead is completely useless.



I once wrote a new hash for reiserfs3 specifically for maildir. This
hash caused files to be order in approximate creating order, matching
the inode order much closer.=20


You will find both the patch and some benchmark results if you search
the archive (messageid 20010628030201.E380@vestdata.no), but speeded up
my testcase by a factor of 6. (My testcase read all the data too though.
I don't think I ever tested just "find . -ls")


In reiserfs3 the usefullness of the hash is limited as hashes are per
filesystem settings. (So it is only useful if you have a dedicated
maildir filesystem). I've lost track of reiserfs4 features - maybe you
can select hashes per directory now? Or maybe the whole thing is made
obsolete by putting the inodes with the directoryentries?




--=20
Ragnar Kj=F8rstad
Software Engineer
Scali - http://www.scali.com
Scaling the Linux Datacenter
