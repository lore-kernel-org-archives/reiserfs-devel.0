From: Ross Vandegrift <ross@willow.seitz.com>
Subject: Re: What Filesystem?
Date: Wed, 29 Jan 2003 10:28:15 -0500
Message-ID: <20030129152815.GB28632@willow.seitz.com>
References: <3E38378A.8030406@jtmstudio.fsbusiness.co.uk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12538-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3E38378A.8030406@jtmstudio.fsbusiness.co.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Thompson <james@jtmstudio.fsbusiness.co.uk>
Cc: reiserfs-list@namesys.com

On Wed, Jan 29, 2003 at 03:20:26PM -0500, James Thompson wrote:
> I am a visual artist and musician.

Check out the document at
http://myweb.cableone.net/eviltwin69/ALSA_JACK_ARDOUR.html.  There a
section that benchmarks various filesystems for their latency.  The
short story is that Reiserfs wins handily over Ext2, Ext3, and FAT32
(duh!  why would someone test that...).  Unfortunately, there's no
comparison between Reiser/JFS/XFS.  I think that would be more of a fair
match.

Anyhow though, for general low-latency multimedia work, ReiserFS looks
like it's a good choice.

-- 
Ross Vandegrift
ross@willow.seitz.com

A Pope has a Water Cannon.                               It is a Water Cannon.
He fires Holy-Water from it.                        It is a Holy-Water Cannon.
He Blesses it.                                 It is a Holy Holy-Water Cannon.
He Blesses the Hell out of it.          It is a Wholly Holy Holy-Water Cannon.
He has it pierced.                It is a Holey Wholly Holy Holy-Water Cannon.
He makes it official.       It is a Canon Holey Wholly Holy Holy-Water Cannon.
Batman and Robin arrive.                                       He shoots them.
