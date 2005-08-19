From: Gregory Maxwell <gmaxwell@gmail.com>
Subject: Re: Basic interface for key management in reiser4 (DRAFT)
Date: Fri, 19 Aug 2005 10:48:40 -0400
Message-ID: <e692861c0508190748132ceb1d@mail.gmail.com>
References: <43034EC4.9040906@namesys.com> <43039594.3040300@namesys.com>
	 <4304D492.5010203@namesys.com> <43052842.6050505@namesys.com>
	 <e692861c05081821185566955d@mail.gmail.com>
	 <4305C5E5.7000308@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25573-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4305C5E5.7000308@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward@namesys.com>
Cc: Hans Reiser <reiser@namesys.com>, Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>, Reiserfs List <reiserfs-list@namesys.com>

On 8/19/05, Edward Shishkin <edward@namesys.com> wrote:
> Actually it is critical:
> http://marc.theaimsgroup.com/?l=3Dlinux-kernel&m=3D107719798631935&w=3D2
> But why random? It is slowly.. I would prefer object-id-based one..

The IV doesn't need to be random, but it should be different for every
instance of a file, different every time a file is deleted and
recreated, not increment in any predictable way between files, and be
impossible to control by a user. It should have a low possibility of
reuse.

Earlier linux DM crypt had a weakness where the IV incremented with
every block in the file system, this lead to some interesting
watermarking attacks. It was possible to form a stream of data with
changes that negated the XORs from the trivially incremented IV, and
thus the first block of each sector could be used to form an
electronic code book. This has since been corrected with a couple of
options (one is to use the cryptographic hash of the block number).

If the user has some way of trivially influencing differences in the
object ID, for example sequential files have sequential object id,
then the object ID should be passed through a hash function so that a
user must know the full object iD in order to predict even a single
bitflip.
