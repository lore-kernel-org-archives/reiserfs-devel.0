From: Chris Mason <mason@suse.com>
Subject: Re: slow mount
Date: 12 Jun 2003 10:39:13 -0400
Message-ID: <1055428752.24111.388.camel@tiny.suse.com>
References: <1055427629.1875.8.camel@terminus.zapto.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14517-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1055427629.1875.8.camel@terminus.zapto.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Herbie Hopkins <Herbie@Hopkins.net>
Cc: reiserfs-list@namesys.com

On Thu, 2003-06-12 at 10:20, Herbie Hopkins wrote:
> It seems to take a very long time to mount a large reiserfs filesystem:
> 
>   $ time mount /home
>  
>   real    0m17.259s
>   user    0m0.000s
>   sys     0m0.000s

Which kernel?  2.4.20 or so had improvements in this area

-chris


