From: Bernd Schubert <bernd-schubert@gmx.de>
Subject: Re: Need help retrieving data
Date: Fri, 25 Aug 2006 18:02:42 +0200
Message-ID: <200608251802.42926.bernd-schubert@gmx.de>
References: <44EDE55E.7030106@comcast.net> <44EE0F5F.1040009@namesys.com> <44EF07A9.3080100@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29691-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44EF07A9.3080100@comcast.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Brian Davis <bridavis@comcast.net>, Hans Reiser <reiser@namesys.com>, reiserfs-dev <reiserfs-dev@namesys.com>, Alexander Zarochentcev <zam@namesys.com>

Hi Brian,

On Friday 25 August 2006 16:22, Brian Davis wrote:
> Do you guys think that a rebuild-tree will fix this problem?

I have no knowlegde about the reiserfs internals, but here's just a general 
advice - if you have sufficient free storage, use dd to backup your partition 
e.g. into an image file and run reiserfsck on this backup image-file as much 
as you want.

Otherwise, assuming Sasha is following the common russian holidays, he should 
be back next week or the week after.

Btw, that brings me up to an interesting question to the reiser folks. Here 
are the edge conditions:
  - one has a damaged partition as Brian has and it cannot be repaired
  - one backups this partion into an image file on a reiser3.6 partion
  - the "host" reiser3.6 partition has no other files, only this image file
  - now run 'reiserfsck --rebuild-tree --scan-whole-partition" on the "host" 
partition
  ==> Would this bring back the files into the "host" partition?

Cheers,
Bernd
