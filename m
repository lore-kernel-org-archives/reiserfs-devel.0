From: Gerrit Hannaert <degerrit@web.de>
Subject: Re: Status of reiserfs in Redhat 2.4.7-10 kernel ?
Date: Wed, 16 Apr 2003 21:55:51 +0200
Message-ID: <3E9DB547.4030109@web.de>
References: <Pine.NEB.4.44.0304151610230.25702-100000@slick.sigje.org>	 <3E9D0744.9090907@namesys.com> <1050499043.10791.137.camel@tiny.suse.com> <3E9D7DA6.8040507@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13689-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E9D7DA6.8040507@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

Hans Reiser wrote:

> Test suites cannot compete with real users.  Marcelo gets lots of real
> users before he releases a final version, and the distros don't. 
> However, I would also add that a conservative person would wait until
> a few weeks after Marcelo releases, and confirm that it really was
> stable according to those on the linux kernel mailing list.

I think there is something to be said for test suites *and* for testing
by a good number of users, and new kernels should probably get a good
dose of both before running on any production system. You should
probably get as much testing as you can get, and excluding test suites
doesn't sound like a good idea to me - which may not be what Hans meant,
though ;-).

That said, I would really like the vendors' and 'vanilla' kernels to
converge a lot more than they do now... I don't like the idea that some
differences in the source trees have more 'historic' motivations than
being new features or bugfixes (just a hunch). Personally I've been
switching back and forth between vendor and patched 'vanilla' kernels
for the last few years...

- Gerrit

