From: Juan Quintela <quintela@mandrakesoft.com>
Subject: Re: when distros do not support official Marcelo kernels they are
 not being team players
Date: Tue, 04 Feb 2003 14:46:41 +0100
Message-ID: <8665s0p39a.fsf@trasno.mitica>
References: <20030130173522.3aa4d0e1.pegasus@nerv.eu.org>
	<3E397A19.60409@namesys.com> <20030130234142.E8448@vestdata.no>
	<3E3A6071.6060102@namesys.com>
	<20030131115333.GC15359@marowsky-bree.de>
	<3E3A67AE.4050601@namesys.com>
	<20030131122147.GE15359@marowsky-bree.de>
	<3E3A6D76.7080300@namesys.com> <86lm0xpmho.fsf@trasno.mitica>
	<3E3E7A95.1050908@namesys.com>
	<1044284001.15685.358.camel@tiny.suse.com>
	<3E3EBA3F.7060806@namesys.com>
	<1044300746.15684.428.camel@tiny.suse.com>
	<3E3EC7EC.8090005@namesys.com>
	<1044304857.15684.475.camel@tiny.suse.com>
	<3E3F0D5D.5070409@namesys.com>
	<1044324173.15684.503.camel@tiny.suse.com>
	<3E3F8D83.5000405@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12640-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E3F8D83.5000405@namesys.com> (Hans Reiser's message of "Tue,
 04 Feb 2003 12:53:07 +0300")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Chris Mason <mason@suse.com>, Lars Marowsky-Bree <lmb@suse.de>, Ragnar =?iso-8859-1?q?Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>, Jure Pecar <pegasus@nerv.eu.org>, reiserfs-list@namesys.com

>>>>> "hans" == Hans Reiser <reiser@namesys.com> writes:

hans> Chris Mason wrote:
>> Feel free to start the ultimate distribution where people can purchase a
>> complete set of cds that results in a coherent, stable and fast install,
>> where any component could be swapped with it's
>> generic-recompiled-from-the-net counterpart and still provide support
>> when people report bugs, all for a reasonable price.
>> 
>> 
hans> If the maintainer of the software has issued it as a stable official
hans> release, the distros should support it unless they know that
hans> particular release is at fault.

hans> It comes down to a struggle over social place.  I think it is
hans> presumptuous of distros, and harmful to the community, for them to
hans> discourage downloading the latest version by the official maintainer
hans> because of their desire that the user come to them for everything.
hans> The maintainer, not the distro, should be telling the user what to
hans> use.  If the maintainer makes mistakes, they should live with them.
hans> For the kernel, the maintainer is Marcelo.

Nope.  Life is more complicated than that.  It just happens that
sometimes for having two applications to work well together, you need
to modify one or both.  That is the labour of the distributions.  You
as user has several options:
- You use the distro version.
- Bug distro maintainer to update (it normally works, at least for the
  development versions of the distros : debian unstable, mandrake
  cooker, and I think that the other distributions have one equivalent).
- You know enough to modify maintainer version to work well with your
  distro.
- You install the maintainer version and pray that it will work with
  your distro.

In my view, 1, 2 or 3 are valid options. 4 is just inaceptable except
for learning purposes :(

Later, Juan.

-- 
In theory, practice and theory are the same, but in practice they 
are different -- Larry McVoy
