From: Kris Van Bruwaene <Kris.VanBruwaene@vrt.be>
Subject: Re: Can compression at filesystem level improve overall	performance?
Date: Mon, 22 Mar 2004 09:01:28 +0100
Message-ID: <405E9D58.6080404@vrt.be>
References: <405B02ED.4010602@solidcode.net>	<1079713790.9729.1.camel@redeeman.linux.dk> <16475.9613.375262.677576@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17368-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16475.9613.375262.677576@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Nikita Danilov <Nikita@namesys.com>
Cc: Reiserfs Mailinglist <reiserfs-list@namesys.com>

Nikita Danilov wrote:

>Redeeman writes:
> > On Fri, 2004-03-19 at 15:25, Erik Terpstra wrote:
> > > Is it fair to say that today compression at the filesystem level would 
> > > improve overall performance?
> > the more agressive you compress it the more cpu it takes, and that will
> > make it slower, but i think a small compression algorithm for filesystem
> > purpose could be written... however, i doubt it will be worth it,
> > harddrives are really cheap nowadays.. but maybe some algortihm to
> > compress cleartext only, or something..
>
>That's common misconception. :)
>
>The goal of compression is to conserve disk bandwidth rather than space.
>
>By compressing it is possible to transfer data (== uncompressed data
>user works with), at a rate higher than raw device bandwidth.
>  
>
Something else to consider: the gain might not be so impressive, since 
many files are already heavily compressed: apart from the obvious ones 
(.zip .gz .bz2) most audio (.mp3) and video is natively compressed 
(mpeg2/4), and amy office files as well (presentations, pdf...).


