From: Leo Comerford <lrc1@st-andrews.ac.uk>
Subject: Re: File as a directory - file-as-dir vs. link-dirs (again) - 3/3
Date: Fri, 23 Dec 2005 05:59:06 +0000
Message-ID: <ff8010840512222158m5e92c018q83033d1c424fd919@mail.gmail.com>
References: <ff8010840511171942x2ae2ebd0m954209103da18740@mail.gmail.com>
	 <878xvlqqhv.fsf@evinrude.uhoreg.ca>
	 <ff8010840511192303o7c581368o119b68d78b2fe722@mail.gmail.com>
	 <873blqtsf5.fsf@evinrude.uhoreg.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-27492-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: leocomerford@gmail.com
In-Reply-To: <873blqtsf5.fsf@evinrude.uhoreg.ca>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hubert Chan <hubert@uhoreg.ca>
Cc: reiserfs-list@namesys.com, "Alexander G. M. Smith" <agmsmith@rogers.com>

On 11/21/05, Hubert Chan <hubert@uhoreg.ca> wrote:

[snip]

>
> As a completely different side issue, I think that using random names
> such as "aardvark" or "zebra" to refer to tuples is a bad idea (and I
> know this isn't part of your proposal).  If you use things that are real
> words, people will get confused, since they will try to associate
> meaning to something that doesn't have meaning.  (e.g. "why is my
> relationship called "dodo", while Bob's is called "tiger"?)  I think
> that it's best to just assign random meaningless strings, so that people
> will know that they are meaningless.
>

(This addresses the issue with last "name"-segments of
link-directories which I said in part 3 that I'd get back to.)

Meaningless "name" segments are annoying to those who know or guess
that they're meaningless. Worse, they're misleading to those people
and programs that don't. (After all, they amount to making up spurious
information.) The ideal solution is to throw them away completely:
having anonymous final segments allows two non-directory files having
the predicates '/foo/aardvark' and '/foo/zebra' to both simply be
'/foo'. It has some slightly weird effects, though; for example, when
'/foo/aardvark:bar' and '/foo/zebra:bar' both become '/foo/:bar', what
happens to

cd /foo/:bar

? One solution is to dynamically generate filler text for anonymous
final segments whenever text is necessary (in a POSIX legacy
interface, for example), based on the linked file's inode and that of
the volume; the format of the filler text should allow programs (and
humans) to detect it as such when they can't find out some other,
out-of-band, way.

[snip]

Leo.
--
Leo Richard Comerford - http://www.st-and.ac.uk/~lrc1 - accept no namesakes=
 :)
