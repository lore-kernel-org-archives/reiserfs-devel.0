From: Chris Mason <mason@suse.com>
Subject: Re: does anyone know what versions of 2.6 reiserfs is unstable in,
	we need it for our download page warnings....
Date: Thu, 05 Aug 2004 19:50:56 -0400
Message-ID: <1091749855.10651.40.camel@watt.suse.com>
References: <4112BD47.60602@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20030-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4112BD47.60602@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

On Thu, 2004-08-05 at 19:05, Hans Reiser wrote:
> Thanks,

The stream of bugfixes started in 2.6.4.  I would advise against using
versions before 2.6.5.  For hardcore production use, I'd start with
2.6.7 or 2.6.8, but that carries for the kernel as a whole.  suse also
fixed ext3/ext2 bugs during the QA cycles for sles9.

-chris


