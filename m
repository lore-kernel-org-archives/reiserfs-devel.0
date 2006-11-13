From: Enrico Cavalli <cavalli@cilea.it>
Subject: Re: kernel oops with 10T filesystem
Date: Mon, 13 Nov 2006 16:53:56 +0100
Message-ID: <1163433237.20016.19.camel@cavalli-laptop>
References: <1163423352.5434.59.camel@cavalli-laptop>
	 <200611131656.47911.vs@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30148-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200611131656.47911.vs@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com, reiserfs-dev@namesys.com

On Mon, 2006-11-13 at 16:56 +0300, Vladimir V. Saveliev wrote:
> Hello
> 
> On Monday 13 November 2006 16:09, Enrico Cavalli wrote:
> > Hello, we are getting random kernel opps with a 10T reiserfs (v 3.6)
> > 
> 
> reiserfs records number of bitmap blocks in 16 bit wide field of super block. 
> 10T filesystem uses more than 65536 bitmap blocks, therefore, super block field is incorrect and that may cause the problem.
> IIRC, there was recently a patch to fix this problem, but I can not find it now.
> Can anybody point us to that patch, please? If not or if I am confused and such a patch never existed, I will make a patch for you to try.




Ok, so maybe a solution would be using 8k as block size? Or this would
not be a solution?

I wonder why the twin machine does not exibit the same problem (with a
11T fs, but maybe it depends on the number of allocated blocks)...


Thank you very much for your help and prompt response.

Best regards,

>  
-- 
Enrico Cavalli
CILEA - via R. Sanzio 4, 20090 - Segrate (MI), Italy
phone: +39 02 26995.1 - fax: +39 02 2135520 - skype: enricocavalli
PGP Fingerprint: 3762 7B1B 743E 029C 8F94  8ADE BC4B 43A7 0485 30E5

