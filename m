From: Will Dyson <will_dyson@pobox.com>
Subject: Re: silent semantic changes with reiser4
Date: Mon, 30 Aug 2004 23:14:08 -0400
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <4133ED00.2070101@pobox.com>
References: <20040824202521.GA26705@lst.de>	<412CEE38.1080707@namesys.com> <20040825152805.45a1ce64.akpm@osdl.org> <412D9FE6.9050307@namesys.com> <412E10A2.1020801@pobox.com> <412EEC07.30707@namesys.com> <412F7B6D.6010305@pobox.com> <4130566C.8020604@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <4130566C.8020604@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: Andrew Morton <akpm@osdl.org>, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, torvalds@osdl.org, reiserfs-list@namesys.com

Hans Reiser wrote:
> I think there are two ways to analyze the code boundary issue.  One is 
> "does it belong in the kernel?"  Another is, "does it belong in the 
> filesystem. and if so should name resolution in a filesystem be split 
> into two parts, one in kernel, and one in user space."  In ten years I 
> might have the knowledge needed to make such a split, but I know for 
> sure that I don't know how to do it today without regretting it 
> tomorrow, and I don't really have confidence that I will ever be able to 
> do it without losing performance.

I don't see how exporting a set of indices on file attributes to 
userspace constitutes putting part of the name resolution into 
userspace. A file's name (or names, in the case of hardlinks) would 
still be determined entirely within the filesystem.

The more I think about it, the more I am convinced that "the index" is 
the correct primative to use for exposing any filesystem's fast 
searching features.

-- 
Will Dyson
"Back off man, I'm a scientist!" -Dr. Peter Venkman
