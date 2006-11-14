From: Enrico Cavalli <cavalli@cilea.it>
Subject: Re: kernel oops with 10T filesystem
Date: Tue, 14 Nov 2006 14:35:30 +0100
Message-ID: <1163511330.6793.38.camel@cavalli-laptop>
References: <1163423352.5434.59.camel@cavalli-laptop>
	 <200611131656.47911.vs@namesys.com>
	 <1163433237.20016.19.camel@cavalli-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30163-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1163433237.20016.19.camel@cavalli-laptop>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

On Mon, 2006-11-13 at 16:53 +0100, Enrico Cavalli wrote:

> 
> 
> Ok, so maybe a solution would be using 8k as block size? Or this would
> not be a solution?

It seems that using 8k makes the filesystem not mountable (but
reiserfsck works....)

> 

-- 
Enrico Cavalli
CILEA - via R. Sanzio 4, 20090 - Segrate (MI), Italy
phone: +39 02 26995.1 - fax: +39 02 2135520 - skype: enricocavalli
PGP Fingerprint: 3762 7B1B 743E 029C 8F94  8ADE BC4B 43A7 0485 30E5

