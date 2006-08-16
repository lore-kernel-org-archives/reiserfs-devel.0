From: "Gregory Maxwell" <gmaxwell@gmail.com>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org
Date: Tue, 15 Aug 2006 21:14:04 -0400
Message-ID: <e692861c0608151814x3e704156j32c2b34b8637a943@mail.gmail.com>
References: <BAY19-F195F80B4801CAB6EEB6C46944F0@phx.gbl>
	 <44E24563.1040900@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29609-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44E24563.1040900@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Edward Shishkin <edward@namesys.com>
Cc: Tom Reinhart <rhino_tom@hotmail.com>, reiserfs-list@namesys.com

On 8/15/06, Edward Shishkin <edward@namesys.com> wrote:
> checksumming is _not_ much more easy then ecc-ing from implementation
> standpoint, however it would be nice, if some part of errors will get
> fixed without massive surgery performed by fsck

We need checksumming even with eccing... ECCing on large spans of data
is too computationally costly to do unless we know something is wrong
(via a checksum).

Lets pause for a minute, when you talk about ECC what are you actually
talking about?   If you're talking about a hamming code (used on ram,
http://en.wikipedia.org/wiki/Hamming_code) or Convolutional code (used
on telecom links, http://en.wikipedia.org/wiki/Convolutional_code) or
are you talking about an erasure code like RS coding
(http://en.wikipedia.org/wiki/Reed-Solomon_code)?

I assume in the discussions that you're not talking about an RS like
code... because RAID-5 and RAID-6 are, fundamentally, a form of RS
coding. They don't solve bit errors, but when you know you've lost a
block of data they can recover it.

Non-RS forms of ECC are very slow in software (esp decoding) .. and
really aren't that useful: most of the time HDD's will lose data in
nice big chunks that erasure codes handle well but other codes do not.

The challenge with erasure codes is that you must know that a block is
bad... most of the times the drives will tell you, but some times
corruption leaks through. This is where block level checksums come
into play... they allow you to detect bad blocks and then your erasure
code allows you to recover the data.   The checksum must be fast
because you must perform it on every read from disk... this makes ECC
unsuitable, because although it could detect errors, it is too slow.
Also, the number of additional errors ECC could fix are very small..
It would simply be better to store more erasure code blocks.

An optimal RS codes which allows one block of N to fail (and require
one block extra storage)  is computationally trivial. We call it
raid-5.  If your 'threat model' is bad sectors rather than bad disks
(an increasingly realistic shift) then N needs to have nothing to do
with the number of disks you have and can be instead related to how
much protection you want on a file.

If 1:N isn't enough for you, RS can be generalized to any number of
redundant blocks. Unfortunately, doing so requires modular aritmetic
which current CPUs are not too impressively fast at. However, the
Linux Raid-6 code demonstrates that two part parity can be done quite
quickly in software.

As such, I think 'ecc' is useless.. checksums are useful because they
are cheap and allow us to use cheap erasure coding (which could be in
a lower levle raid driver, or implemented in the FS) to achieve data
integrity.

The question of including error coding in the FS or in a lower level
is, as far as I'm concerned, so clear a matter that it is hardly worth
discussing anymore.  In my view it is absolutely idiotic to place
redundancy in a lower level.

The advantage of placing redundancy in a lower level is code
simplicity and sharing.

The problem with doing so, however, is many fold.

The redundancy requirements for various parts of the file system
differ dramatically, without tight FS integration matching the need to
the service is nearly impossible.

The most important reason, however, is performance.  Raid-5 (and
raid-6) suffer a tremendous performance hit because of the requirement
to write a full stripe OR execute a read modify write cycle.  With FS
integrated erasure codes it is possible to adjust the layout of the
written blocks to ensure that every write is a full stripe write,
effectively you adjust the stripe width with every write to ensure
that the write always spans all the disks.  Alternatively you can
reduce the number of stripe chunks  (i.e. number of disks) in the
parity computation to make the write fit (although doing so wastes
space)...

FS redundancy integration also solves the layout problem. From my
experience most systems with hardware raid are getting far below
optimal performance because even when their FS is smart enough to do
file allocation in a raid aware way (XFS and to a lesser extent
EXT2/3) this is usually foiled by the partition table at the beginning
of the raid device. Resulting in 1:N FS blocks actually spanning two
disks! (thus reading that block incurres potentially 2x disk latency).

Seperated FS and redundancy layers are an antiquated concept.. The
FS's job is to provide reliable storage, fully stop.  It's shocking to
see that a dinosaur like SUN has figured this out but the free
software community still fights against it.
