From: Andrew Morton <akpm@osdl.org>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 01:45:42 -0700
Message-ID: <20040826014542.4bfe7cc3.akpm@osdl.org>
References: <20040824202521.GA26705@lst.de>
	<412CEE38.1080707@namesys.com>
	<20040825152805.45a1ce64.akpm@osdl.org>
	<412D9FE6.9050307@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20597-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <412D9FE6.9050307@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, torvalds@osdl.org, reiserfs-list@namesys.com

Hans Reiser <reiser@namesys.com> wrote:
>
>  >To get us started on this route it would really help me (and, probably,
>  >others) if you could describe what these API extensions are in a very
>  >simple way, without referring to incomprehehsible web pages,
>  >
>  what is not comprehensible....?

Pretty much anything at www.namesys.com.  The amount of time which is
needed to extract the technical info which one is looking for vastly
exceeds a gnat-like attention span.

As a starting point, please prepare a bullet-point list of
userspace-visible changes which the filesystem introduces, or is planned to
introduce.

And describe the "plugin" system.  Why does the filesystem need such a
thing (other filesystems get their features via `patch -p1')?

And what are the licensing implications of plugins?  Are they derived
works?  Must they be GPL'ed?

