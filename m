From: Juan Quintela <quintela@mandrakesoft.com>
Subject: Re: reiserfs on redhat advanced server?
Date: Mon, 03 Feb 2003 13:38:59 +0100
Message-ID: <86lm0xpmho.fsf@trasno.mitica>
References: <20030130173522.3aa4d0e1.pegasus@nerv.eu.org>
	<3E397A19.60409@namesys.com> <20030130234142.E8448@vestdata.no>
	<3E3A6071.6060102@namesys.com>
	<20030131115333.GC15359@marowsky-bree.de>
	<3E3A67AE.4050601@namesys.com>
	<20030131122147.GE15359@marowsky-bree.de>
	<3E3A6D76.7080300@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12612-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E3A6D76.7080300@namesys.com> (Hans Reiser's message of "Fri,
 31 Jan 2003 15:35:02 +0300")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Lars Marowsky-Bree <lmb@suse.de>, Ragnar =?iso-8859-1?q?Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>, Jure Pecar <pegasus@nerv.eu.org>, reiserfs-list@namesys.com

>>>>> "hans" == Hans Reiser <reiser@namesys.com> writes:

hans> I understand and support being pissed at Linus for calling it 2.4.0
hans> when it wasn't stable enough before 2.4.18 because VM and VFS were
hans> still being changed, but Marcelo is pretty stable in all of his
hans> official releases, and it is easy to get him to take good code.

But it is not possible to get Marcelo to adapt his release schedule to
the distro's release schedule :p That is one of the BIG problems.  If
when your release is about to freeze, marcelo kernel is in pre5/pre6
what do you do:

- bet that final kernel will be there by the end of the distro release
  and switch.  And in the proccess, invalidate all the testing that
  you have done so far.

- get the old known stable kernel, and adapt all the bugfixes that you
  found in the pre series?

What strategy do you think that is better?  If you bet (as almost
everybody) that second one is better, you are going to have a heavily
patched kernel.

And that is without taking into account that a lot of the bug fixes
that go to marcelo kernel go the route:

- user find bug
- user blame distro kernel
- distro kernel team found the problem (sometimes with cooperation
  with the subsystem maintainer)
- distro kernel team send the patch to subsystem maintainer
- subsytem maintainer send the patch to marcelo (perhaps after some
  local modification)

hans> I am not really opposed to vendors shipping their own kernels and
hans> supporting them, but I am opposed to them not supporting an official
hans> stable Marcelo kernel unless they have a specific reason not to.  The
hans> Marcelo kernels need to be considered the official supported ones by
hans> the entire community, regardless of what other ones might also be
hans> supported by parts of the community.

Believe me, if it will be possible (not indeed easy) to get that done,
my life will be much, much better :p

Later, Juan.

-- 
In theory, practice and theory are the same, but in practice they 
are different -- Larry McVoy
