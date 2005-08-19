From: Gregory Maxwell <gmaxwell@gmail.com>
Subject: Re: Basic interface for key management in reiser4 (DRAFT)
Date: Fri, 19 Aug 2005 00:18:24 -0400
Message-ID: <e692861c05081821185566955d@mail.gmail.com>
References: <43034EC4.9040906@namesys.com> <43039594.3040300@namesys.com>
	 <4304D492.5010203@namesys.com> <43052842.6050505@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25565-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43052842.6050505@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Edward Shishkin <edward@namesys.com>, Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>, Reiserfs List <reiserfs-list@namesys.com>

On 8/18/05, Hans Reiser <reiser@namesys.com> wrote:
> but the idea is to use keys instead of standard unix permissions....
>=20
> I think you need to store keys in a per process place, and allow
> specifying whether children of a process inherit the keys somehow.

Oh, slick!

I did not previously catch what the advantage would be to using crypto
in the FS rather than just a crypted block device... minus some non
critical niceties (like being able to use a random & per file IV is
good from a security perspective.).

Now I see what is possible, and I'm really excited.

It will be interesting to see how a system with many keys performs..
most fast implementations of most crypto algs need a computationally
expensive key setup which produces a fairly large working set of
constants for encryption/decryption.

With a per process structure there should be a way to revoke all
instances of a key from all the other running processes that carry
it.. or at least all processes of a specific user. Otherwise it will
be too easy to accidental leave keys laying around.

This per process crypto in the FS fits very nicely with a lot of the
other recent security advances in the Linux world.

Thanks for something new and exciting to talk about with my Linux
using friends! :)
