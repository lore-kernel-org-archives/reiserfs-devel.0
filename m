From: Sean Johnson <sean@gutenpress.org>
Subject: Re: Can compression at filesystem level improve overall
	performance?
Date: Sun, 21 Mar 2004 09:29:02 -0500
Message-ID: <1079879342.7375.2.camel@poo.home.local>
References: <405B02ED.4010602@solidcode.net>
	 <1079713790.9729.1.camel@redeeman.linux.dk>
	 <16475.9613.375262.677576@laputa.namesys.com>
Reply-To: sean@gutenpress.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17355-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16475.9613.375262.677576@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs Mailinglist <reiserfs-list@namesys.com>

On Fri, 2004-03-19 at 11:53, Nikita Danilov wrote:
> That's common misconception. :)
> 
> The goal of compression is to conserve disk bandwidth rather than space.
> 
> By compressing it is possible to transfer data (== uncompressed data
> user works with), at a rate higher than raw device bandwidth.

I am far from any kind of authority on filesystems, but doesn't compression
make data corruption a significantly nastier bugaboo?

Thanks,

Sean

