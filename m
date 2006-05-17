From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Maximum number of subdirectories
Date: Wed, 17 May 2006 15:20:50 +0400
Message-ID: <1147864850.6478.34.camel@tribesman.namesys.com>
References: <5502B4E900B1A04AAA35CB57979B8C9A2472A8@spi-mail2003.spitech.com>
	 <1147860624.6478.23.camel@tribesman.namesys.com>
	 <446AFBC1.3020304@dermichi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28640-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <446AFBC1.3020304@dermichi.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Weissenbacher <webmaster@dermichi.com>
Cc: "Sinang, Danny" <D.Sinang@spi-bpo.com>, reiserfs-list@namesys.com

Hello

On Wed, 2006-05-17 at 12:32 +0200, Michael Weissenbacher wrote:
> hello,
> Vladimir V. Saveliev wrote:
> > Hello
> > 
> > On Wed, 2006-05-17 at 17:07 +0800, Sinang, Danny wrote:
> >> Hi Vladimir,
> >>
> >> By current limit, are you pertaining to ReiserFS (v3.x) or Reiser4 ?
> >>
> > 
> > for both.
> I guess you mean reiserfs 3.6 and reiser4, or does it also apply to 
> reiserfs 3.5?
> 

this also applies to 3.5. But for 3.5 number of directory links does not
get reported correctly: 1 is reported for directories which have more
than 64535 subdirectories.


