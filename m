From: Chris Mason <mason@suse.com>
Subject: Re: [PATCH] various allocator optimizations
Date: 12 Mar 2003 08:35:32 -0500
Message-ID: <1047476132.8218.510.camel@tiny.suse.com>
References: <1047400482.8215.312.camel@tiny.suse.com>
	 <20030311194205.A4493@namesys.com>
	 <1047403968.8219.337.camel@tiny.suse.com>  <3E6E584D.4080809@namesys.com>
	 <1047421551.8219.448.camel@tiny.suse.com>  <3E6E674E.4040305@namesys.com>
	 <1047433739.8215.487.camel@tiny.suse.com>  <3E6F1635.2010305@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13222-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E6F1635.2010305@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Oleg Drokin <green@namesys.com>, reiserfs-list@namesys.com

On Wed, 2003-03-12 at 06:12, Hans Reiser wrote:

> >I like the idea of a dynamic in-kernel fragmentation tool though, you
> >mark a file as being in need of reallocation, and it happens before io
> >or something (hand waving is fun).
> >
> You mean you like the allocate on flush we do in reiser4?
> 
> Perhaps I should say only that for 80% of machines 80% of the files 
> never move during the course of a week.;-)
> 
> allocate on flush will improve a lot of the cases, and an online 
> repacker will improve a lot of the ones that allocate on flush does not 
> improve.

None of which solves the question of how do we lay things out on disk
;-)

-chris


