From: Nicholas Miell <nmiell@gmail.com>
Subject: Re: silent semantic changes with reiser4
Date: Wed, 25 Aug 2004 18:26:47 -0700
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <1093483607.2748.42.camel@entropy>
References: <20040824202521.GA26705@lst.de> <412CEE38.1080707@namesys.com>
	 <20040825152805.45a1ce64.akpm@osdl.org>
	 <112698263.20040826005146@tnonline.net>
	 <Pine.LNX.4.58.0408251555070.17766@ppc970.osdl.org>
	 <1453698131.20040826011935@tnonline.net>
	 <20040825163225.4441cfdd.akpm@osdl.org>
	 <20040825233739.GP10907@legion.cup.hp.com>
	 <20040825234629.GF2612@wiggy.net> <1093480940.2748.35.camel@entropy>
	 <20040826010355.GB24731@mail.shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20040826010355.GB24731@mail.shareable.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jamie Lokier <jamie@shareable.org>
Cc: Wichert Akkerman <wichert@wiggy.net>, Jeremy Allison <jra@samba.org>, Andrew Morton <akpm@osdl.org>, Spam <spam@tnonline.net>, torvalds@osdl.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

On Wed, 2004-08-25 at 18:03, Jamie Lokier wrote:
> Nicholas Miell wrote:
> > Anything that currently stores a file's metadata in another file really
> > wants this right now. Things like image thumbnails, document summaries,
> > digital signatures, etc.
> 
> Additionally, all of those things you describe should be deleted if
> the file is modified -- to indicate that they're no longer valid and
> should be regenerated if needed.
> 
> Whereas there are some other kinds of metadata which should not be
> deleted if the file is modified.
> 
> -- Jamie

Presumably the app which uses the metadata will be smart enough to
compare the st_mtime of the MDS/stream/attribute/whatever (can we choose
a name for these things now?) to the st_mtime of the file and do the
right thing.

thumbnail - regenerate it
summary - keep it, it's relatively independent of the file's exact
contents
signature - always verify it
etc.

