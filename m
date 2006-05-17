From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Maximum number of subdirectories
Date: Wed, 17 May 2006 14:16:21 +0400
Message-ID: <1147860981.6478.28.camel@tribesman.namesys.com>
References: <5502B4E900B1A04AAA35CB57979B8C9A19D2F7@spi-mail2003.spitech.com>
	 <1147855575.6478.19.camel@tribesman.namesys.com>
	 <446AE857.2000507@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28638-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <446AE857.2000507@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: "Sinang, Danny" <D.Sinang@spi-bpo.com>, reiserfs-list@namesys.com

Hello

On Wed, 2006-05-17 at 02:09 -0700, Hans Reiser wrote:
> Vladimir V. Saveliev wrote:
> 
> >Hello
> >
> >On Tue, 2006-05-16 at 23:25 +0800, Sinang, Danny wrote:
> >  
> >
> >>Hello,
> >> 
> >>Am a newbie to ReisferFS / Reiser4. 
> >> 
> >>I've been searching the archives and Google for a definite answer as
> >>to what the maximum number of subdirectories under a directory is. A
> >>Dec, 2003 article ( http://everything2.com/index.pl?node_id=510028 )
> >>says it's 64,536. Is this still true ?
> >> 
> >>    
> >>
> >no, that was for old format of reiserfs.
> >
> >  
> >
> >>If not, then what is the current limit for both ReiserFS and Reiser4 ?
> >>    
> >>
> >
> >current limit for both is 2^32.
> >  
> >
> and that limit is not of our making, but is rather due to layers above us.
> 

both in-core inode of linux and reiser4 default disk format store number
of file links in 32 bits. 


> >  
> >
> >> 
> >>Regards,
> >>Danny
> >> 
> >> 
> >>    
> >>
> >
> >
> >
> >  
> >
> 
> 

