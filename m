From: Andrew Morton <akpm@osdl.org>
Subject: Re: Reiser4 status: benchmarked vs. V3 (and ext3)
Date: Sat, 26 Jul 2003 01:33:01 -0700
Message-ID: <20030726013301.6164e6e4.akpm@osdl.org>
References: <3F1EF7DB.2010805@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15052-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F1EF7DB.2010805@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: linux-kernel@vger.kernel.org, reiserfs-list@namesys.com, torvalds@transmeta.com, marcelo@conectiva.com.br

Hans Reiser <reiser@namesys.com> wrote:
>
> Please look at http://www.namesys.com/benchmarks/v4marks.html

It says "but since most users use ext3 with only meta-data journaling"
which isn't really correct.  ext3's metadata-only journalling mode is
writeback mode.

Most people in fact use ext3's ordered mode, which provides the same data
consistency guarantees on recovery as data journalling.

Please compare against the ext3 in -mm.  It has tweaks which aren't yet
merged, but which will be submitted soon.
