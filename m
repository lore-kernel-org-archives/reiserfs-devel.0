From: "David Dabbs" <david@dabbs.net>
Subject: RE: Was able to reproduce "cp: cannot stat file.x: Input/output error"
Date: Mon, 9 Aug 2004 13:32:08 -0500
Message-ID: <20040809183954.9446C15D2B@mail03.powweb.com>
References: <4117B7BE.4050305@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20101-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4117B7BE.4050305@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'ReiserFS List' <reiserfs-list@namesys.com>
Cc: 'Hans Reiser' <reiser@namesys.com>



> -----Original Message-----
> From: Hans Reiser [mailto:reiser@namesys.com]
> Sent: Monday, August 09, 2004 12:43 PM
> 
> David Dabbs wrote:
> >
> >But enough of extensions and experiments. I am in no way trying to press
> >a case for my MKDIRS/FILES experiments. I do, however, believe mongo 
> >should run with file names longer than six characters
> 
> ok.
> 
> >and that have extensions.
> >
> >
> this should be without effect, provided that the file creation order is
> the same as the hash/fibration order.
> 
[David Dabbs] 

Yes, it is moot when using exclusively all short, extension-less file names,
because all files have the same fibration bits and no file has the hash bit
in key element 2. But with some long file names (len > 23), extensions and
DOT-O, and especially EXT-1, all the .a's, .b's, etc. would be grouped
together in-tree and on-disk, then ordered by file name. This ordering
differs from how mongo currently runs, though the net effect on performance
remains to be measured. 

Besides the fact that configuring mongo this way is closer to average usage,
the other (potential) benefit is that it exercises more of the reiser4 code
base. But having it exercise more code may not matter to, or may be
orthogonal to, generating meaningful relative performance metrics. 

As an aside, if Namesys shipped r4 to Andrew Morton, is there an ETA on when
he will include it in an -mm patch?


David

p.s. For those benchmarking ext3 vs. r4 using mongo or some other tool,
there is an ext3 performance regression patch included in -rc3-mm2, so YMMV
with rc3-mm1.

 
 

