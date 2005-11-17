From: prj@po.cwru.edu (Paul Jarc)
Subject: Re: need opinions from sysadmins on where reiser4progs should install
Date: Thu, 17 Nov 2005 01:01:22 -0500
Message-ID: <m37jb7olrr.fsf@multivac.cwru.edu>
References: <4376E891.6070506@namesys.com> <43777B17.7010801@linspire.com>
	<437C0D7C.6090502@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-26971-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <437C0D7C.6090502@namesys.com> (Hans Reiser's message of "Wed, 16
	Nov 2005 20:56:28 -0800")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Clifford Beshers <clifford.beshers@linspire.com>, ReiserFS List <reiserfs-list@namesys.com>

Hans Reiser <reiser@namesys.com> wrote:
> Clifford Beshers wrote:
>> http://www.pathname.com/fhs/pub/fhs-2.3.html#SBINSYSTEMBINARIES
>
> well, this says /sbin as I read it.  Thanks for the URL Clifford!

The FHS doesn't specify what the default installation prefix for a
source tarball should be.  That section says that distributions should
install certain things in /sbin or /usr/sbin, and that admins who
install similar things independently of the distribution should use
/usr/local/sbin.  Obviously that doesn't work in some cases, but that
is what the FHS says: distributions and admins should choose those
respective locations, regardless of the package's default.

Since distributions' installations are typically automated and so can
easily specify a non-default prefix, source tarballs generally default
to /usr/local for the admins.  As a result, admins will expect the
default to be /usr/local, and they know how to use --prefix=/ if
that's what they want.  The principles of least surprise and least
damage suggest that the default for reiser4progs should be /usr/local,
just like every other package, *even if that means the default will
rarely be used*.

For myself, I only care that an explicit --prefix is used for every
installed file, since I install to a different directory anyway.


paul
