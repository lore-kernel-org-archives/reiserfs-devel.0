From: Sean Johnson <sean@gutenpress.org>
Subject: Re: Can compression at filesystem level improve overall
Date: Sun, 21 Mar 2004 18:23:23 -0500
Message-ID: <1079911403.7150.1.camel@poo.home.local>
References: <200403212317.i2LNHrJo010166@sirius.cs.pdx.edu>
Reply-To: sean@gutenpress.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17364-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200403212317.i2LNHrJo010166@sirius.cs.pdx.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Sun, 2004-03-21 at 18:17, The Amazing Dragon wrote:
> > From: Sean Johnson <sean@gutenpress.org>
> > On Fri, 2004-03-19 at 11:53, Nikita Danilov wrote:
> > > That's common misconception. :)
> > > 
> > > The goal of compression is to conserve disk bandwidth rather than space.
> > > 
> > > By compressing it is possible to transfer data (== uncompressed data
> > > user works with), at a rate higher than raw device bandwidth.
> > 
> > I am far from any kind of authority on filesystems, but doesn't compression
> > make data corruption a significantly nastier bugaboo?
> 
> Potentially. Depending upon the encoding losing one block of encoded data
> maps to losing many blocks of decoded data. Also losing the first block
> of data might make it impossible to recover later blocks.
> 
> But these aren't issues since you do error correction near the physical
> layer, and backups just you make sure. You do, don't you?

Heh, in the words of my previous team lead "...sure we do backups, it's 
just the restores that we have problems with ..." *grin*

Sean


