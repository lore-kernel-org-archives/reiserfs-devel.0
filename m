From: Pysiak Satriani <pysiak.satriani@wp.pl>
Subject: Re: Reiser4 hang -- bad sectors on disk
Date: Thu, 22 Sep 2005 12:19:40 +0200
Message-ID: <861194762.20050922121940@wp.pl>
References: <200509221245.39730.rmeijer@internet.gr>
Reply-To: Pysiak Satriani <pysiak.satriani@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26228-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200509221245.39730.rmeijer@internet.gr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

I might be wrong here, but bad blocks are a condition that the kernel
should handle without barfing oops traces, so there indeed may be
not enough sanity checks somewhere.

--
Maciej


