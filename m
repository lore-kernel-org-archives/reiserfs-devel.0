From: Alexander Lyamin <flx@msu.ru>
Subject: Re:  reiser4 plugins (was: silent semantic changes with reiser4)
Date: Sat, 28 Aug 2004 16:05:02 +0400
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <20040828120502.GE6746@alias>
References: <412D9FE6.9050307@namesys.com> <20040826014542.4bfe7cc3.akpm@osdl.org> <1093522729.9004.40.camel@leto.cs.pocnet.net> <20040826124929.GA542@lst.de> <1093525234.9004.55.camel@leto.cs.pocnet.net> <20040826130718.GB820@lst.de> <1093526273.11694.8.camel@leto.cs.pocnet.net> <20040826132439.GA1188@lst.de> <20040828105929.GB6746@alias> <20040828111233.GA11339@lst.de>
Reply-To: flx@msu.ru
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040828111233.GA11339@lst.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@lst.de>, flx@msu.ru, Christophe Saout <christophe@saout.de>, Andrew Morton <akpm@osdl.org>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, torvalds@osdl.org, reiserfs-list@namesys.com

Sat, Aug 28, 2004 at 01:12:33PM +0200, Christoph Hellwig wrote:
> On Sat, Aug 28, 2004 at 02:59:29PM +0400, Alexander Lyamin wrote:
> > Thu, Aug 26, 2004 at 03:24:39PM +0200, Christoph Hellwig wrote:
> > > This VFS interface is an integral part of ??very filesystem, and it
> > 
> > VFS never was "an integral part" of ANY filesystem. my dog knows it.
> > its just unified INTERFACE TO any filesystem (including reiser4).
> 
> You's misquoting me.  IF you quoted the whole context it'd be pretty
> sure that the part of the filesystem that intefaces with the VFS is
> meant.

No. Its not me "misquoting", its just someone sound plain ?incoherrent?.
Even if I overquoted reply with whole message, its still sound ?incohherent?.

> 
> But one could even say VFS is integral part of a linux filesystem as
> it does most of the work a filesystem driver does in other operating
> systems.

theres no "linux filesystem". there are "linux filesystems".
thanks god.

But I it would be really grate if you'll elaborate your sentence with
example of VFS functionality (lack of it) on said "other operating systems"
and if you'll define "most of work".


> 
> > P.S. I imagine, how much flamed it would be if reiser4 made any intensive
> > changes in linux VFS code...
> 
> It really depends on how you sent them.  If you had a big patch without
> explanations - sure.
It would work with small tweaks, but you just can take a look at reiser4
code and you'll understand that it just could not be chopped in
"set of small patches" altough it could be documented better ofcourse,
but its really well commented already.

some times, some approaches to  some problems  just would not work.

-- 
"the liberation loophole will make it clear.."
lex lyamin
