From: Hans Reiser <reiser@namesys.com>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org
Date: Tue, 15 Aug 2006 21:23:53 -0700
Message-ID: <44E29DD9.7030302@namesys.com>
References: <BAY19-F195F80B4801CAB6EEB6C46944F0@phx.gbl>	 <44E24563.1040900@namesys.com> <e692861c0608151814x3e704156j32c2b34b8637a943@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29613-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <e692861c0608151814x3e704156j32c2b34b8637a943@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Gregory Maxwell <gmaxwell@gmail.com>
Cc: Edward Shishkin <edward@namesys.com>, Tom Reinhart <rhino_tom@hotmail.com>, reiserfs-list@namesys.com

I am skeptical that bitflip errors above the storage layer are as common
as the ZFS authors say, and their statistics that I have seen somehow
lack a lot of detail about how they were gathered.  If, say, a device
with 100 errors counts as 100 instances for their statistics.....  Well,
it would be nice to know how they were gathered.  Next time I meet them
I must ask.

That said, if users want it, there should be a plugin that checks the bits.

I agree that stripe awareness and the need to signal the underlying raid
that a block needs to be recovered is important.  Checksumming at the fs
level seems like a reasonable plugin.

I have no opinion on the computational cost of ECC vs. checksums, I will
trust that you are correct.
