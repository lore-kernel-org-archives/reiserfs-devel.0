From: "David Dabbs" <david@dabbs.net>
Subject: RE: Was able to reproduce "cp: cannot stat file.x: Input/output error"
Date: Tue, 10 Aug 2004 16:19:29 -0500
Message-ID: <20040810212733.4BA8315C56@mail03.powweb.com>
References: <20040810210630.GV9811@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20157-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040810210630.GV9811@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Alex Zarochentsev' <zam@namesys.com>
Cc: 'Hans Reiser' <reiser@namesys.com>, 'ReiserFS List' <reiserfs-list@namesys.com>



> -----Original Message-----
> From: Alex Zarochentsev [mailto:zam@namesys.com]
> Sent: Tuesday, August 10, 2004 4:07 PM
> To: David Dabbs
> Cc: 'Hans Reiser'; 'ReiserFS List'
> Subject: Re: Was able to reproduce "cp: cannot stat file.x: Input/output
> error"
> 
> On Tue, Aug 10, 2004 at 04:06:24PM -0500, David Dabbs wrote:
> >
> > I have been running benchmarks with SYNC=off, as the mongo page
> > recommends against doing so. In configs where SYNC=ON we would
> > omit the syncs/waits, yes?
> 
> not sure. metadata need to be synched still.
> 
> Alex.

Saw following recently on LKML re. ext3. Does r4 O_SYNC not sync metadata?

 
From Theodore Ts'o
Subject Re: ext3 and SPEC SFS Run rules. 

On Mon, Jul 26, 2004 at 10:12:01AM +0100, Tigran Aivazian wrote:
> On Mon, 26 Jul 2004, Andrew Morton wrote:
> > ext3 should be fully syncing data and metadata for both fsync()
> > and O_SYNC writes in all three journalling modes.  
> > If not, that's a big bug.

David


