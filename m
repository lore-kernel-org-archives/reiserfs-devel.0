From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: when will it end?
Date: Wed, 27 Oct 2004 22:52:11 +0400
Message-ID: <20041027185211.GJ25932@backtop.namesys.com>
References: <417EF280.10003@slaphack.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22197-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <417EF280.10003@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Masover <ninja@slaphack.com>
Cc: reiserfs-list@namesys.com

On Tue, Oct 26, 2004 at 07:57:36PM -0500, David Masover wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> I have 512 megs of RAM and one 200 gig hard drive (effectively 177 gig
> filesystem) that is 86% full.  I started the reiser4 repacker two days
> ago, with very minimal system use since then (an hour or two a day of
> playing music and reading email).  See below for my df and top.

200GB / 48 / 3600 ~=  1MB/sec, right?

I think it is a bug.  Hopefully, after some developing efforts, the repacker
whould work faster. 

-- 
Alex.
