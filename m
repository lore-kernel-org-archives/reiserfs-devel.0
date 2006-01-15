From: Jan Kara <jack@ucw.cz>
Subject: Re: reiserfsck --rebuild-tree aborts at same block
Date: Sun, 15 Jan 2006 21:38:09 +0100
Message-ID: <20060115203809.GB24752@atrey.karlin.mff.cuni.cz>
References: <43CA5558.9070208@comcast.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-27729-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <43CA5558.9070208@comcast.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Depot <mdepot@comcast.net>
Cc: reiserfs-list@namesys.com

> I have a situation where if I run "reiserfsck --rebuild-tree" multiple 
> times, it always aborts at the same block.  The output includes
> "Send us the bug report only if the second run dies at the same place 
> with the same block number."
> 
> Before sending a bunch of info to the wrong place though, could someone 
> please confirm if I should submit details here as a bug report, or would 
> this be something to go through the support channel with?
  First check that you have the latest version of reiserfsck. If so, then
this is the appropriate list for the report.

								Honza
