From: David Masover <ninja@slaphack.com>
Subject: Re: reiser4 plugins
Date: Fri, 01 Jul 2005 04:08:20 -0500
Message-ID: <42C50804.4050006@slaphack.com>
References: <200506240241.j5O2f1eb005609@laptop11.inf.utfsm.cl>	<200506261816.j5QIGMdI010142@turing-police.cc.vt.edu>	<42BF08CF.2020703@slaphack.com>	<200506262105.j5QL5kdR018609@turing-police.cc.vt.edu>	<42BF2DC4.8030901@slaphack.com>	<200506270040.j5R0eUNA030632@turing-police.cc.vt.edu>	<42BF667C.50606@slaphack.com>	<5284F665-873C-45B7-8DDB-5F475F2CE399@mac.com>	<42BF7167.80201@slaphack.com>	<EC02A684-815A-4DF8-B5C1-9029FE45E187@mac.com>	<42C06D59.2090200@slaphack.com>	<CD59AE36-FD15-4A4C-9E1D-AB2F8B52D653@mac.com>	<42C08B5E.2080000@slaphack.com> <87y88vrzkg.fsf@evinrude.uhoreg.ca>	<EBD8F590-0113-4509-9604-E6967C65C835@mac.com>	<87mzpbrvpf.fsf@evinrude.uhoreg.ca>	<D3A4ABBF-8062-4399-B1EC-61722295944A@mac.com>	<87irzzrqu7.fsf@evinrude.uhoreg.ca>	<2B1C058D-C304-4E15-ACDA-C3337E67E981@mac.com>	<87d5q6pdyv.fsf@evinrude.uhoreg.ca>	<C7DB345A-CD35-4A4C-89F7-5BBD3CB83DF4@mac.com> <874qbiey92.f
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24884-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <874qbiey92.fsf@evinrude.uhoreg.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hubert Chan <hubert@uhoreg.ca>
Cc: Kyle Moffett <mrmacman_g4@mac.com>, Valdis.Kletnieks@vt.edu, Lincoln Dale <ltd@cisco.com>, Gregory Maxwell <gmaxwell@gmail.com>, Hans Reiser <reiser@namesys.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

Hubert Chan wrote:
> On Tue, 28 Jun 2005 15:59:03 -0400, Kyle Moffett <mrmacman_g4@mac.com> said:
> 
> 
>>On Jun 28, 2005, at 13:51:04, Hubert Chan wrote:
> 
> 
>>> I don't know if VFS is the right place for it, but I agree that it
>>>would be good to make it accessible to all filesystems.
> 
> 
>>That's somewhat of a contradiction in terms.  The whole point of the
>>VFS is to hold all of the things that multiple filesystems want to
>>share :-D.
> 
> 
> VFS provides a common interface to the filesystem.  I don't think metafs
> needs any VFS changes.  It may be able to get by without making changes
> to the VFS, and if so, it shouldn't touch the VFS.  It should just be
> its own separate filesystem.
> 
> I imagine most of it could be implemented by a FUSE filesystem.

"could", yes.  "should", no.  I'll refer you to my HURD comment.

That's not to say that none of this should be userspace, just that some 
of it most certainly *never* needs to touch userspace, such as 
cryptocompress.

I'm not guessing that you wanted to make it FUSE, I just want to be 
pre-emptive here.  FUSE will NOT work well for this.

>>Maybe we just need better regular applications?
> 
> 
> You mean patch them all so that they understand and can edit
> xattr/substreams/etc.?  The file-as-dir interface is meant to avoid
> having to do that.  metafs also avoids having to patch all the
> applications by exposing them as regular files.

Metafs also avoids having to patch tar.  It's assumed that legacy backup 
systems can always avoid metafs and still catch almost everything 
important, and certainly everything they already do catch.  With a 
hybrid or an entirely new backup system, we could catch everything, 
including any new ACL-like animals that people invent.

