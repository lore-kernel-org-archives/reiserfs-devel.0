From: Kristian =?iso-8859-1?q?K=F6hntopp?= <kris@xn--khntopp-90a.de>
Subject: Re: Hard errors, trying to recover
Date: Wed, 30 Jun 2004 16:45:13 +0200
Message-ID: <200406301645.13096.kris@xn--khntopp-90a.de>
References: <20040629193943.GA15481@p15104972.pureserver.info> <200406301802.05840.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19464-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200406301802.05840.vitaly@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com

On Wednesday 30 June 2004 16:02, Vitaly Fertman wrote:
> we deal with hardware problems only under
> www.namesys.com/support.html terms.

I have the hardware problem well under control now, thank you.

My mail referred more to two observations I made in that process:

1. Unless reiserfsck --rebuild-tree succeeds and finishes, it 
does more harm than good, because the disk is unmountable if 
reiserfsck --rebuild-tree stops halfway.

reiserfsck --rebuild-tree seems to stop when it has discovered 
something it believes to be a hard read error.

That combination of behaviours is somewhat suboptimal and could 
be improved, I believe. I'd rather have reiserfsck to present me 
with a choice to assume the defect block as all zero and 
continue or stop here and try other things.

2. When I make an image of a disk, and that image is incomplete 
for whatever reason, I cannot reiserfsck that image because of 
seeks beyond the end of the medium. Again, I'd rather have the 
choice of reiserfsck trying to salvage the incomplete medium 
(assuming all zero data for all missing blocks) or stop with an 
error.

The combination of 1 and 2 has bitten me badly in trying to 
salvage a failing 160GB disk, because I tried reiserfsck 
--rebuild-tree before making an image.

It may also be a good idea in some cases to have a version of 
reiserfsck that fsck's the disk to a new medium, that is, 
reiserfsck reads as much as it can from the defect disk or a 
possibly incomplete image of such a disk, and tries to construct 
a useable image on a new replacement partition.


I was able to force a reiserfsck to finish using a combination of 
writes to the defect blocks in order to force reallocation and 
thermal stimulation of the dying disk (don't ask, you do not 
want to know :). The filesystem was mountable r/o after that. 
The final copy is still in progress, but 132 of 135 GB have 
already been saved.

Kristian
