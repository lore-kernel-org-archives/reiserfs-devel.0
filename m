From: Nicholas Miell <nmiell@gmail.com>
Subject: Re: silent semantic changes with reiser4
Date: Wed, 25 Aug 2004 19:02:43 -0700
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <1093485763.2748.47.camel@entropy>
References: <20040825152805.45a1ce64.akpm@osdl.org>
	 <112698263.20040826005146@tnonline.net>
	 <Pine.LNX.4.58.0408251555070.17766@ppc970.osdl.org>
	 <1453698131.20040826011935@tnonline.net>
	 <20040825163225.4441cfdd.akpm@osdl.org>
	 <20040825233739.GP10907@legion.cup.hp.com>
	 <20040825234629.GF2612@wiggy.net> <1093480940.2748.35.camel@entropy>
	 <20040826010355.GB24731@mail.shareable.org>
	 <1093483607.2748.42.camel@entropy>
	 <20040826015320.GA25756@mail.shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20040826015320.GA25756@mail.shareable.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jamie Lokier <jamie@shareable.org>
Cc: Wichert Akkerman <wichert@wiggy.net>, Jeremy Allison <jra@samba.org>, Andrew Morton <akpm@osdl.org>, Spam <spam@tnonline.net>, torvalds@osdl.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

On Wed, 2004-08-25 at 18:53, Jamie Lokier wrote:
> Nicholas Miell wrote:
> > > Additionally, all of those things you describe should be deleted if
> > > the file is modified -- to indicate that they're no longer valid and
> > > should be regenerated if needed.
> > > 
> > > Whereas there are some other kinds of metadata which should not be
> > > deleted if the file is modified.
> > > 
> > > -- Jamie
> > 
> > Presumably the app which uses the metadata will be smart enough to
> > compare the st_mtime of the MDS/stream/attribute/whatever (can we choose
> > a name for these things now?) to the st_mtime of the file and do the
> > right thing.
> 
> [This is straying off the topic of files-as-directories].
> 
> st_mtime tests are weak.  They break sometimes, and are not suitable
> for strong data models such as transparently caching generated data
> from a file's contents.
> 
> They're especially breakable if you change a file and then read it
> within a second.  Sometimes, more than a second.
> 
> As has been raised before, nanosecond timestamps (a) don't solve this
> unless they're stored in the filesystem; (b) even then they will fail
> one day, on a sufficiently fast box; (c) don't work when there are
> changes to wall clock time.
> 
> They're fine where you don't care if the generated data is wrong sometimes.
> 
> If you want the _equivalent_ behaviour to opening and parsing the
> file, but fast, then they're no good.
> 
> Modification serial numbers would work, though.
> 
> -- Jamie

Remember that the Solaris attribute model is just another filesystem
tree rooted in a hidden directory associated with a regular file. If you
can come up with semantics that work in general for all files, that's
fine.

inodes that delete themselves when other inodes are changed creep me
out.

