From: Domenico Andreoli <cavok@tiscali.it>
Subject: Re: reiser4progs 0.5.4 for Debian
Date: Wed, 9 Jun 2004 23:50:21 +0200
Sender: Domenico Andreoli <cavok@libero.it>
Message-ID: <20040609215021.GA10925@raptus.homelinux.org>
References: <20040603194120.GD4990@nysv.org> <20040607193305.GA4854@raptus.homelinux.org> <20040607200203.GL4990@nysv.org> <ca4168$342$1@sea.gmane.org> <20040608184559.GM4990@nysv.org> <871xkppire.fsf@uhoreg.ca> <40C6881E.9020806@namesys.com> <87pt88mpta.fsf@uhoreg.ca>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19123-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <87pt88mpta.fsf@uhoreg.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Wed, Jun 09, 2004 at 04:36:33PM -0400, Hubert Chan wrote:
> >>>>> "Hans" == Hans Reiser <reiser@namesys.com> writes:
> 
> Hans> I haven't gotten around to updating the license.  I will, after
> Hans> dealing with some other things first....
> 
> Thanks.  I can't speak on behalf of the Debian maintainer, but I'm sure
> that he will respect any (reasonable) requests that you make.  Debian
> people tend to be reasonable nice people -- with a few exceptions.

i never thanked Hans for licensing future releases of reiserfs/reiser4
tools under plain GPL, i'm doing it now. i'm appreciating it a lot,
having stuff in main archive always makes things a lot easier.

sadly if the request is to make reiser4 available in the installer of
sarge, i can't assure it will be followed :((

this is partially my fault, i never studied the installation stuff and
currently i'm not able to push reiser4 in there. this can be a matter of
few days of work, but i can't promise anything. recently i have not too
much time for debian, fortunately my packages are in pretty good shape
(i'll shoot to the first one talking about curl...;) ).

what's not my fault is the missing support for grub, something i've
never been able to make work. this is required to have reiser4 in the
sarge installer, otherwise machine will not boot after the install.

when i asked to the installer team [0] if it was reasonaible to include
reiser4 i was told it is probably too young. something can be still
done anyway, i'll work on it.

what i can surely do as sign of my gratefulness towards Hans is to
maintain an apt source for sarge that will always provide the most
recent versions of all the reiserfs/reiser4 tools. if reiser4 does not
enter in the sarge installer i'll provide also an alternative way to
install a sarge system on a reiser4 partition. sarge will always have
the best support for reiserfs/reiser4 i can provide.

the only thing i can't guarantee is a strict timetable, i make this
works in my free time.

cheers
domenico

[0] http://lists.debian.org/debian-boot/2004/06/msg00414.html

-----[ Domenico Andreoli, aka cavok
 --[ http://people.debian.org/~cavok/gpgkey.asc
   ---[ 3A0F 2F80 F79C 678A 8936  4FEE 0677 9033 A20E BC50
