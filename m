From: Gregory Maxwell <gmaxwell@gmail.com>
Subject: Re: Will I need to re-format my partition for using the compression plugin?
Date: Thu, 22 Sep 2005 16:54:38 -0400
Message-ID: <e692861c0509221354127bd13e@mail.gmail.com>
References: <194f625505092006316ad200b5@mail.gmail.com>
	 <2f4958ff05092208244a0496fc@mail.gmail.com>
	 <4332DE9F.8010808@namesys.com>
	 <200509221951.38302.namesys.Sch@ttgen.net>
	 <43330E14.9050209@namesys.com>
Reply-To: Gregory Maxwell <gmaxwell@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26245-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43330E14.9050209@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward@namesys.com>
Cc: Fred Schaettgen <namesys.Sch@ttgen.net>, reiserfs-list@namesys.com

On 9/22/05, Edward Shishkin <edward@namesys.com> wrote:
> Yes. It is impossible to implement all features in one file plugin.
> Checksuming means a low
> performance: in order to read some bytes of such file you will need
> first to read the whole file
> to check a checksum (isnt it?). So it will be suitable for a small
> number of special files.
> To write this new file plugin you will want to use already existing
> cipher and compression
> transform plugins (dont mix it with cryptcompress file plugin which also
> calls those plugins)
> to compress and encrypt your checksumed file.

For file data integrity it would actually be more useful to have a per
block hash or checksum. This solves the update problem.  It would be
useful if the file offset and some file identifier were also mixed
into the calculation so that a misplaced block will fail as well. This
would fit quite nicely into the existing actions of the cryptocompress
plugin, and could be accomplished as just another compression algo..
one that always adds the 64-256 bits of check data per block.. At
least as long as the error handling in the FS is robust enough to be
able to treat a decompression failure as an IO error.  ...

If it were desirable to produce a cryptographically strong checksum
which can be handed to the user, what you would do is perform a hash
per block, and store that with each block, then a hash of the hashes
which is returned to the user. This is called a tree hash (google it),
usually you have a deeper hierarchy than two, depends on the
application. This makes incremental updates cheap enough (just hash
the block, then ripple the changes up the tree).  This would remove
the ability to include the file id and offsets directly in the hash,
but i would argue that they should still be used: for example you
could xor the hash value with them before writing it to disk and on
reading it from disk. This would still allow you to detect a misplaced
block but would not make the tree value differ for multiple copies of
the same file.
