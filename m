From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: [PATH] "metas" in reiserfs v4 snapsot 2004.03.26
Date: Mon, 29 Mar 2004 16:36:49 +0300
Message-ID: <20040329133649.GQ5229@nysv.org>
References: <200403291527.40994.chrivers@iversen-net.dk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17562-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200403291527.40994.chrivers@iversen-net.dk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

(BTW, Why can't I fake the In-Reply-To header properly, not being
a subscriber but not wanting to break threads either?

Christian Iversen wrote:

> If I had anything to say, I would go for ".meta". 

It makes sense, it's hidden except for ls -a, but being a special
case it's still invisible to readdir.

My personal take on this still is that ..metas/ makes more sense,
like the extra dot signifying "I am really hidden" ;)

-- 
mjt

