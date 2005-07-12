From: Neil Brown <neilb@cse.unsw.edu.au>
Subject: Re: reiser4 plugins
Date: Tue, 12 Jul 2005 17:19:40 +1000
Message-ID: <17107.28428.30907.184223@cse.unsw.edu.au>
References: <hubert@uhoreg.ca>
	<200506290509.j5T595I6010576@laptop11.inf.utfsm.cl>
	<87hdfgvqvl.fsf@evinrude.uhoreg.ca>
	<8783be6605062914341bcff7cb@mail.gmail.com>
	<878y0svj1h.fsf@evinrude.uhoreg.ca>
	<42C4F97B.1080803@slaphack.com>
	<87ll4lynky.fsf@evinrude.uhoreg.ca>
	<42CB0328.3070706@namesys.com>
	<42CB07EB.4000605@slaphack.com>
	<42CB0ED7.8070501@namesys.com>
	<42CB1128.6000000@slaphack.com>
	<42CB1C20.3030204@namesys.com>
	<42CB22A6.40306@namesys.com>
	<42CBE426.9080106@slaphack.com>
	<42D1F06C.9010905@stesmi.com>
	<42D2DB99.9050307@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25103-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: message from David Masover on Monday July 11
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>
Cc: Stefan Smietanowski <stesmi@stesmi.com>, Hans Reiser <reiser@namesys.com>, Hubert Chan <hubert@uhoreg.ca>, Ross Biro <ross.biro@gmail.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, Kyle Moffett <mrmacman_g4@mac.com>, Valdis.Kletnieks@vt.edu, Lincoln Dale <ltd@cisco.com>, Gregory Maxwell <gmaxwell@gmail.com>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>, Alexander Zarochentcev <zam@namesys.com>, vs <vs@thebsh.namesys.com>, Nate Diller <ndiller@namesys.com>

On Monday July 11, ninja@slaphack.com wrote:
> Stefan Smietanowski wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> > 
> > 
> >>Ok, still haven't heard much discussion of metafs vs file-as-directory,
> >>but it seems like it'd be easier in metafs.
> > 
> > 
> > Why not implement it inside the directory containg the file ?
> > 
> > Ie the metadata for /home/stesmi/foo is in /home/stesmi/.meta/foo
> > 
> > This should be suit both camps I'd think?
> 
> You still need to figure out the parent of "foo", which isn't 
> necessarily easy, especially considering that even if we store a link to 
> the parent, it will be inside the metadata.  Then you have a 
> chicken-and-egg situation.
> 
> Both camps seem to want to allow easy access to the metadata of a file, 
> whether we're given that file as an inode or as a pathname.  That's why 
> I suggested /meta/vfs and /meta/inode -- sometimes I want to look up a 
> file by name, and sometimes by inode, but either way, I should be able 
> to get its metadata.

Well, it's not really 'as an inode or as a pathname'.  It is 'as an
open file descriptor or as a path name' which is an important
difference.

Maybe it is worth repeating Al Viro's suggestion at this point.  I
don't have a reference but the idea was basically that if you open
"/foo" and get filedescriptor N, then
   /proc/self/fds/N-meta
is a directory which contains all the meta stuff for "/foo".
Then it is trivial to get the 'meta' stuff given a filedescriptor and
if you have a pathname, you can always get yourself a filedescriptor.

Then to allow
    cat /home/friend/foo/.meta.../perms
you write a little .so which redefines open, stat, and a few others to
scan for ".meta..." in the pathname and to the necessary magic, and
    export LD_PRELOAD=/that/.so

Finally you write a killer app which fundamentally relies on this
functionality, get everyone addicted to it, and *then* (and only then)
start trying to get this functionality into the kernel.

i.e. prototype new semantics in userspace.

NeilBrown
