From: Sonny Rao <sonny@burdell.org>
Subject: Re: Emergency: Is there a way to fix a partition table
Date: Mon, 27 Sep 2004 02:56:08 -0400
Message-ID: <20040927065608.GA25236@kevlar.burdell.org>
References: <231dafb504092622352b9c17d2@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21932-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <231dafb504092622352b9c17d2@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dark Shadow <shadowofdarkness@gmail.com>
Cc: reiserfs-list@namesys.com

On Mon, Sep 27, 2004 at 01:35:55AM -0400, Dark Shadow wrote:
> I don't have a backup of the partition table and was wondering if
> there was a way to auto scan and have it come up with one. It had 2
> partitions both reiserfs v3 and fully functioning Linux installs
> 
> I have made a dd image of the entire drive to work with
> 
> This is very important that I get it fixed since even though I have a
> day old backup I got a couple files I really don't want to lose (9gb
> of tv capturecard captures)and I need the system fully functioning in
> a day
> 

http://packages.debian.org/unstable/admin/gpart

This program has worked for me in the past.

--
Sonny Rao
