From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: RE: Maximum number of subdirectories
Date: Wed, 17 May 2006 14:10:24 +0400
Message-ID: <1147860624.6478.23.camel@tribesman.namesys.com>
References: <5502B4E900B1A04AAA35CB57979B8C9A2472A8@spi-mail2003.spitech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28637-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <5502B4E900B1A04AAA35CB57979B8C9A2472A8@spi-mail2003.spitech.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Sinang, Danny" <D.Sinang@spi-bpo.com>
Cc: reiserfs-list@namesys.com

Hello

On Wed, 2006-05-17 at 17:07 +0800, Sinang, Danny wrote:
> Hi Vladimir,
> 
> By current limit, are you pertaining to ReiserFS (v3.x) or Reiser4 ?
> 

for both.


> Regards,
> Danny 
> 
> -----Original Message-----
> From: Vladimir V. Saveliev [mailto:vs@namesys.com] 
> Sent: Wednesday, May 17, 2006 4:46 PM
> To: Sinang, Danny
> Cc: reiserfs-list@namesys.com
> Subject: Re: Maximum number of subdirectories
> 
> Hello
> 
> On Tue, 2006-05-16 at 23:25 +0800, Sinang, Danny wrote:
> > Hello,
> >  
> > Am a newbie to ReisferFS / Reiser4. 
> >  
> > I've been searching the archives and Google for a definite answer as 
> > to what the maximum number of subdirectories under a directory is. A 
> > Dec, 2003 article ( http://everything2.com/index.pl?node_id=510028 ) 
> > says it's 64,536. Is this still true ?
> >  
> no, that was for old format of reiserfs.
> 
> > If not, then what is the current limit for both ReiserFS and Reiser4 ?
> 
> current limit for both is 2^32.
> 
> >  
> > Regards,
> > Danny
> >  
> >  
> 
> 

