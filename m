From: Islam Amer <pharon@gmail.com>
Subject: Re: iosched (was Re: Full of surprises - A reiser4 story from userland)
Date: Wed, 28 Sep 2005 23:38:48 +0300
Message-ID: <5d8b7b9050928133842241311@mail.gmail.com>
References: <1127914812.12894.96.camel@laptop>
	 <200509281825.49873.vitaly@namesys.com>
	 <1127921286.12894.106.camel@laptop> <433ABD7B.1010903@slaphack.com>
	 <1127932340.12894.149.camel@laptop>
	 <5d8b7b90509281213c95e30c@mail.gmail.com>
	 <200509281952.j8SJq9Uo007371@turing-police.cc.vt.edu>
	 <433AFDF6.3070404@namesys.com>
Reply-To: Islam Amer <pharon@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26321-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <433AFDF6.3070404@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Valdis.Kletnieks@vt.edu, Fionn Behrens <fionn@spamfilter.de>, reiserfs-list@namesys.com

On 9/28/05, Hans Reiser <reiser@namesys.com> wrote:
>  Check out the latest cfq in the latest kernel, it is much better than
> the others for most applications.  Anticipatory used to be the best, but
> cfq-3 is better now.
>
Yes I always had my eyes on the applicable parts of -ck patchset
becasue they showed good promise ( upto my limited understading ). I
just needed an educated opinion. Thanks.

And  I had to drop using the genetic-as because it oopsed with
reiserfs in some kernels.

Problem is lots of experimental patches in -mm series hurt throughput
and performance and reiser4 users have to suffer. Otherwise we have to
go through the slightly non-trivial procedure of patching the vanilla
kernel.
