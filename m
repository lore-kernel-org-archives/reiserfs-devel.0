From: Yusuf Iskenderoglu <enygma@dreadnought.hadiko.de>
Subject: Re: A WISH: Reiser4 patch for 2.6.14
Date: Sat, 12 Nov 2005 22:58:33 +0100
Message-ID: <1131832713.13222.2.camel@localhost.localdomain>
References: <1131353326.4553.4.camel@localhost.localdomain>
	 <436F7ED5.1060106@namesys.com>
	 <1131385665.4553.13.camel@localhost.localdomain>
	 <4374C7EE.20001@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26886-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4374C7EE.20001@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: Reiserfs-dev <reiserfs-dev@namesys.com>, ReiserFS Mailing List <reiserfs-list@namesys.com>

Hello,

I am now using this patch, it required me to export __pagevec_realloc @
mm/swap.c though, and not the one mentioned in the email.

I am using this partition with squid and will do some simultaneous tests
like building gcc on the same partition, and inform you, whether
interesting things happen.

Regards;
Yusuf.

On Fri, 2005-11-11 at 19:33 +0300, Vladimir V. Saveliev wrote:
> Hello
> 
> Yusuf Iskenderoglu wrote:
> > Okay, thanks for the information. I will continue waiting.
> > 
> 
> Well, here is the first attempt to relelase reiser4 for 2.6.14. Please try to
> use it.
> ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.14/reiser4-for-2.6.14-1.patch.gz
> 
> 
> Consider it as an experimental thing. Note, it will probably not compile as a
> module. Adding a line to mm/page-writeback.c the following line
> 
> EXPORT_SYMBOL(clear_page_dirty_for_io);
> 
> after clear_page_dirty_for_io()'s definition should fix that, though.


