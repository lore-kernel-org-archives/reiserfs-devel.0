From: Gregory Maxwell <gmaxwell@gmail.com>
Subject: Re: Plugin for corruption resistance?
Date: Fri, 18 Feb 2005 08:36:51 -0500
Message-ID: <e692861c0502180536270fcee2@mail.gmail.com>
References: <e692861c05021110583585f84e@mail.gmail.com>
	 <loom.20050215T213823-62@post.gmane.org>
	 <42141928.7080608@slaphack.com>
	 <200502171153.43403.chrivers@iversen-net.dk>
	 <4215644C.4000602@slaphack.com>
	 <200502180428.j1I4S92I019716@turing-police.cc.vt.edu>
Reply-To: Gregory Maxwell <gmaxwell@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200502180428.j1I4S92I019716@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Valdis.Kletnieks@vt.edu" <Valdis.Kletnieks@vt.edu>
Cc: reiserfs-list@namesys.com

On Thu, 17 Feb 2005 23:28:09 -0500, Valdis.Kletnieks@vt.edu
<Valdis.Kletnieks@vt.edu> wrote:
> On the flip side, hash functions like MD5 or the SHA family are fairly bulletproof,
> but are essentially impossible to develop an incremental update for (if there
> existed a fast incremental update for the hash function, that would imply a
> very low preimage resistance, rendering it useless as a cryptographic hash).

Tree hashes.
Divide the file into blocks of N bytes. Compute size/N hashes. 
Group hashes into pairs. Compute N/2 N' hashes, this is fast because
hashes are small. Group N' hashes into pairs compute N'/2 N'' hashes
etc.. Reduce to a single hash.

A number of useful tradeoffs are possible: By enlarging N you improve
the strength along various cryptographic dimensions.  By changing the
fanout, and deciding how many N your store, which N you store, which
N' you store, etc you decide how easy it is to update the hash and you
decide what the smallest increment you can test is... you trade off
storage (and a little computation) for this ease.

> Also, there's another issue - unlike standard ECC codes that can actually *fix*
> the problem (for at least small number of bit errors), it's unclear what you should
> do if you find a mismatch between the hash of a block and the block contents, as
> you don't know whether it's the actual data or the hash that's corrupted....

In my initial suggestion I offered that hashes could be verified by a
userspace daemon, or by fsck (since it's an expensive operation)...
Such policy could be controlled in the daemon.
In most cases I'd like it to make the file inaccessible until I go and
fix it by hand.

It would also be useful to have the checker daemon watch the logs (or
recieve notifications through some kernel interface)... and any block
level errors (or smartd errors) backprojected up (through raid and lvm
remappings) to the file system level ... After identifying the
potentially corrupted file, it could then test the file.  If the file
has been corrupted, the configured action is taken.

If this policy is in userspace, the level of action sopication could
be very high: for example, if I was on a distribution with package
management, and the file was outside of /home, and the package flags
didn't indicate it was a config file.. then go fetch the package, and
replace the file and send me an email so I don't forget how wonderful
my OS is. :)
