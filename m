From: "Sander Sweers" <sander.sweers@gmail.com>
Subject: Re: reiser4: mount -o remount,ro / causes error on reboot
Date: Mon, 11 Sep 2006 13:10:54 +0200
Message-ID: <b65fbb130609110410x146bd9f5i9cdd1f96836eaf78@mail.gmail.com>
References: <ee1gcu$dgb$1@sea.gmane.org> <45047190.2040101@slaphack.com>
	 <ee1vth$dgb$2@sea.gmane.org> <200609111130.39647.vs@namesys.com>
	 <ee3cl8$5fo$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29850-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <ee3cl8$5fo$1@sea.gmane.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Peter <sw98234@hotmail.com>
Cc: reiserfs-list@namesys.com

On 11/09/06, Peter <sw98234@hotmail.com> wrote:
[....]
> >> >> At the end of the gentoo shutdown script is a short function which
> >> >> remounts / as ro.
> >> >
> >> > There's also one in the Gentoo startup script, which attempts to remount
> >> > / ro, then remount it rw.  I commented that out, because it was causing
> >> > similar problems.  I figure if it runs sync when it shuts down, that's
> >> > good enough.
> >>
> >> The errors I note only occur on shutdown (halt.sh) not startup.

There was a bug in baselayout which caused partition (except /) not to
remount ro properly. The bug number is 131001 [1], is this your
problem?

Greets
Sander

1: http://bugs.gentoo.org/show_bug.cgi?id=131001
