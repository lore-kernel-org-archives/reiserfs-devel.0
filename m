From: Hans Reiser <reiser@namesys.com>
Subject: Re: [PATCH] reiserfs: fix handling of device names with /'s in them
Date: Thu, 13 Jul 2006 00:34:43 -0700
Message-ID: <44B5F793.1000100@namesys.com>
References: <44B52674.8060802@suse.com>	<20060712175542.108e6e37.akpm@osdl.org>	<44B5C353.9060007@namesys.com> <20060712210027.8d7a2ddc.akpm@osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28986-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060712210027.8d7a2ddc.akpm@osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@osdl.org>
Cc: jeffm@suse.com, reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

Who exactly is failing to handle the slashes, forgive me for my
confusion in asking?

Hans

Andrew Morton wrote:

> Software sucks, and we get along better by not provoking it. So don't put
>
>spaces, let alone slashes into strings which we offer to userspace.
>
>
>  
>

